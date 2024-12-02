import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {

  connect() {
    minDate: "today"
    const bookingForm = this.element
    if (bookingForm) {
      flatpickr("#range_start", {
        mode: "range",
        minDate: "today",
        inline: true,
        dateFormat: "d.m",
      })
    }
  }
}
