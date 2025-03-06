import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["button"]
  connect() {
    console.log(this.buttonTarget)
  }

  fire(){
    this.buttonTarget.classList.toggle('d-none')
  }
}
