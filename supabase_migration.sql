-- Despensa JL - ampliación de la base creada anteriormente.
-- Ejecutar en Supabase > SQL Editor > New query > Run.

alter table productos add column if not exists foto text;
alter table productos add column if not exists proveedor text;
alter table productos add column if not exists orden integer default 0;
alter table productos add column if not exists demo boolean default false;

alter table ventas add column if not exists usuario text;
alter table ventas add column if not exists items jsonb;
alter table ventas add column if not exists medio_pago text;

create table if not exists cierres_caja (
 id uuid primary key default gen_random_uuid(),
 fecha timestamptz default now(),
 usuario text,
 efectivo_esperado numeric default 0,
 efectivo_contado numeric default 0,
 diferencia numeric default 0,
 observaciones text
);

create table if not exists compras (
 id uuid primary key default gen_random_uuid(),
 fecha timestamptz default now(),
 proveedor text,
 observaciones text,
 items jsonb not null default '[]'::jsonb
);

create table if not exists usuarios_demo (
 id uuid primary key default gen_random_uuid(),
 nombre text not null,
 rol text not null default 'Vendedor',
 pin_hash text not null,
 activo boolean default true
);

alter table cierres_caja enable row level security;
alter table compras enable row level security;
alter table usuarios_demo enable row level security;

create policy "cierres_publicos_demo" on cierres_caja for all using (true) with check (true);
create policy "compras_publicas_demo" on compras for all using (true) with check (true);
create policy "usuarios_publicos_demo" on usuarios_demo for all using (true) with check (true);

-- NOTA: estas políticas son para la versión de prueba. Para uso real conviene
-- activar Supabase Auth y políticas RLS por usuario/rol antes de publicar la app.
