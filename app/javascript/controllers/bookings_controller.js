


import { Controller } from "@hotwired/stimulus"
export default class extends Controller {

  static targets = ['date']


  connect() {
    console.log("movies controller connected")
  }

  add(event){
    const firstselected = false;
    console.log(this.dateTarget)
  }

  //add(event){
   // console.log(document.querySelectorAll('.day'));
  //}
}
