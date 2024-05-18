// javascript/controllers/application.js

import { Application } from "@hotwired/stimulus"

const stimulusApplication = Application.start()

// Configure Stimulus development experience
stimulusApplication.debug = false
window.Stimulus = stimulusApplication

export { stimulusApplication };
