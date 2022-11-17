import { ref, toRefs, reactive, computed, onMounted, watch } from "vue";

export const useOrderItem = (order) => {
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
    if (!item.tax) return itemTotalPrice();
    let taxRate = item.tax / 100;
    return itemTotalPrice() * taxRate + itemTotalPrice();
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
    ...order,
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

/*
CREATE VIEW [dbo].[DocumentItemPriceView]
AS
    SELECT
        DI.Id AS DocumentItemId,
        -- If cart discount exist
        CASE WHEN D.Discount > 0 THEN
        -- Percentage discount on cart
        CASE WHEN D.DiscountType = 0 THEN
            -- Calculate cart percentage discount on previously calculated price with discount
            (DI.PriceAfterDiscount / 100.00) * (100.00 - D.Discount)
        ELSE 
            -- Cart fixed discount subtracted from price with tax
            DI.PriceAfterDiscount - (((D.Discount * DI.Total) / (D.Total + D.Discount)) / DI.Quantity)
        END
    ELSE 
        DI.PriceAfterDiscount
    END 
    AS Price
    FROM DocumentItem DI INNER JOIN
        Document D ON D.Id = DI.DocumentId

CREATE FUNCTION [dbo].[DocumentPaymentTypes]
    (
        @DocumentId INT
    )
    RETURNS VARCHAR(500)
    AS
    BEGIN
    DECLARE @Result VARCHAR(500)

    SELECT @Result = STUFF((SELECT DISTINCT ', ' + PaymentType.Name
        FROM Payment INNER JOIN PaymentType ON Payment.PaymentTypeId = PaymentType.Id
        WHERE Payment.DocumentId=@DocumentId
        FOR XML PATH('')), 1, 1, '')

    RETURN LTRIM(@Result)
END

*/
