# Criando Aves

Aplicação web de gestão de criadores de aves, feita com React, Vite e Supabase. Inclui login por e-mail/senha e Google, além do cadastro básico de aves.

## Requisitos
- Node.js 20 ou superior
- Projeto Supabase configurado

## Executar localmente
1. Instale dependências: `npm install`
2. Copie `.env.example` para `.env`.
3. No `.env`, preencha `VITE_SUPABASE_ANON_KEY` com a chave **Publishable** do Supabase (Settings → API Keys). Não use `service_role` nem Secret key.
4. Execute `npm run dev`.

## Publicar no Render
Criar um **Static Site** conectado a este repositório:
- Build Command: `npm install && npm run build`
- Publish Directory: `dist`

Adicionar estas variáveis em Environment:
- `VITE_SUPABASE_URL` = `https://fkixumygouldydvlplnh.supabase.co`
- `VITE_SUPABASE_ANON_KEY` = sua chave Publishable do Supabase

Depois de publicar, adicionar o domínio do Render em Supabase → Authentication → URL Configuration → Redirect URLs. Também atualizar a URL Site URL se desejar usar o domínio como endereço principal.

Nunca envie `.env` ao GitHub. O `.gitignore` já bloqueia esse arquivo.

## Observações
- O provedor Google já foi configurado no painel do Supabase. O código usa `signInWithOAuth` com `provider: 'google'`.
- O OAuth do Google precisa permitir o domínio publicado na lista de URLs de redirecionamento do Supabase Auth.
- Os módulos Reprodução, Gaiolas, Financeiro e Relatórios ainda são áreas planejadas; não estão implementados nesta versão.
