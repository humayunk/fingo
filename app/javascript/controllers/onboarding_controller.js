import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="onboarding"
export default class extends Controller {
  static targets = ['submit','label']

  connect() {
    console.log(this.submitTarget)
  }

  activate(event) {
    this.#resetLabels()
    event.target.parentElement.classList.replace('answer-disabled', 'answer-active')
    this.submitTarget.classList.remove('btn-custom-lesson-disabled')
    this.submitTarget.classList.add('btn-custom-lesson-active')
    this.submitTarget.disabled = false
  }

  #resetLabels() {
    this.labelTargets.forEach((label) => {
      label.classList.replace('answer-active', 'answer-disabled')
    })
  }
}
