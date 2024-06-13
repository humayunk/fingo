import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="click-sound"
export default class extends Controller {
  static targets = ["button"]
  static values = {url: String}

  connect() {
    this.audio = new Audio(this.urlValue);
  }

  click(event) {
    this.audio.play();
  }
}
