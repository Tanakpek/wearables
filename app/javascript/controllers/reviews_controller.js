import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['box']

  connect() {
    console.log("Hello from our first review controller")
  }

  toggle() {
    console.log("asd");
  }


}
