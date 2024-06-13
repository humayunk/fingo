import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-coins"
export default class extends Controller {
  connect() {
    console.log("Hello from user-coins controller");
  }

  updateCoinBalance(new_balance) {
    this.element.innerText = new_balance;
  }
}
