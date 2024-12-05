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
        dateFormat: "d/m",
        locale: {
          firstDayOfWeek: 1,
          weekdays: {
            shorthand: ["Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam"],
            longhand: [
              "Dimanche",
              "Lundi",
              "Mardi",
              "Mercredi",
              "Jeudi",
              "Vendredi",
              "Samedi",
            ],
          },
          months: {
            shorthand: [
              "Jan",
              "Fév",
              "Mar",
              "Avr",
              "Mai",
              "Juin",
              "Juil",
              "Août",
              "Sep",
              "Oct",
              "Nov",
              "Déc",
            ],
            longhand: [
              "Janvier",
              "Février",
              "Mars",
              "Avril",
              "Mai",
              "Juin",
              "Juillet",
              "Août",
              "Septembre",
              "Octobre",
              "Novembre",
              "Décembre",
            ],
          },
          rangeSeparator: " - ",
        },
      })
    }
  }
}
