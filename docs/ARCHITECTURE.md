# Arquitectura (C4) – MyKine

## Contexto
App de kinesiología: turnos, rutinas con multimedia, seguimiento básico, mensajería y ayuda (bot). Android primero.

## Contenedores
- **Mobile (Flutter)**: UI, autenticación, consumo de API, cámara en futuro.
- **API (Supabase Edge Functions)**: endpoints REST sobre Postgres.
- **DB (Postgres)**: usuarios, pacientes, profesionales, turnos, rutinas, sesiones, mensajes, métricas.
- **Storage**: medios (imágenes/gifs) con URLs firmadas.
- **Notificaciones (FCM)**: recordatorios.

## Seguridad y privacidad
- TLS, JWT, principio de mínimo privilegio.
- No guardar video crudo; sólo métricas agregadas con consentimiento.

## Esquema mínimo (borrador)
- `users(id, email, role)`
- `patients(id, user_id, full_name)`
- `professionals(id, user_id, license)`
- `appointments(id, patient_id, professional_id, start_at, status)`
- `exercises(id, name, description, media_url)`
- `routines(id, patient_id, title)`
- `routine_exercises(routine_id, exercise_id, "order", target_reps)`
- `messages(id, from_user, to_user, content, created_at)`
- `sessions(id, routine_id, started_at, completed_at)`
- `pose_checks(session_id, exercise_id, rep, angle_error, notes)`
