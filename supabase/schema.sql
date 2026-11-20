-- Execute este SQL no SQL Editor do seu projeto Supabase.
create table if not exists public.aves (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null references auth.users(id) on delete cascade,
 nome text not null,
 especie text not null,
 sexo text not null default 'Não informado',
 anilha text,
 nascimento date,
 gaiola text,
 observacoes text,
 created_at timestamptz not null default now()
);
alter table public.aves enable row level security;
create policy "Cada usuário vê suas próprias aves" on public.aves for select using (auth.uid() = user_id);
create policy "Cada usuário cadastra suas próprias aves" on public.aves for insert with check (auth.uid() = user_id);
create policy "Cada usuário atualiza suas próprias aves" on public.aves for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Cada usuário exclui suas próprias aves" on public.aves for delete using (auth.uid() = user_id);
create index if not exists aves_user_id_idx on public.aves(user_id);
