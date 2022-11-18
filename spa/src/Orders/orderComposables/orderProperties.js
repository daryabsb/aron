import { ref, toRefs, reactive, computed, onMounted, watch } from "vue";

export const useOrder = (order) => {
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

  const discountStr = () => {
    return order.discount_type === 0 ? "%" : "$";
  };

  // const itemTotalPrice = () => {
  //   if (!item.product) return 0;
  //   return item.product.price * item.quantity;
  // };
  // const totalWithTax = () => {
  //   if (!item.tax) return itemTotalPrice();
  //   let taxRate = item.tax / 100;
  //   return itemTotalPrice() * taxRate + itemTotalPrice();
  // };
  // const totalWithDsicount = () => {
  //   if (!item.discount) return totalWithTax();
  //   if (item.discountType === 0) {
  //     let discountRate = (totalWithTax() * item.discount) / 100;
  //     return totalWithTax() - discountRate;
  //   }
  //   return totalWithTax() - item.discount;
  // };
  const totalPrice = () => {
    if (!order) return 0;
    console.log(order.total);
    return order.total;
  };

  return {
    // memory: readonly(memory),
    // error: readonly(error),
    ...order,
    discountStr,
    // measurementUnit,
    // isReloaded,
    // currency,
    // priceChangeAllowed,
    // isService,
    // isUsingDefaultQuantity,
    // lastBuyingPrice,
    // margin,
    // setMargin,
    // marginStr,
    // stockQuantity,
    // itemTotalPrice,
    // totalWithTax,
    // totalWithDsicount,
    totalPrice,
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
