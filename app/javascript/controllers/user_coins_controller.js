import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-coins"
export default class extends Controller {
  connect() {
  }

  updateCoinBalance(new_balance) {
    this.element.innerText = new_balance;
  }
}
