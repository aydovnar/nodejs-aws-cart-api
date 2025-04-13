create extension if not exists "uuid-ossp";

create table if not exists  carts (
    id uuid not null default uuid_generate_v4() primary key,
    user_id uuid not null,
    created_at timestamp not null,
    updated_at timestamp not null,
    status varchar(10) check (status in ('OPEN', 'ORDERED')) not null
);

create table if not exists  cart_items (
    cart_id uuid not null references carts(id) on delete cascade,
    product_id uuid not null,
    count integer not null check (count > 0)
);

insert into carts (id, user_id, created_at, updated_at, status) values
    ('3828428a-71fe-4981-9362-c062dd0a3a5c ', 'c537e2b2-a00e-40b3-a41f-012015e48712', now(), now(), 'OPEN'),
    ('3828428a-71fe-4981-9362-c062dd0a3a5d', 'c537e2b2-a00e-40b3-a41f-012015e48715', now(), now(), 'ORDERED');
('3828428a-71fe-4981-9362-c062dd0a3a5e', 'c537e2b2-a00e-40b3-a41f-012015e48717', now(), now(), 'ORDERED');

insert into cart_items (cart_id, product_id, count) values
    ('3828428a-71fe-4981-9362-c062dd0a3a5c', 'c537e2b2-a00e-40b3-a41f-012015e48712', 3),
    ('3828428a-71fe-4981-9362-c062dd0a3a5d', 'c537e2b2-a00e-40b3-a41f-012015e48715', 4),
    ('3828428a-71fe-4981-9362-c062dd0a3a5e', 'c537e2b2-a00e-40b3-a41f-012015e48717', 3);
