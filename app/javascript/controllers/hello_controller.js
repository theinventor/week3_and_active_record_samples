import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "datey" ]

  connect() {
    this.dateyTarget.textContent = (new Date)
  }

  newDate(){
    this.dateyTarget.textContent = (new Date)
  }
}
