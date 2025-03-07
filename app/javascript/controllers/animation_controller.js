import { Controller } from "@hotwired/stimulus"
import { gsap } from "gsap"

// Connects to data-controller="animation"
export default class extends Controller {
  connect() {
    console.log("Animation controller connected")
  }

  animate() {
    // Exemple : animer la target "box"
    gsap.to(this.boxTarget, {
      rotation: 180,
      duration: 1,
      ease: "back.out(1.7)"
    })
  }
}
