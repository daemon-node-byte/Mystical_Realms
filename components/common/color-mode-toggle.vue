<script setup lang="ts">
const colorMode = useColorMode();
</script>

<template>
  <ShaDropdownMenu>
    <ShaDropdownMenuTrigger asCchild>
      <ShaButton variant="outline">
        <Icon
          name="radix-icons:moon"
          class="h-[1.2rem] w-[1.2rem] rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0"
        />
        <Icon
          name="radix-icons:sun"
          class="absolute h-[1.2rem] w-[1.2rem] rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100"
        />
        <span class="sr-only">Toggle theme</span>
      </ShaButton>
    </ShaDropdownMenuTrigger>
    <ShaDropdownMenuContent align="end">
      <ShaDropdownMenuItem @click="colorMode.preference = 'light'">
        Light
      </ShaDropdownMenuItem>
      <ShaDropdownMenuItem @click="colorMode.preference = 'dark'">
        Dark
      </ShaDropdownMenuItem>
      <ShaDropdownMenuItem @click="colorMode.preference = 'system'">
        System
      </ShaDropdownMenuItem>
    </ShaDropdownMenuContent>
  </ShaDropdownMenu>
</template>
