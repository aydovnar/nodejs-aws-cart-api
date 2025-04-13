import { NestFactory } from '@nestjs/core';
import { configure } from '@codegenie/serverless-express';
import { Callback, Context, Handler } from 'aws-lambda';
import helmet from 'helmet';
import * as dotenv from 'dotenv';
import { AppModule } from './app.module';

dotenv.config();

let server: Handler;

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  app.use(helmet());

  await app.init();

  const expressApp = app.getHttpAdapter().getInstance();
  return configure({ app: expressApp });
}

export const handler = async (
  event: any,
  context: Context,
  callback: Callback,
) => {
  try {
    if (!server) {
      server = await bootstrap();
    }

    return await server(event, context, callback);
  } catch (error) {
    throw error;
  }
};
