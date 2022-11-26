import OrderItem from "@/Orders/orderTemplates/OrderItem";
export default class Order {
  constructor({
    number,
    discount = 0.0,
    discount_type = 0,
    items = [],
    total = 0.0,
    status = false,
    created = new Date(),
    updated = new Date(),
  } = {}) {
    this.number = number;
    this.discount = discount;
    this.discount_type = discount_type;
    this.items = items;
    this.total = +total;
    this.status = status;
    this.created = created;
    this.updated = updated;
    // this.hasItems = this.items.length > 0;
  }

  get itemsTotal() {
    return this.items.reduce(
      (total, item) => total + item.price * item.quantity,
      0
    );
  }

  get hasItems() {
    return this.items.length > 0;
  }

  get itemsList() {
    return this.items.map((item) => new OrderItem(item));
  }
  itemsPercentageFromTotal(itemPrice, totalPrice) {
    return itemPrice / totalPrice;
  }
  itemPrice(item) {
    return item.product.price;
  }

  getItemTotalPrice(item) {
    return item.product.price * item.quantity;
  }

  itemTotal(item) {
    return item.product.price * item.quantity;
  }
  get totalPriceFromItems() {
    return this.items.reduce((total, item) => total + this.itemTotal(item), 0);
  }

  itemPercent(item) {
    return this.itemTotal(item) / this.totalPriceFromItems;
  }
  itemDiscountPerItem(item) {
    return (
      this.itemPercent(item) *
      this.calculateActiveOrderDiscount(this.totalPriceFromItems)
    );
  }
  itemTotalWithDiscount(item) {
    return this.itemTotal(item) - this.itemDiscountPerItem(item);
  }
  itemTax(item) {
    return item.product.tax.total_rate * this.itemTotalWithDiscount(item);
    // / this.getItemTotalPrice(item);
  }

  itemTotalWithTax(item) {
    return this.itemTotalWithDiscount(item) + this.itemTax(item);
  }

  itemTotalPrice(item) {
    // return this.getItemTotalPrice(item);
    return this.itemTotalWithTax(item);
  }

  get totalPrice() {
    return this.items.reduce(
      (total, item) => total + this.itemTotalPrice(item),
      0
    );
  }
  // set items(items)

  /*
  CART PROPERTIES
  convertItems() {
    this.items.forEach((item) => {
      try {
        const itemResponse = ordersAPI.getSingleOrderItem(item);
        console.log("itemResponse.data", itemResponse.data);
        item = itemResponse.data;
      } catch (error) {
        console.log(error);
      }
    });
  }
  get rawitems() {
    return this.convertItems();
  }
  */

  /*
  ITEMS PROPERTIES
  
  */
  get discountStr() {
    return this.discount_type === 0 ? "%" : "$";
  }
  calculateItemDiscount(item) {
    return item.discount_type == 0
      ? (this.itemTotalPrice(item) * item.discount) / 100
      : item.discount;
  }
  calculateActiveOrderDiscount(total) {
    return this.discount_type == 0
      ? (total * this.discount) / 100
      : this.discount;
  }

  isActiveNumber() {
    return this.number != "";
  }
  isActiveOrderItems() {
    if (!this.isActiveNumber()) return false;

    return this.items.length !== 0;
  }

  get totalTax() {
    if (!this.isActiveNumber()) return 0;
    if (!this.isActiveOrderItems()) return 0;
    const taxes = this.items.map(
      (item) => item.product.tax.total * item.quantity
    );
    const taxTotal = taxes.reduce((total, item) => (total += item), 0);
    return taxTotal.toFixed(3);
  }

  get subTotalBeforeDiscount() {
    return this.items.reduce(
      (total, item) => total + this.getItemTotalPrice(item),
      0
    );
  }

  get subTotalWithDiscount() {
    if (!this.isActiveNumber()) return 0;
    if (!this.isActiveOrderItems()) return 0;

    return (
      this.subTotalBeforeDiscount -
      this.calculateActiveOrderDiscount(this.subTotalBeforeDiscount)
    );
  }
  // const subTotalBeforeTax = () => {
  //   if (!order) return 0;

  //   return order.items.reduce(
  //     (total, item) => total + getItemTotalPrice(item),
  //     0
  //   );
  // };
  get subTotalWithTax() {
    if (!this.isActiveNumber) return 0;
    if (!this.isActiveOrderItems) return 0;
    this.total = +this.subTotalWithDiscount + +this.totalTax;
    return this.total;
  }

  // const subTotalWithDiscount = () => {
  //   if (!isActiveNumber) return 0;
  //   if (!isActiveOrderItems) return 0;

  //   return subTotalWithTax() - calculateActiveOrderDiscount(subTotalWithTax());
  // };
}
