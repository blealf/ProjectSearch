# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$(document).ready(function() {
#	$("#comment_toggle").on("click", function() {
#		//alert("Clicked!")
#		$('.comment_box_show').fadeToggle();
#		$('.input_comment').focus();
#	});
#});

$(document).on "page:change", ->
	$('#comment_toggle').click ->
		$('.comment_box_show').fadeToggle()
		$('.input_comment').focus()

#ready = ->
#  $(document).ready ->
# 	$('#comment_toggle').click ->
#		$('.comment_box_show').fadeToggle()
#		$('.input_comment').focus()
#
#$(document).ready(ready)
#$(document).on('page:load', ready)