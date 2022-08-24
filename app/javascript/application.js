// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import {flatpickr} from "flatpickr";
import {init_flatpickr } from "./plugins/init_flatpickr";
import { Application } from "@hotwired/stimulus"


  // awesome code


const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
