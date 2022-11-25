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
  const calculateActiveOrderDiscount = (total) => {
    if (order.discount_type === 0) {
      return (total * order.discount) / 100;
    } else {
      return order.discount;
    }
  };
  const getItemTotalPrice = (item) => {
    return item.product.price * item.quantity;
  };

  const isActiveNumber = () => {
    if (!order) return false;
    return order.number != "";
  };
  const isActiveOrderItems = () => {
    if (!isActiveNumber) return false;

    return this.useActiveOrder.items.length !== 0;
  };

  const totalTax = () => {
    if (!isActiveNumber()) return 0;
    if (!isActiveOrderItems) return 0;
    const taxes = order.items.map(
      (item) => item.product.tax.total * item.quantity
    );
    const taxTotal = taxes.reduce((total, item) => (total += item), 0);
    return taxTotal.toFixed(3);
  };

  const subTotalBeforeDiscount = () => {
    if (!order) return 0;

    return order.items.reduce(
      (total, item) => total + getItemTotalPrice(item),
      0
    );
  };

  const subTotalWithDiscount = () => {
    if (!isActiveNumber) return 0;
    if (!isActiveOrderItems) return 0;

    return (
      subTotalBeforeDiscount() -
      calculateActiveOrderDiscount(subTotalBeforeDiscount())
    );
  };
  // const subTotalBeforeTax = () => {
  //   if (!order) return 0;

  //   return order.items.reduce(
  //     (total, item) => total + getItemTotalPrice(item),
  //     0
  //   );
  // };
  const subTotalWithTax = () => {
    if (!isActiveNumber) return 0;
    if (!isActiveOrderItems) return 0;
    order.total = +subTotalWithDiscount() + +totalTax();

    return order.total;
  };

  // const subTotalWithDiscount = () => {
  //   if (!isActiveNumber) return 0;
  //   if (!isActiveOrderItems) return 0;

  //   return subTotalWithTax() - calculateActiveOrderDiscount(subTotalWithTax());
  // };

  if (order) {
    order.total = subTotalWithTax();
  }

  const totalPrice = () => subTotalWithTax();

  return {
    // memory: readonly(memory),
    // error: readonly(error),
    ...order,
    discountStr,
    subTotalBeforeDiscount,
    subTotalWithTax,
    subTotalWithDiscount,
    totalTax,
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
