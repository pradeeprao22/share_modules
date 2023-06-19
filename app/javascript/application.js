// Entry point for the build script in your package.json
console.log("file loaded")

import "jquery"
import "@hotwired/turbo-rails"
import "bootstrap"
import "bootstrap-tooltip"
import "dropzone"
import "popover"
import "@rails/actioncable"
// Import Font Awesome styles
import "@fortawesome/fontawesome-free/css/all.css"
// import "@activeadmin/activeadmin"
// import "./testing"

import "./channels"
import "./toastr"

import Turbolinks from "turbolinks"
Turbolinks.start()

import Rails from "@rails/ujs"
Rails.start()

import "codemirror"
import "./codemirror_custom"
// import "./channels"

window.$ = window.jQuery = require("jquery");

// window.$ = toastr.options
import "./user_search"