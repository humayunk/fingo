import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["answer"]

  connect() {
    this.answerTargets.forEach(target => {
      target.addEventListener("click", this.checkAnswer.bind(this))
    })
  }

  checkAnswer(event) {
    const answer = event.currentTarget
    const isCorrect = answer.dataset.correct === "true"

    if (isCorrect) {
      answer.style.backgroundColor = "green"
      alert("Correct!")
    } else {
      answer.style.backgroundColor = "red"
      alert("Incorrect.")
    }
  }
}
