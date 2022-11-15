import ordersAPI from "@/services/ordersAPI";
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
    this.items = items ?? [];
    this.total = +total;
    this.status = status;
    this.created = created;
    this.updated = updated;
    // this.hasItems = this.items.length > 0;
  }

  generateUID() {
    let firstPart = new Date();
    let secondPart = (Math.random() * (49999 - 101) + 101) | 0;
    firstPart = `${firstPart.getDate()}${firstPart.getMonth()}${firstPart.getFullYear()}`;
    secondPart = secondPart.toString();
    return firstPart + secondPart;
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
