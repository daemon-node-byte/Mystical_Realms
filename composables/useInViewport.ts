export default function useInViewport(el: string) {
  const inView = ref(false);
  const element = useTemplateRef<HTMLElement>(el)
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
