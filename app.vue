<template>
  <div id="root-app" :class="`${$colorMode.value}-mode`">
    <NuxtLayout>
      <NuxtPage />
    </NuxtLayout>
    <ShaToaster />
  </div>
</template>
