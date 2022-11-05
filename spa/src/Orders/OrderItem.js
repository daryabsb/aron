export default class OrderItem {
  constructor(
    _product,
    _quantity = 1,
    _discount = 0,
    _discountType = 0,
    _tax = 0
  ) {
    this.product = _product;
    this.quantity = _quantity;
    this.discountType = _discountType;
    this.discount = _discount;
    this.tax = _tax;
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
    let taxRate = this.tax / 100;
    if (this.tax)
      return this.getItemTotalPrice() * taxRate + this.getItemTotalPrice();
    return this.getItemTotalPrice();
  }
  get totalWithDsicount() {
    if (!this.discount) return this.getTotalWithTax();
    if (this.discountType !== 0) return this.getTotalWithTax() - this.discount;
    let discountRate = this.discount / 100;
    return this.getTotalWithTax() * discountRate;
  }
  get orderItemTotal() {
    return this.getTotalWithDsicount();
  }
}
