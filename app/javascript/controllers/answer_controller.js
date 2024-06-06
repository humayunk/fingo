import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["answer"]

  connect() {
    this.answerTargets.forEach(target => {
      target.addEventListener("click", this.checkAnswer.bind(this))
    })
  }

  checkAnswer(event) {
    event.preventDefault();
    const answer = event.currentTarget
    const isCorrect = answer.dataset.correct === "true"

    if (isCorrect) {
      answer.classList.add("list-group-item-success")
      // alert("Correct!")
    } else {
      answer.classList.add("list-group-item-danger")
      const correctAnswer = this.answerTargets.find(target => target.dataset.correct === "true")
      const correctAnswerContent = correctAnswer ? correctAnswer.innerText : "No correct answer found."
      alert(`Wrong sorry! \nThe correct answer is: \n${correctAnswerContent}`)
    }
  }
}
