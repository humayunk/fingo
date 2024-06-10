import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["answer", "feedback", "correct", "incorrect"]

  connect() {
  }

  checkAnswer(event) {
    event.preventDefault();
    const answer = event.currentTarget
    const isCorrect = answer.dataset.correct === "true"
    const feedbackElement = this.feedbackTarget

    this.answerTargets.forEach(element => {
      element.style.pointerEvents = 'none';
    });

    if (isCorrect) {
      answer.classList.add("list-group-item-success")
      // alert("Correct!")
      this.correctTarget.classList.toggle("d-none")
    } else {
      answer.classList.add("list-group-item-danger")
      const correctAnswer = this.answerTargets.find(target => target.dataset.correct === "true")
      const correctAnswerContent = correctAnswer ? correctAnswer.innerText : "No correct answer found."
      // alert(`Wrong sorry! \nThe correct answer is: \n${correctAnswerContent}`)
      this.incorrectTarget.classList.toggle("d-none")
    }
  }
}
