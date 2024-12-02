import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
// Connects to data-controller="sortable"
export default class extends Controller {
  connect() {
    console.log("coucou");
    const list = this.element
    this.sortable = Sortable.create(this.element, {
      animation:150,
      onEnd: function toto(params) {
        console.log("vpio");
        const id = list.children[0].dataset.choiceId
        console.log();
        const input = document.querySelector(`#vote_choice_id_${id}`)
        input.checked = true

      }
  })
  }
}
