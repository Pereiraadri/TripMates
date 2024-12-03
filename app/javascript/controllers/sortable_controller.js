import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
// Connects to data-controller="sortable"
export default class extends Controller {
  static targets = ["list"]
  connect() {
    const list = this.listTarget
    this.sortable = Sortable.create(list, {
      animation: 150,
      onEnd: function toto(params) {
        console.log(list.children);

        for (var i = 0; i < list.children.length; i++) {
          console.log(i);

          let li = list.children[i]; //second console output
          console.log(li);

          const id = li.dataset.choiceId
          let input = document.querySelector(`#vote_choice_id_${id}`)
          input.checked = false
        }

        const id = list.children[0].dataset.choiceId
        console.log();
        let input = document.querySelector(`#vote_choice_id_${id}`)
        console.log(id);
        console.log(input);


        input.checked = true

      }
    })
  }
}
