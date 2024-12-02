import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr"; // Retirer ".js", c'est implicite avec ES Modules

// Appliquer Flatpickr sur les champs
document.addEventListener("turbo:load", () => {
  flatpickr(".datepicker", {
    locale: French, // Appliquer la localisation française
    dateFormat: "Y-m-d", // Format standard ISO
    minDate: "today", // Empêche de sélectionner une date passée
    enableTime: false, // Pas besoin de choisir l'heure
  });
});
