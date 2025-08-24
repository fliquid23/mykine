// Deno (Supabase Edge Function)
import { serve } from "https://deno.land/std@0.203.0/http/server.ts";
import { z } from "https://deno.land/x/zod@v3.22.4/mod.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const Body = z.object({
  patient_id: z.string(),
  professional_id: z.string(),
  start_at: z.string().datetime(),
});

serve(async (req) => {
  try {
    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_ANON_KEY")!
    );

    const json = await req.json();
    const body = Body.parse(json);

    const { error } = await supabase.from("appointments").insert({
      patient_id: body.patient_id,
      professional_id: body.professional_id,
      start_at: body.start_at,
      status: "scheduled",
    });

    if (error) {
      return new Response(JSON.stringify({ error: error.message }), {
        status: 400,
        headers: { "Content-Type": "application/json" },
      });
    }

    return new Response(JSON.stringify({ ok: true }), {
      headers: { "Content-Type": "application/json" },
      status: 201,
    });
  } catch (e) {
    return new Response(JSON.stringify({ error: e.message }), {
      status: 422,
      headers: { "Content-Type": "application/json" },
    });
  }
});
