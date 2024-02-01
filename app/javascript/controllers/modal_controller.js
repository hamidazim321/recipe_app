import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  foodModal(){
    let form = document.querySelector('#food-form')
    form.classList.toggle('d-none')
  }
}