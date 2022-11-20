import { ref, toRefs, reactive, computed, onMounted, watch } from "vue";

export const useOrderItem = (item) => {
  //   item = item;
  //   const {
  //     product,
  //     number,
  //     order,
  //     user,
  //     quantity,
  //     price,
  //     is_locked,
  //     discount,
  //     discount_type,
  //     voide_by,
  //     comment,
  //     bundle,
  //     created,
  //     updated,
  //   } = item;

  const currencyStr = (currency) => {
    return currency === 1 ? "IQD" : "$";
  };
  const isReloaded = () => {
    return false;
  };

  const measurementUnit = () => {
    return item.product.measurement_unit;
  };
  const currency = () => {
    return currencyStr(item.product.currency);
  };
  const priceChangeAllowed = () => {
    return item.product.is_price_change_allowed;
  };
  // get unitPrice() {
  //   return item.currencyStr(item.product.currency);
  // }
  const isService = () => {
    return item.product.is_service;
  };
  const isUsingDefaultQuantity = () => {
    return item.product.is_using_default_quantity;
  };
  const lastBuyingPrice = () => {
    return item.product.last_purchase_price;
  };

  /*  margin has a setter, to calculate selling price
          by adding the margin rate to cost price */
  const margin = () => {
    return item.product.margin;
  };
  const setMargin = (margin) => {
    item.price = item.product.cost + margin;
  };
  const marginStr = () => {
    return item.product.margin + "%";
  };
  const stockQuantity = () => {
    return item.product.stock_quantity;
  };

  const itemTotalPrice = () => {
    if (!item.product) return 0;
    return item.product.price * item.quantity;
  };
  const totalWithTax = () => {
    if (!item.product.tax) return itemTotalPrice();

    return parseInt(itemTotalPrice()) + item.product.tax.total;
  };
  const totalWithDsicount = () => {
    if (!item.discount) return totalWithTax();
    if (item.discountType === 0) {
      let discountRate = (totalWithTax() * item.discount) / 100;
      return totalWithTax() - discountRate;
    }
    return totalWithTax() - item.discount;
  };
  const orderItemTotal = () => {
    return totalWithDsicount();
  };

  return {
    // memory: readonly(memory),
    // error: readonly(error),
    ...item,
    currencyStr,
    measurementUnit,
    isReloaded,
    currency,
    priceChangeAllowed,
    isService,
    isUsingDefaultQuantity,
    lastBuyingPrice,
    margin,
    setMargin,
    marginStr,
    stockQuantity,
    itemTotalPrice,
    totalWithTax,
    totalWithDsicount,
    orderItemTotal,
  };
};
