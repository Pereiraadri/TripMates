import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["date"]

  connect() {
    flatpickr(this.element)
    minDate: "today"
    const dateForm = dateTarget;
    if (dateForm) {
      flatpickr("#range_start", {
        plugins: [new rangePlugin({ input: "#range_end" })],
        minDate: "today",
        inline: true,
        dateFormat: "Y-m-d",
      })
    }
  }
}
