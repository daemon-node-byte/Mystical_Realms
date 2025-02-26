/**
 * Parses a translate string in the format `translate(xpx, ypx)` and extracts the x and y values.
 *
 * @param {string} translateStr - The translate string to parse.
 * @returns {{ x: number, y: number }} An object containing the x and y values as numbers.
 * @throws Will throw an error if the translate string is invalid.
 */
export default function parseTranslateString(translateStr: string) {
  const matches = translateStr.match(/translate\((\d+)px, (\d+)px\)/)
  if (!matches) {
    createError('Invalid translate string')
  }
  return {
    x: parseInt(matches?.[1] ?? '0'),
    y: parseInt(matches?.[2] ?? '0')
  }
}
