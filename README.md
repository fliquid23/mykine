# App Kinesiología – Tesis

Monorepo con:
- **/mobile**: app Flutter (Android primero)
- **/api**: API (Supabase Edge Functions *o* NestJS) + OpenAPI
- **/docs**: documentación académica y técnica
- **/infra**: IaC / scripts

## Quickstart
1. Clonar repo y crear ramas `develop` y `main` (protegida).
2. Crear `.env` desde `.env.example`.
3. Levantar backend dev.
4. Correr app móvil en emulador Android.

## Decisiones clave
- Flutter (Clean Architecture + Riverpod + go_router)
- Backend inicial: **Supabase** (Auth, Postgres, Storage) para acelerar MVP.
- IA en dispositivo: MediaPipe/BlazePose (TFLite) – no se sube video, sólo métricas.

## Documentación
- `docs/ARCHITECTURE.md`
- `docs/openapi.yaml`
- `docs/ADR/*`
- `docs/copilot-instructions.md`
