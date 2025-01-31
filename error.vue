<script setup lang="ts">
import type { NuxtError } from "#app";
import { ShaButton } from "#components";

const props = defineProps({
  error: Object as () => NuxtError,
});
</script>

<template>
  <div class="flex flex-col justify-center items-center min-h-[100vh]">
    <h1 class="theme-font text-6xl">{{ error?.statusCode }}</h1>
    <h3 v-if="error?.statusMessage">{{ error?.statusMessage }}</h3>
    <ShaButton class="mt-4" to="/" variant="outline" @click="$router.back()"
      >Go back</ShaButton
    >
  </div>
</template>
