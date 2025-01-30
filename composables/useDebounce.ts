import { ref, watch } from 'vue';
export default function useDebounce(value: any, delay: number) {
  const debouncedValue = ref(value.value)
  let timeout: NodeJS.Timeout;
  watch(value, (newValue) => {
    clearTimeout(timeout);
    timeout = setTimeout(() => {
      debouncedValue.value = newValue;
    }, delay)
  })
}
