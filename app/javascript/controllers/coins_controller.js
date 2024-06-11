import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="coins"
export default class extends Controller {
  static values = {start: Number, end: Number}

  connect() {
    if (this.startValue === this.endValue) return;
    const range = this.endValue - this.startValue;
    let current = this.startValue;
    const increment = this.endValue > this.startValue? 1 : -1;
    const stepTime = Math.abs(Math.floor(2000 / range));
    // Decrease the number after Math.floor to speed up the counter
    const obj = this.element;
    const end_value = this.endValue
    const timer = setInterval(function() {
        current += increment;
        if (current != end_value) {
          obj.innerHTML = `➕${current}`;
          // "+" can be styled appropriately.
        } else {
          obj.innerHTML = current;
          clearInterval(timer);
        }
        // TO remove the "+" sign as the coins increment, use below code instead
        // obj.innerHTML = current;
        // if (current == end_value) {
        //     clearInterval(timer);
        // }
    }, stepTime);
  }
}
