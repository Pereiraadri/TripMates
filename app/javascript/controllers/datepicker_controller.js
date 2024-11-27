import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {

  connect() {
    console.log('coucou')
    minDate: "today"
    console.log("cc");

    const bookingForm = this.element
    if (bookingForm) {
      flatpickr("#range_start", {
        mode: "range",
        minDate: "today",
        inline: true,
        dateFormat: "Y-m-d",
      })
    }
  }
}
