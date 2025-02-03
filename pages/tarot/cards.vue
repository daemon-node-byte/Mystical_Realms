<script setup lang="ts">
const filterStore = store;
const filterList = [
  { label: "Major", value: "major" },
  { label: "Minor", value: "minor" },
  { label: "Court", value: "court" },
  { label: "All", value: "all" },
  { label: "Cups", value: "cups" },
  { label: "Pentacles", value: "pentacles" },
  { label: "Swords", value: "swords" },
  { label: "Wands", value: "wands" },
];
const filterCardsBy = () => {
  const results = [];
};
const supabase = useSupabaseClient();
const { data: cards } = useAsyncData("cards", async () => {
  const { data } = await supabase.from("cards").select("*");

  return data;
});
</script>
<template>
  <div class="">
    <CustomCatalogActions :filter-list="filterList" />
    <div class="flex flex-col md:flex-row md:flex-wrap">
      <div
        v-for="card in cards"
        :key="card.slug_id"
        class="w-52 mx-auto my-2 -z-10"
      >
        <nuxt-img
          :src="`/assets/img/rws_inspired_art_deck/${card.slug_id}.webp`"
          :alt="card.title + ' card image'"
          placeholder
          loading="lazy"
          v-slot="{ src, isLoaded, imgAttrs }"
        >
          <img
            v-if="isLoaded"
            v-bind="imgAttrs"
            :src="src"
            :alt="card.title + ' card'"
          />
          <img v-else alt="loading" src="https://placeholder.co/400x400" />
        </nuxt-img>
      </div>
    </div>
  </div>
</template>
