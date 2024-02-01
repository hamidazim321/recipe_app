import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  controlModal(){
    let modalId = this.data.get('id')
    let modal = document.getElementById(modalId)
    modal.classList.toggle('d-none')
  }
}
