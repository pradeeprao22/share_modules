// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "jquery"
import "@rails/actioncable"

import Turbolinks from "turbolinks"
Turbolinks.start()

import Rails from "@rails/ujs"
Rails.start()

import "codemirror"
import "./user_search"
import "./active_admin"
import "./codemirror_custom"
// import "./channels"

window.$ = window.jQuery = require("jquery");
