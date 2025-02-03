import { reactive } from 'vue';

const catalogFilterStore = reactive({
  all: true,
  major: false,
  minor: false,
  court: false,
  cups: false,
  pentacles: false,
  swords: false,
  wands: false,
});

function toggleFilter(filter: keyof typeof catalogFilterStore) {
  catalogFilterStore[filter] = !catalogFilterStore[filter];
}

export const store = { ...catalogFilterStore, toggleFilter };


