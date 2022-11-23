export default class OrderItem {
  constructor(
    // _product,
    // id,
    product,
    number,
    order,
    user,
    _quantity = 1,
    _price = 0.0,
    _is_locked = false,
    _discount = 0.0,
    _discount_type = 0.0,
    _is_featured = false,
    _voide_by = 0,
    _comment = "",
    _bundle = "",
    _created = new Date(),
    _updated = new Date()
  ) {
    // console.log("from OrderItem class: ", item.number);
    this.product = product;
    this.number = number;
    this.order = order;
    this.user = user;
    this.quantity = _quantity;
    // this.measurementUnit = this.product.meqsurement_unit;
    this.price = _price;
    this.is_locked = _is_locked;
    this.discount = _discount;
    this.discount_type = _discount_type;
    this.is_locked = _is_featured;
    this.voide_by = _voide_by;
    this.comment = _comment;
    this.bundle = _bundle;
    this.created = _created;
    this.updated = _updated;
  }
  currencyStr(currency) {
    return currency === 1 ? "IQD" : "$";
  }
  get isReloaded() {
    return false;
  }

  get measurementUnit() {
    return this.product.measurement_unit;
  }
  get currency() {
    return this.currencyStr(this.product.currency);
  }
  get priceChangeAllowed() {
    return this.product.is_price_change_allowed;
  }
  // get unitPrice() {
  //   return item.currencyStr(item.product.currency);
  // }
  get isService() {
    return this.product.is_service;
  }
  get isUsingDefaultQuantity() {
    return this.product.is_using_default_quantity;
  }
  get lastBuyingPrice() {
    return this.product.last_purchase_price;
  }

  /*  margin has a setter, to calculate selling price
          by adding the margin rate to cost price */
  get margin() {
    return this.product.margin;
  }
  set margin(margin) {
    this.price = this.product.cost + margin;
  }
  get marginStr() {
    return this.product.margin + "%";
  }
  get stockQuantity() {
    return this.product.stock_quantity;
  }

  get itemTotalPrice() {
    if (!this.product) return 0;
    return this.product.price * this.quantity;
  }
  get totalWithTax() {
    if (!this.product.tax) return this.itemTotalPrice;

    return parseInt(this.itemTotalPrice) + this.product.tax.total;
  }
  get totalWithDsicount() {
    if (!this.discount) return this.totalWithTax;
    if (this.discountType === 0) {
      let discountRate = (this.totalWithTax * this.discount) / 100;
      return this.totalWithTax - discountRate;
    }
    return this.totalWithTax - this.discount;
  }
  get orderItemTotal() {
    return this.totalWithDsicount;
  }

  // currencyStr(currency) {
  //   return currency === 1 ? "IQD" : "$";
  // }
  // get isReloaded() {
  //   return false;
  // }
  // // get measurementUnit() {
  // //   return this.product.measurement_unit;
  // // }
  // get currency() {
  //   return this.currencyStr(this.product.currency);
  // }
  // get priceChangeAllowed() {
  //   return this.product.is_price_change_allowed;
  // }
  // // get unitPrice() {
  // //   return this.currencyStr(this.product.currency);
  // // }
  // get isService() {
  //   return this.product.is_service;
  // }
  // get isUsingDefaultQuantity() {
  //   return this.product.is_using_default_quantity;
  // }
  // get lastBuyingPrice() {
  //   return this.product.last_purchase_price;
  // }

  // /*  margin has a setter, to calculate selling price
  //     by adding the margin rate to cost price */
  // get margin() {
  //   return this.product.margin;
  // }
  // set margin(margin) {
  //   this.price = this.product.cost + margin;
  // }
  // get marginStr() {
  //   return this.product.margin + "%";
  // }
  // get stockQuantity() {
  //   return this.product.stock_quantity;
  // }

  /*
PRODUCT PROPERTIES

measurementUnit     String      Done!
unitPrice           Float       Done! => same as product price
currency            Number      Done!
currencyStr         String      Done
taxInclusivePrice   Bool
priceChangeAllowed  Bool        Done!
isService           Bool        Done!
isDefaultQuantity   Bool        Done!
lastBuyingPrice     Float       Done!
lastPurchasePrice   Float       Same as last buying price
margin(markup)      Number      Done!
stockQuantity       Number      

*/

  /*
ORDER PROPERTIES

quantity            Number  =>  get & set
discount            Float   =>  get & set
discountTypeStr     "%" or "Currency"
discountType        Number (0=%, 1=$ ..etc)
isTaxOnItemTotal    Bool 
    if true => 
            get totalWithTaxOnProduct   = (tax * salePrice) * quantity;
    else    get totalWithTaxOnItemTotal = (salePrice * quantity) * tax;


*/

  // get itemTotalPrice() {
  //   if (!this.product) return 0;
  //   return this.product.price * this.quantity;
  // }
  // get totalWithTax() {
  //   if (!this.tax) return this.itemTotalPrice;
  //   let taxRate = this.tax / 100;
  //   return this.itemTotalPrice * taxRate + this.itemTotalPrice;
  // }
  // get totalWithDsicount() {
  //   if (!this.discount) return this.totalWithTax;
  //   if (this.discountType === 0) {
  //     let discountRate = (this.totalWithTax * this.discount) / 100;
  //     return this.totalWithTax - discountRate;
  //   }
  //   return this.totalWithTax - this.discount;
  // }
  // get orderItemTotal() {
  //   return this.totalWithDsicount;
  // }
}
