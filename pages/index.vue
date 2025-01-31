<script setup lang="ts">
import { CustomHeroCta } from "#components";
const servicesElem = useTemplateRef<HTMLDivElement>("services");
</script>
<template>
  <div>
    <CustomHeroCta :scroll-elem-ref="servicesElem" />
    <div ref="services" class="h-screen">
      <h3 class="text-center mt-14 text-3xl font-bold">Explore and Discover</h3>
    </div>
  </div>
</template>
