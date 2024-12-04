import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="confirm"
export default class extends Controller {
  static values = {
    message: String
  }
  confirm(event) {
    if (!window.confirm(this.messageValue || "Êtes-vous sûr ?")) {
      event.preventDefault(); // Empêche l'exécution du lien
    }
  }
}
