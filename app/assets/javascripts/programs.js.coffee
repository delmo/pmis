# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
 $('#activity_start').datepicker
   dateFormat: "yy-mm-dd"
   altFormat: "mm-dd-yy"
   minDate: "+1d"

 $('#activity_completion').datepicker
   dateFormat: "yy-mm-dd"
   altFormat: "mm-dd-yy"
   minDate: "+1d"

