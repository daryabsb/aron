export default class Order {
  constructor({
    number,
    _discount = 0.0,
    _discount_type = 0,
    _items = [],
    _total = 0.0,
    _status = false,
    _created = new Date(),
    _updated = new Date(),
  } = {}) {
    this.number = number;
    this.discount = _discount;
    this.discount_type = _discount_type;
    this.items = _items;
    this.total = +_total;
    this.status = _status;
    this.created = _created;
    this.updated = _updated;
    // this.hasItems = this.items.length > 0;
  }

  generateUID() {
    let firstPart = new Date();
    let secondPart = (Math.random() * (49999 - 101) + 101) | 0;
    firstPart = `${firstPart.getDate()}${firstPart.getMonth()}${firstPart.getFullYear()}`;
    secondPart = secondPart.toString();
    return firstPart + secondPart;
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
}
