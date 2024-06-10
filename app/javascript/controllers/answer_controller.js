import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["answer", "correct", "incorrect", "buttonCheck", "buttonContinue"]

  connect() {
    this.answerCheck = "";
    this.answerCheckDiv = "";
  }

  checkAnswer(event) {
    event.preventDefault();
    console.log(this.answerCheck);
    const answer = this.answerCheckDiv
    const isCorrect = this.answerCheck


    this.answerTargets.forEach(element => {
      element.style.pointerEvents = 'none';
    });

    if (isCorrect) {
      answer.classList.add("answer-success")
      // alert("Correct!")
      this.correctTarget.classList.toggle("d-none")
    } else {
      answer.classList.add("answer-error")
      const correctAnswer = this.answerTargets.find(target => target.dataset.correct === "true")
      const correctAnswerContent = correctAnswer ? correctAnswer.innerText : "No correct answer found."
      // alert(`Wrong sorry! \nThe correct answer is: \n${correctAnswerContent}`)
      this.incorrectTarget.classList.toggle("d-none")
    }
    this.buttonCheckTarget.classList.add("d-none")
    this.buttonContinueTarget.classList.remove("d-none")
  }

  enableBtn(event) {
    event.preventDefault();
    const answer = event.currentTarget
    const isCorrect = answer.dataset.correct === "true"
    answer.classList.add("answer-active")
    this.answerCheck = isCorrect
    this.answerCheckDiv = answer;
    this.buttonCheckTarget.disabled = false;
    this.buttonCheckTarget.classList.remove("btn-custom-lesson-disabled");
    this.buttonCheckTarget.classList.add("btn-custom-lesson-active");
  }
}
