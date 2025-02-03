<script setup lang="ts">
const user = useSupabaseUser();

// Get redirect path from cookies
const cookieName = useRuntimeConfig().public.supabase.cookieName;
console.log("🚀 ~ cookieName:", cookieName);
const redirectPath = useCookie(`${cookieName}-redirect-path`).value;

console.log("🚀 ~ redirectPath:", redirectPath);
watch(
  user,
  () => {
    console.log("🚀 ~ user:", user);
    if (user.value) {
      console.log("🚀 ~ redirectPath: 1", redirectPath);
      // Clear cookie
      useCookie(`${cookieName}-redirect-path`).value = null;
      // Redirect to path
      console.log("🚀 ~ redirectPath: 2", redirectPath);
      return navigateTo(redirectPath || "/");
    }
  },
  { immediate: true }
);
</script>
<template>
  <div>Waiting for login...</div>
</template>
