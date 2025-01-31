/**
 * Creates a debounced function that delays invoking the provided callback until after the specified delay has elapsed
 * since the last time the debounced function was invoked.
 *
 * @param {Function} callback - The function to debounce.
 * @param {number} delay - The number of milliseconds to delay.
 * @returns {Function} - Returns the new debounced function.
 */
export default function useDebounceFunc(callback: Function, delay: number): Function {
  let timeout: NodeJS.Timeout;
  return (...args: any[]) => {
    clearTimeout(timeout);
    timeout = setTimeout(() => {
      callback(...args);
    }, delay)
  } 
}
