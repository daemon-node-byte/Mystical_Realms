import { ref, onMounted, onUnmounted } from 'vue';

export default function useInViewport(el: HTMLElement | null) {
  const inView = ref(false);
  const element = ref(el)
  const observer = new IntersectionObserver(
    ([entry]) => {
      inView.value = entry.isIntersecting;
    },
    {
      threshold: 0.5,
    }
  );

  onMounted(() => {
    if (element.value) {
      observer.observe(element.value);
    }
  });

  onUnmounted(() => {
    observer.disconnect();
  });

  return inView;
}
