// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { Application } from "@hotwired/stimulus"
import "flatpickr";

import { Flatpicker } from "./plugins/init_flatpickr";

document.addEventListener('turbo:load', function(){
  console.log("from app")
  console.log("hello from flatpicker")
  const startDateInput = document.getElementById('booking_start_date');
  const endDateInput = document.getElementById('booking_end_date');
  if (startDateInput) {
  const unavailableDates = JSON.parse(document.querySelector('#flat-booking-dates').dataset.unavailable)
  endDateInput.disabled = true

  flatpickr(startDateInput, {
    minDate: "today",
    disable: unavailableDates,
    dateFormat: "Y-m-d",
  });

  console.log('im in the file')

  startDateInput.addEventListener("change", (e) => {
    if (startDateInput != "") {
      endDateInput.disabled = false
    }
    flatpickr(endDateInput, {
      minDate: e.target.value,
      disable: unavailableDates,
      dateFormat: "Y-m-d"
      });
    })
  };
 });
