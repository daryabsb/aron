export default class Order {
  constructor({
    id = this.generateUID(),
    number = this.generateUID(),
    discount = 0,
    discount_type = 0,
    items = [],
    total = 0,
    status = false,
    created = new Date(),
    updated = new Date(),
  } = {}) {
    this.id = parseInt(id);
    this.number = number;
    this.discount = discount;
    this.discount_type = discount_type;
    this.items = items;
    this.total = total;
    this.status = status;
    this.created = created;
    this.updated = updated;
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
