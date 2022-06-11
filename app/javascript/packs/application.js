/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
// debugger;

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/actioncable").start()
require("channels")

// THIS IS MAKING jQuery AVAILABLE EVEN INSIDE Views FOLDER
require("jquery") // Don't really need to require this...
//require("jquery-ui")
//require("bootstrap")
// Internal javascript files
// require("active_admin")
require("backend_module")
require("codemirror")
require("jquery-readyselector")
require("messages")
require("notifications")
//require("posts_show")
require("upload_post_images")
require("users_search")
// require("users")
// jquery
import $ from 'jquery';

global.$ = $
global.jQuery = $

import 'core-js/stable'
import 'regenerator-runtime/runtime'
//import "stylesheets/application"
//import "bootstrap"

// import Jquery from 'jquery'
// window.jquery = $;
// window.$ = $;

import 'bootstrap/dist/js/bootstrap.bundle';
import { fileDetails } from '../frontend_module';
import '../users_search';
import '../codemirror';

export { fileDetails };

document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})

// Pass the button, the tooltip, and some options, and Popper will do the
// magic positioning for you:
// createPopper(button, tooltip, {
//   placement: 'right',
// });