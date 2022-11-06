export default class OrderItem {
  constructor(
    _product,
    _price = 0,
    _quantity = 1,
    _discount = 0,
    _discountType = 0,
    _tax = 0
  ) {
    this.product = _product;
    this.id = this.product.id;
    this.price = _price;
    this.quantity = _quantity;
    this.discountType = _discountType;
    this.discount = _discount;
    this.tax = _tax;
    this.isActive = false;
  }

  /*
PRODUCT PROPERTIES

measurementUnit     String
unitPrice           Float
currency            Number
currencyStr         String "IQD" or "$"
taxInclusivePrice   Bool
priceChangeAllowed  Bool
isService           Bool
isDefaultQuantity   Bool
buyingPrice         Float
margin(markup)      Number (precentage)
lastPurchasePrice   Float
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
