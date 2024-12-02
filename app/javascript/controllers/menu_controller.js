import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dropdown"];

  // Bascule l'affichage du menu déroulant
  toggle() {
    if (this.dropdownTarget.style.display === "block") {
      this.dropdownTarget.style.display = "none";
    } else {
      this.dropdownTarget.style.display = "block";
    }
  }

  // Ferme le menu lorsque l'utilisateur clique en dehors de celui-ci
  connect() {
    document.addEventListener("click", this.closeMenu.bind(this));

  }

  disconnect() {
    document.removeEventListener("click", this.closeMenu.bind(this));
  }

  closeMenu(event) {
    if (!this.element.contains(event.target)) {
      this.dropdownTarget.style.display = "none";
    }
  }
}
