import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-booking"
export default class extends Controller {
  static targets = ["bookings", "offers", "titleb", "titleo"]

  connect() {
    this.showOffers()
  }

  showBookings() {
    this.bookingsTarget.style.display = "block"
    this.offersTarget.style.display = "none"
    this.titlebTarget.classList.add('active-tab')
    this.titlebTarget.classList.remove('inactive-tab')
    this.titleoTarget.classList.remove('active-tab')
    this.titleoTarget.classList.add('inactive-tab')
  }

  showOffers() {
    this.bookingsTarget.style.display = "none"
    this.offersTarget.style.display = "block"
    this.titleoTarget.classList.add('active-tab')
    this.titleoTarget.classList.remove('inactive-tab')
    this.titlebTarget.classList.remove('active-tab')
    this.titlebTarget.classList.add('inactive-tab')
  }
}
