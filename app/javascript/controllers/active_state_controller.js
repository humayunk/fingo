import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="active-state"
export default class extends Controller {
  static targets = ["link"];

  connect() {
    this.updateActiveLink();
  }

  updateActiveLink() {
    this.linkTargets.forEach((link) => {
      if (link.href === window.location.href) {
        link.classList.add("active");
      } else {
        link.classList.remove("active");
      }
    });
  }
}
