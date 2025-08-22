# Arquitectura (C4)

## Contexto
La app asiste a profesionales y pacientes en kinesiología: turnos, rutinas con multimedia, seguimiento clínico, mensajería y ayuda guiada por IA. (Ver alcance del anteproyecto.)

## Contenedores
- **Mobile App (Flutter)**: UI, captura de cámara, validación de ejercicios on-device.
- **API (Supabase / Edge Functions)**: endpoints REST sobre Postgres.
- **DB (Postgres)**: usuarios, pacientes, rutinas, sesiones, turnos, mensajes, logs.
- **Storage**: medios (imágenes/gifs) con URLs firmadas.
- **Notificaciones (FCM)**: recordatorios de turnos y rutinas.

## Módulo IA (V1)
- Pose en dispositivo (TFLite/MediaPipe). Se calculan ángulos y reglas por ejercicio.
- Persistimos **métricas** (reps/tiempo/errores) y no video crudo.

## Seguridad y privacidad
- TLS, JWT, roles por recurso.
- Mínima retención y consentimiento informado.

## Esquema de datos (borrador)
- `users(id, email, role)`
- `patients(id, user_id, profile)`
- `professionals(id, user_id, license)`
- `appointments(id, patient_id, professional_id, start_at, status)`
- `exercises(id, name, description, media_url)`
- `routines(id, patient_id, title)`
- `routine_exercises(routine_id, exercise_id, order, target_reps)`
- `sessions(id, routine_id, started_at, completed_at)`
- `pose_checks(session_id, exercise_id, rep, angle_error, notes)`
- `messages(id, from_user, to_user, content, created_at)`
- `progress_logs(id, patient_id, pain_scale, notes, created_at)`

## Flujo principal (MVP)
1. Login → perfil.
2. Turnos: crear/reprogramar/cancelar.
3. Rutinas: ver asignadas y marcar progreso.
4. Cámara: guía para 1–2 ejercicios (sentadilla, elevación lateral).
5. Mensajería básica y FAQ/Chatbot con derivación.