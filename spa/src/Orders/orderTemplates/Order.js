export default class OrderItem {
  constructor(
    _number = "",
    _discount = 0,
    _discount_type = 0,
    _total = 0,
    _items = [],
    _status = false,
    _created = new Date()
  ) {
    this.number = _number ? _number : this.generateUID();
    this.discount = _discount;
    this.discount_type = _discount_type;
    this.total = _total;
    this.items = _items;
    this.status = _status;
    this.created = _created;
  }

  generateUID() {
    let firstPart = new Date();
    let secondPart = (Math.random() * (49999 - 101) + 101) | 0;
    firstPart = `${firstPart.getDate()}${firstPart.getMonth()}${firstPart.getFullYear()}`;
    secondPart = secondPart.toString();
    return firstPart + secondPart;
  }

  /*
  CART PROPERTIES
  

  */

  /*
  ITEMS PROPERTIES
  
  */
}
