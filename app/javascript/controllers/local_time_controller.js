import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        const event = new Date(this.element.textContent)
        this.element.textContent = event.toLocaleString('en-US')
    }

}
