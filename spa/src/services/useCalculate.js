import { DIGITS, OPERATORS } from "@/store/constants";

export default {
  isOperator(string) {
    return OPERATORS.includes(string);
  },
  lastCharIsOperator(string) {
    const stringNormalized = string.replace(/\s/g, "");
    return this.isOperator(stringNormalized[stringNormalized.length - 1]);
  },
  isDigit(string) {
    return DIGITS.includes(string);
  },
};
