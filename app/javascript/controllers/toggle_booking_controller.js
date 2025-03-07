import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-booking"
export default class extends Controller {
  static targets = ["bookings", "offers"]

  connect() {
    this.showOffers()
  }

  showBookings() {
    this.bookingsTarget.style.display = "block"
    this.offersTarget.style.display = "none"
  }

  showOffers() {
    this.bookingsTarget.style.display = "none"
    this.offersTarget.style.display = "block"
  }
}
