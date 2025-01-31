import { serverSupabaseClient } from "#supabase/server"

export default defineEventHandler(async (event) => { 
  const supabase = await serverSupabaseClient(event)

  const { data: cards, error } = await supabase.from('cards').select('*')
  if (error) {
    return { status: 500, body: error.message }
  }
  return { status: 200, body: cards }

});
