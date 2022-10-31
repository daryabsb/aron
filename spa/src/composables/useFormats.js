export const formatCurrency = (number, locale = "en-US") => {
  return new Intl.NumberFormat(locale, {
    style: "currency",
    currency: "IQD",
  }).format(number);
};
