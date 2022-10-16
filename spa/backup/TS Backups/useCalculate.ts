import { ref, readonly } from "vue";
import { OPERATORS, DIGITS } from "@/store/constants";

export const useCalculate = () => {
  let memory = ref("");
  let error = ref(false);
  let clearOnNextDigit = ref(false);

  const isOperator = (string) => {
    return OPERATORS.includes(string);
  };

  const isDigit = (string) => {
    return DIGITS.includes(string);
  };

  const lastCharIsOperator = (string) => {
    const stringNormalized = string.replace(/\s/g, "");
    return isOperator(stringNormalized[stringNormalized.length - 1]);
  };

  const addDigit = (digit) => {
    if (!isDigit(digit)) {
      throw new Error("Invalid param, is not a valid digit");
    }

    const lastDigit = memory.value[memory.value.length - 1];

    if (lastDigit === "." && digit === ".") return;
    if (lastDigit === "0" && memory.value.length === 1) clear();
    if (clearOnNextDigit.value) clear();
    if ((!memory.value || lastCharIsOperator(memory.value)) && digit === ".")
      memory.value += "0";

    clearOnNextDigit.value = false;
    memory.value += `${digit}`;
  };

  const addOperator = (operator) => {
    if (!isOperator(operator)) {
      throw new Error("Invalid param, is not a valid operator");
    }

    if (!memory.value && operator !== "-") return;
    if (lastCharIsOperator(memory.value)) eraseLast();

    clearOnNextDigit.value = false;
    memory.value += `${operator}`;
  };

  const calculateResult = () => {
    if (!memory.value) return;

    if (lastCharIsOperator(memory.value)) {
      memory.value = memory.value.slice(0, memory.value.length - 1);
    }

    try {
      const mathExpression = memory.value.replace(
        /\b0*((\d+\.\d+|\d+))\b/g,
        "$1"
      ); // remove octal numeric
      memory.value = `${eval(mathExpression)}`;
    } catch (_) {
      error.value = true;
      memory.value = "";
    } finally {
      clearOnNextDigit.value = true;
    }
  };

  const eraseLast = () => {
    if (!memory.value.length) return;

    memory.value = memory.value.slice(0, memory.value.length - 1);
    clearOnNextDigit.value = false;
  };

  function clear() {
    memory.value = "";
    error.value = false;
  }

  return {
    memory: readonly(memory),
    error: readonly(error),
    addDigit,
    addOperator,
    calculateResult,
    eraseLast,
    clear,
  };
};
