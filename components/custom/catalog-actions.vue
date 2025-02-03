<script setup lang="ts">
const props = defineProps<{
  filterList: { label: string; value: string }[];
}>();
</script>
<template>
  <ShaPopover>
    <ShaPopoverTrigger class="fixed bottom-3 left-3">
      <div
        class="w-10 h-10 rounded-full bg-primary z-10 flex items-center justify-center"
      >
        <Icon name="mdi:filter" />
      </div>
    </ShaPopoverTrigger>
    <ShaPopoverContent class="dark:bg-neutral-700 bg-neutral-300 space-y-3">
      <div
        v-for="filter in props.filterList"
        :key="filter.value"
        class="flex flex-row items-center"
      >
        <ShaCheckbox :id="filter.value" />
        <ShaLabel :for="filter.value" class="pl-2 text-small"
          >Show {{ filter.value }}</ShaLabel
        >
      </div>
    </ShaPopoverContent>
  </ShaPopover>
</template>
