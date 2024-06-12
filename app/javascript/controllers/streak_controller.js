import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="streak"
export default class extends Controller {
  static values = {start: Number}

  connect() {
    let current = this.startValue;
    const stepTime = Math.abs(Math.floor(2000));
    // Decrease the number after Math.floor to speed up the counter
    const obj = this.element;
    const timer = setInterval(function() {
        current += 1;
        obj.innerHTML = current;
        clearInterval(timer);
    }, stepTime);
  }
}
