// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "jquery"
import "popover"
import "@rails/actioncable"
import "@fortawesome/fontawesome-free"
import "@activeadmin/activeadmin"

import toastr from "./toastr"

import Turbolinks from "turbolinks"
Turbolinks.start()

import Rails from "@rails/ujs"
Rails.start()

import "codemirror"
import "./user_search"
import "./codemirror_custom"
// import "./channels"

// console.log(toastr)

window.$ = window.jQuery = require("jquery");

window.$ = toastr.options