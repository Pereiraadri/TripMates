import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["date"]

  connect() {
    flatpickr(this.element)
    minDate: "today"
    console.log("cc");

    const bookingForm = document.getElementById('booking-form-div');
    if (bookingForm) {
      flatpickr("#range_start", {
        plugins: [new rangePlugin({ input: "#range_end" })],
        minDate: "today",
        inline: true,
        dateFormat: "Y-m-d",
      })
    }
  }
}
