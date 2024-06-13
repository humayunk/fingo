import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-avatar"
export default class extends Controller {
  connect() {
  }

  updateAvatar(new_avatar) {
    this.element.src = new_avatar;
  }
}
