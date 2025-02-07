<script setup lang="ts">
import Moveable from "vue3-moveable";
const moveableRef = ref<HTMLElement | null>(null);
const targetRef = ref<HTMLElement | null>(null);
const boundsRef = ref<HTMLElement | null>(null);

const onDrag = (e: any) => {
  e.target.style.transform = e.transform;
};

const cards = ref(["target1", "target2", "target3"]);
</script>

<template>
  <div class="root">
    <div class="container">
      <div
        ref="boundsRef"
        class="relative bg-neutral-500 border-4 border-neutral-300 h-[400px] w-4/5 mx-auto"
      >
        <div
          ref="targetRef"
          v-for="target in cards"
          :class="`h-[60px] w-[40px] target ${target}`"
          :key="target"
        >
          {{ target }}
        </div>
        <Moveable
          ref="moveableRef"
          :target="targetRef"
          :individualGroupable="true"
          :draggable="true"
          :throttleDrag="1"
          :edgeDraggable="false"
          :snapElement="true"
          :elementSnapDirections="{
            left: true,
            top: true,
            right: true,
            bottom: true,
            center: true,
            middle: true,
          }"
          :maxSnapElementGapDistance="80"
          :maxSnapElementGuidelineDistance="100"
          :elementGuidelines="cards.map((x) => `.${x}`)"
          :snapGridAll="true"
          :snappable="true"
          :snapContainer="boundsRef"
          :snapCenter="true"
          :snapDigit="0"
          :snapDirections="{
            top: true,
            left: true,
            bottom: true,
            right: true,
            center: true,
          }"
          :horizontalGuidelines="[
            0, 50, 100, 150, 200, 250, 300, 350, 400, 450, 500,
          ]"
          :verticalGuidelines="[0, 100, 200, 300, 400, 500]"
          :isDisplayInnerSnapDigit="true"
          :isDisplaySnapDigit="true"
          :bounds="{ left: 0, top: 0, bottom: 0, right: 0, position: 'css' }"
          @drag="onDrag"
          v-for="target in cards"
          :key="target"
        />
      </div>
    </div>
  </div>
</template>
