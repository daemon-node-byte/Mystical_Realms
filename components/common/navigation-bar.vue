<script setup lang="ts">
import type { LinkType } from "~/types/sitePageLinkData.types";

const tarotLinks = useSitePageLinkData().navigation.tarot.filter(
  (link: LinkType) => link.active
);
</script>

<template>
  <nav
    class="sticky top-0 flex justify-between items-center py-2 md:py-4 px-4 md:px-8 bg-neutral-50 dark:bg-neutral-950"
  >
    <div class="flex items-center space-x-2">
      <Icon
        name="mr-icons:logo"
        mode="css"
        class="text-xl md:text-3xl fill-indigo-700 dark:fill-indigo-300"
      />
      <NuxtLink class="theme-font text-xl md:text-3xl" to="/">
        Mystical Realms
      </NuxtLink>
    </div>
    <ShaNavigationMenu class="hidden md:flex">
      <ShaNavigationMenuList>
        <ShaNavigationMenuItem>
          <ShaNavigationMenuTrigger>Tarot</ShaNavigationMenuTrigger>
          <ShaNavigationMenuContent>
            <div class="max-w-[300px] w-[270px] py-4 px-6">
              <ShaNavigationMenuLink
                v-for="link in tarotLinks"
                :key="link.href"
                @click="() => $router.push(link.href)"
                class="hover:!bg-neutral-700 !cursor-pointer"
              >
                <NuxtLink class="text-lg" :to="link.href">
                  {{ link.title }}
                </NuxtLink>
                <p class="text-xs text-muted">{{ link.description }}</p>
              </ShaNavigationMenuLink>
            </div>
          </ShaNavigationMenuContent>
        </ShaNavigationMenuItem>
      </ShaNavigationMenuList>
    </ShaNavigationMenu>

    <div class="hidden md:flex items-center space-x-4">
      <ShaButton
        class="ml-4 hover:gradient-bg transition-all ease-in-out duration-100"
        variant="outline"
        @click="() => $router.push('/auth/login')"
      >
        <Icon name="mdi:login" size="24" />
      </ShaButton>
      <CommonColorModeToggle />
    </div>
    <div class="block md:hidden">
      <ShaDropdownMenu>
        <ShaDropdownMenuTrigger asChild>
          <Icon name="cil:hamburger-menu" size="28" />
        </ShaDropdownMenuTrigger>
        <ShaDropdownMenuContent align="end">
          <CommonColorModeToggle />
          <ShaDropdownMenuSeparator />
          <ShaDropdownMenuItem>
            <NuxtLink to="/auth/login">Login</NuxtLink>
          </ShaDropdownMenuItem>
          <ShaDropdownMenuItem>
            <NuxtLink to="/auth/register"
              >Register</NuxtLink
            ></ShaDropdownMenuItem
          >
          <ShaDropdownMenuSeparator />

          <ShaDropdownMenuLabel>Tarot</ShaDropdownMenuLabel>
          <ShaDropdownMenuSeparator />

          <ShaDropdownMenuItem v-for="link in tarotLinks" :key="link.href">
            <NuxtLink :to="link.href">
              {{ link.title }}
            </NuxtLink>
          </ShaDropdownMenuItem>
        </ShaDropdownMenuContent>
      </ShaDropdownMenu>
    </div>
  </nav>
</template>
