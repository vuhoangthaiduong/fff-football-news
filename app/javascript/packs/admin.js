// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "bootstrap"
import "../stylesheets/admin"
import "./admin/sb-admin-2"
import "./admin/bootstrap.bundle.min.js"
import "./admin/replace_modal_content.js"
import "./admin/get_seasons_by_league.js"
import "./admin/add_match_event.js"

window.$ = window.jQuery = require("jquery");
require("jquery-datetimepicker")

Rails.start()
ActiveStorage.start()
$(document).ready(function() {
  $('.datetimepicker').datetimepicker();
});
