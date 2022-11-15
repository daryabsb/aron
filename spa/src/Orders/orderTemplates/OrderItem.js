export default class OrderItem {
  constructor(
    item
    // _product,
    // id,
    // _quantity = 1,
    // _price = 0.0,
    // _is_locked = false,
    // _discount = 0.0,
    // _discount_type = 0.0,
    // _is_featured = false,
    // _voide_by = 0,
    // _comment = "",
    // _bundle = "",
    // _created = new Date(),
    // _updated = new Date(),
    // _user = null,
    // _order = null
  ) {
    console.log("from OrderItem class: ", item.id);
    this.product = item.product;
    this.id = item.id;
    this.quantity = item.quantity;
    this.price = item.price;
    this.is_locked = item.is_locked;
    this.discount = item.discount;
    this.discount_type = item.discount_type;
    this.is_locked = item.is_featured;
    this.voide_by = item.voide_by;
    this.comment = item.comment;
    this.bundle = item.bundle;
    this.created = item.created;
    this.updated = item.updated;
    this.user = item.user ?? null;
    this.order = item.order ?? null;
  }
  currencyStr(currency) {
    return currency === 1 ? "IQD" : "$";
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
  //   return this.currencyStr(this.product.currency);
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

  get itemTotalPrice() {
    if (!this.product) return 0;
    return this.product.price * this.quantity;
  }
  get totalWithTax() {
    if (!this.tax) return this.itemTotalPrice;
    let taxRate = this.tax / 100;
    return this.itemTotalPrice * taxRate + this.itemTotalPrice;
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
}
