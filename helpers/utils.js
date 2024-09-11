export function containsOnlySpecificChars(str, allowedChars) {
  const regex = new RegExp(`^[${allowedChars}]+$`);
  return regex.test(str);
}
