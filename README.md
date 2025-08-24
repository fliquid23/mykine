# MyKine – Monorepo (Tesis Kinesiología)

Monorepo con:
- **/mobile**: app Flutter (Android primero)
- **/api**: Supabase Edge Functions (TypeScript/Deno)
- **/docs**: documentación técnica y académica
- **/.github**: CI/CD (GitHub Actions)

## Quickstart
1) Crear archivo `.env` desde `.env.example`.
2) Backend: crear proyecto en Supabase y una Edge Function (ver `api/functions/create_appointment`).
3) Mobile: `flutter pub get` y ejecutar con `--dart-define=API_BASE_URL=<tu-api>`.
4) CI: al abrir un PR contra `develop`, corre lint/test de mobile y api.

## Decisiones
- Flutter + Riverpod + go_router, app Android primero.
- Supabase: Postgres, Auth, Storage + Edge Functions para MVP.
- IA on-device (a futuro): MediaPipe/BlazePose (TFLite); no subir video, sólo métricas.

## Documentación
- `docs/ARCHITECTURE.md`
- `docs/openapi.yaml`
- `docs/ADR/0001-elegir-flutter-supabase.md`
- `docs/copilot-instructions.md`
