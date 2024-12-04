import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-preview"
export default class extends Controller {
  static targets = ["input", "preview"]

  connect() {

    console.log("ImagePreviewController connected!");
  }

  preview() {
    console.log("cc");

    console.log("File input changed!");
    const file = this.inputTarget.files[0];

    if (file) {
      console.log("File detected:", file);
      const reader = new FileReader();

      reader.onload = (e) => {
        console.log("File read successfully!");
        this.previewTarget.src = e.target.result; // Définir l'image source
        this.previewTarget.style.display = 'block'; // Afficher l'image
      };

      reader.readAsDataURL(file); // Lire le fichier comme URL de données
    } else {
      console.log("No file detected.");

    }
  }
}
