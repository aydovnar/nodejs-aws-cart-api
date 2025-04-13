# Stage 1: Dependencies
FROM node:18-alpine AS deps
WORKDIR /app

# Copy only package files
COPY package*.json ./

# Install production dependencies only with specific optimizations
RUN npm ci --only=production --no-audit --no-optional && \
    npm cache clean --force

# Stage 2: Builder
FROM node:18-alpine AS builder
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json tsconfig.json ./
COPY src/ ./src/

# Install all dependencies and build
RUN npm ci && \
    npm run build && \
    npm cache clean --force

# Stage 3: Production
FROM node:18-alpine AS runner
WORKDIR /app

# Create non-root user
RUN addgroup --system --gid 1001 nodejs && \
    adduser --system --uid 1001 nodejs

# Copy only necessary production files
COPY --from=builder /app/dist ./dist
COPY --from=deps /app/node_modules ./node_modules
COPY package.json ./

# Clean up and optimize
RUN npm cache clean --force && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    find /app/node_modules -type f -name "*.d.ts" -delete && \
    find /app/node_modules -type f -name "*.map" -delete && \
    find /app/node_modules -type d -name "test" -exec rm -rf {} + 2>/dev/null || true && \
    find /app/node_modules -type d -name "tests" -exec rm -rf {} + 2>/dev/null || true && \
    find /app/node_modules -type d -name "docs" -exec rm -rf {} + 2>/dev/null || true && \
    find /app/node_modules -type d -name "example" -exec rm -rf {} + 2>/dev/null || true && \
    find /app/node_modules -type d -name "examples" -exec rm -rf {} + 2>/dev/null || true

# Set ownership
RUN chown -R nodejs:nodejs /app

# Switch to non-root user
USER nodejs

# Set environment variables
ENV NODE_ENV=production \
    PORT=4000

# Expose port
EXPOSE 4000

# Start the application
CMD ["node", "dist/src/main"]
