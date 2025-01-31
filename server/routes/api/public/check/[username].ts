import { serverSupabaseClient } from "#supabase/server"
export default defineEventHandler(async (event) => {
  const username = getRouterParam(event, 'username')
  
  const supabase = await serverSupabaseClient(event)

  if (!username) {
    return { status: 400, body: 'Username is required' }
  }
  const { data: profiles, error } = await supabase.from('profiles').select('*').eq('username', username)

  if (error) { 
    return { status: 500, body: error.message }
  }

  if (profiles && profiles.length > 0) {
    return { status: 200, body: 'Username already taken' }
  } else {
    return { status: 404, body: 'Username available' }
  }
})
