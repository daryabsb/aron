const percent = (val) => val / 100;

export const discount = (num, val, type) => {
  if (type === "$") return num * val;
  return num * percent(val);
};
