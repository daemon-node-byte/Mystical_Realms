<script setup lang="ts">
import { CustomHeroCta } from "#components";
const servicesElem = useTemplateRef<HTMLDivElement>("services");
const links = useSitePageLinkData().navigation.tarot.filter(
  (link) => link.active
);
</script>
<template>
  <div>
    <CustomHeroCta :scroll-elem-ref="servicesElem && servicesElem" />
    <div ref="services" class="h-screen">
      <h3 class="text-center mt-14 text-3xl font-bold">Explore and Discover</h3>
      <div
        class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 mt-8 px-4"
      >
        <div
          v-for="link in links"
          :key="link.title"
          class="flex gap-2 px-4 dark:bg-neutral-800 bg-neutral-800 border-2 border-black dark:border-white shadow-lg p-4 rounded-lg cursor-pointer hover:border-primary hover:transition-all hover:duration-300 hover:ease-out"
          @click="() => navigateTo(link.href)"
        >
          <div class="h-full flex flex-col items-center justify-center">
            <Icon
              :name="link.icon"
              mode="svg"
              class="text-4xl align-middle card-icon-svg"
              size="64"
            />
          </div>
          <div class="pl-2">
            <h4 class="text-xl font-bold">{{ link.title }}</h4>
            <p class="mt-2">{{ link.description }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style>
.card-icon-svg path {
  fill: #fff;
}
</style>
