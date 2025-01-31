<script setup lang="ts">
const { $anime } = useNuxtApp();

const props = defineProps({
  scrollElemRef: {
    type: Object as PropType<HTMLDivElement | null>,
    required: true,
  },
});

const startJourney = () => {
  if (!props.scrollElemRef) return;
  props.scrollElemRef.scrollIntoView({ behavior: "smooth" });
};
onMounted(() => {
  $anime({
    targets: ".cta-text p",
    keyframes: [
      { opacity: 0, translateY: 100 },
      { opacity: 1, translateY: 0 },
    ],
    easing: "easeOutExpo",
    duration: 2000,
    visibility: "visible",
    delay: $anime.stagger(500),
  });

  $anime({
    targets: ".cta-btn",
    keyframes: [
      { opacity: 0, translateX: 100 },
      { opacity: 1, translateX: 0 },
    ],
    easing: "easeOutExpo",
    duration: 1500,
    visibility: "visible",
    delay: 2500,
  });
  $anime({
    targets: ".cta-btn-mobile",
    keyframes: [
      { opacity: 0, translateY: 100 },
      { opacity: 1, translateY: 0 },
    ],
    easing: "easeOutExpo",
    duration: 2000,
    visibility: "visible",
    delay: 2500,
  });
});
</script>
<template>
  <div class="image-bg h-screen w-full">
    <div class="w-full max-w-[900px] mx-auto flex md:flex-row">
      <div class="w-full md:w-3/5 max-h-min">
        <div class="cta-text !text-white">
          <p>Explore, discover and learn</p>
          <p>in the Mystical Realms</p>
          <p>of the cards, in the stars</p>
          <p>and within you.</p>
        </div>
        <div class="md:hidden w-full text-center pt-8">
          <ShaButton @click="startJourney" class="cta-btn-mobile">
            Start your journey
          </ShaButton>
        </div>
      </div>
      <div class="hidden md:flex md:w-2/5 md:justify-center md:items-center">
        <ShaButton @click="startJourney" class="cta-btn">
          Start your journey
        </ShaButton>
      </div>
    </div>
  </div>
</template>
<style scoped>
.image-bg {
  background: linear-gradient(0deg, rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.5)),
    url(../../assets/img/hero-bg.jpg) no-repeat center center fixed;
  background-size: cover;
}
.cta-btn,
.cta-btn-mobile,
.cta-text p {
  opacity: 0;
}
</style>
