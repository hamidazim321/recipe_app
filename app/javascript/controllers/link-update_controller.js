import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "link" ]

  updateLink() {
    let inventoryId = this.element.value;
    let target = document.getElementById('generate-link')
    let newHref = target.href.replace(/inventories\/\d+/, 'inventories/' + inventoryId);
    target.href = newHref;
  }
}
