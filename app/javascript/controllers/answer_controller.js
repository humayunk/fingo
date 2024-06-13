import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["answer", "blank", "buttonCheck", "buttonContinue"]

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
      answer.classList.add("answer-success", "animate__animated", "animate__shakeY")
      // answer.classList.add("animate__shakeY")
      // feedbackContainer.classList.add("feedback-success")
      // alert("Correct!")
    } else {
      answer.classList.add("answer-error", "animate__animated", "animate__shakeX")
      // animate__shakeX
      const correctAnswer = this.answerTargets.find(target => target.dataset.correct === "true")
      const correctAnswerContent = correctAnswer ? correctAnswer.innerText : "No correct answer found."
      // alert(`Wrong sorry! \nThe correct answer is: \n${correctAnswerContent}`)
    }
    this.buttonCheckTarget.classList.add("d-none")
    this.buttonContinueTarget.classList.remove("d-none")
  }

  checkAnswerFill(event) {
    const destinations = document.querySelectorAll("[data-fill-role='destination']")
    let i = 1
    let answerCorrect = null
    destinations.forEach(destination => {
      // console.log(typeof i)
      // console.log(typeof destination.children[0].dataset.order)
      if (destination.children[0].dataset.correct === "true" && parseInt(destination.children[0].dataset.order) === i ){
        destination.classList.add("answer-success", "animate__animated", "animate__shakeY")
      } else {
        destination.classList.add("answer-error", "animate__animated", "animate__shakeX")
      }
      i += 1
    })

    this.buttonCheckTarget.classList.add("d-none")
    this.buttonContinueTarget.classList.remove("d-none")
  }

  enableBtn(event) {
    event.preventDefault();
    const answer = event.currentTarget
    const isCorrect = answer.dataset.correct === "true"
    this.answerTargets.forEach(element => {
      element.classList.remove("answer-active");
    });
    answer.classList.add("answer-active")
    this.answerCheck = isCorrect
    this.answerCheckDiv = answer;
    this.buttonCheckTarget.disabled = false;
    this.buttonCheckTarget.classList.remove("btn-custom-lesson-disabled");
    this.buttonCheckTarget.classList.add("btn-custom-lesson-active");
  }

  drag(event) {
    event.dataTransfer.setData("text", event.target.dataset.content);
  }

  allowDrop(event) {
    event.preventDefault();
  }

  drop(event) {
    event.preventDefault();
    const data = event.dataTransfer.getData("text");
    event.target.innerText = data;
  }
}
