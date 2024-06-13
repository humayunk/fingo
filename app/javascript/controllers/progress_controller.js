import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["step1", "step2", "step3"];

  connect() {
    this.updateProgressBar();
  }

  updateProgressBar() {
    const currentStep = this.getCurrentStep();
    this.clearProgress();

    switch (currentStep) {
      case 1:
        this.step1Target.classList.add('bg-primary');
        break;
      case 2:
        this.step1Target.classList.add('bg-primary');
        this.step2Target.classList.add('bg-primary');
        break;
      case 3:
        this.step1Target.classList.add('bg-primary');
        this.step2Target.classList.add('bg-primary');
        this.step3Target.classList.add('bg-primary');
        break;
      default:
        break;
    }
  }

  getCurrentStep() {
    const url = window.location.href;
    if (url.includes('step1')) {
      return 1;
    } else if (url.includes('step2')) {
      return 2;
    } else if (url.includes('step3')) {
      return 3;
    }
    return 1;
  }

  clearProgress() {
    this.step1Target.classList.remove('bg-primary');
    this.step2Target.classList.remove('bg-primary');
    this.step3Target.classList.remove('bg-primary');
  }
}
