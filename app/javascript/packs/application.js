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

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/actioncable").start()
require("channels")
// require("active_admin")
// require("backend_module")
require("codemirror")
// require("jquery-readyselector")
// require("messages")
// require("notifications")
// require("posts_show")
// require("upload_post_images")
// require("users_search")
// require("users")
// require('jquery')


//import "stylesheets/application"
import "controllers"
import "bootstrap"

import 'expose-loader?$!jquery';
import 'expose-loader?jQuery!jquery';

import Jquery from 'jquery'
window.jquery = $;
window.$ = $;

import { fileDetails } from '../frontend_module';
import '../users_search';
import '../codemirror';

export { fileDetails };