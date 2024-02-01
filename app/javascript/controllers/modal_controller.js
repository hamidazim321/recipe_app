import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  inventoryModal(){
    let form = document.querySelector('#food-form')
    form.classList.toggle('d-none')
  }
}