import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {

  click(event) {
    const choiceId = event.currentTarget.dataset.choiceId
    let input = document.querySelector(`#vote_choice_id_${choiceId}`)

    input.checked = true;

    const otherInputs = document.querySelectorAll(".check-box > i")
    otherInputs.forEach(otherInput => {
      otherInput.classList.remove('fa-square-check')
      otherInput.classList.add('fa-square')
    })

    const inputSquare = document.querySelector(`#choice_square_${choiceId} > i`)

    inputSquare.classList.remove('fa-square')
    inputSquare.classList.add('fa-square-check')
  }
}
