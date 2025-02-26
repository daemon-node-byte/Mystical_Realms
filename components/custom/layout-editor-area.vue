<script setup lang="ts">
import Moveable, { type OnDrag } from "vue3-moveable";
const moveableRef = ref<HTMLDivElement | null>(null);
const targetRef = ref<HTMLDivElement | null>(null);
const boundsRef = ref<HTMLDivElement | null>(null);

const handleClick = ({ target }: { target: HTMLElement | SVGElement }) => {
  target.focus();
}

const handleDrag = ({ target, transform, translate, width: targetWidth, height: targetHeight }: OnDrag) => {
  target.focus();
  target.style.transform = transform;
  console.log("🚀 ~ handleDrag ~ transform:", transform)
  // target.style.transform = transform; // transform: translate(?px, ?px) from top left corner
  // if (boundsRef.value) {
  //   const { width: containerWidth, height: containerHeight } = boundsRef.value.getBoundingClientRect();
  //   const [left, top] = translate; // position of the target with in the container
  //   const leftPercentage = ((targetWidth / 2 * left) / containerWidth) * 100;
  //   const topPercentage = ((targetHeight / 2 * top) / containerHeight) * 100;
  //   target.dataset.leftPercent = `${leftPercentage}`;
  //   target.dataset.topPercent = `${topPercentage}`;
  // }
};

const handleKeyPress = (e: KeyboardEvent) => {
  console.log("🚀 ~ handleKeyPress ~ ", e)
}

const autoSaveToLocalStorage = () => {

}

const handleDragEnd = () => {

}

const cards = ref([{ id: 'target1', seq: 1, translate: { x: 0, y: 0 } }]);

const addCard = () => {
  const index = cards.value.length + 1;
  cards.value.push({ id: `target${index}`, seq: index, translate: { x: 5 * index, y: 5 * index } });
};



</script>

<template>
  <div class="root">

    <div class="w-full">

      <div ref="boundsRef"
        class="relative flex flex-row justify-center items-center bg-neutral-700 border border-neutral-300 h-[400px] max-w-sm mx-auto">
        <Moveable ref="moveableRef" class="absolute" v-for="target in cards" :key="target.id"
          :target="cards.map(x => `.${x.id}`)" :individualGroupable="true" :draggable="true" :throttleDrag="1"
          :edgeDraggable="false" :snapElement="true" :elementSnapDirections="{
            left: true,
            top: true,
            right: true,
            bottom: true,
            center: true,
            middle: true,
          }" :maxSnapElementGapDistance="80" :maxSnapElementGuidelineDistance="100"
          :elementGuidelines="cards.map((x) => `.${x.id}`)" :snapGridAll="true" :snappable="true"
          :snapContainer="boundsRef" :snapCenter="true" :snapDigit="0" :snapDirections="{
            top: true,
            left: true,
            bottom: true,
            right: true,
            center: true,
          }" :horizontalGuidelines="[
            0, 50, 100, 150, 200, 250, 300, 350, 400, 450, 500,
          ]" :verticalGuidelines="[0, 100, 200, 300, 400, 500]" :isDisplayInnerSnapDigit="true"
          :isDisplaySnapDigit="true" :bounds="{ left: 0, top: 0, bottom: 0, right: 0, position: 'css' }"
          @drag="handleDrag" @press="handleClick" @click="handleClick" />

        <button v-for="target in cards" :class="`h-auto absolute w-[35px] target ${target.id}`" :key="target.id"
          @keypress="handleKeyPress" :style="turncateTranslate(target.translate) + ';'">
          <NuxtImg ref="targetRef" src="/assets/img/rws_inspired_art_deck/card_back.webp" alt="card back"
            class="-z-10" />
        </button>
      </div>
      <button class="bg-neutral-400 p-4" @click="addCard">Add Card</button>
    </div>
  </div>
</template>

<style>
.moveable-control.moveable-origin {
  border: 0px solid transparent !important;
  background: transparent !important;
}

.moveable-line.moveable-direction {
  background: transparent !important;
}
</style>
