# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$('#start-date').datetimepicker({
		format: "MM/DD/YYYY"
	})
	$('#end-date').datetimepicker({
		format: "MM/DD/YYYY"
	})          

	$("#btn-search").on "click", (event) ->
		event.preventDefault();
		$.ajax
			url: "/filter_courses",
			type: "get"
			data: $("#search-form" ).serialize(),
			dataType: "html"
			error: (jqXHR, textStatus, errorThrown) ->
				noticeFailure("courses not found.")
			success: (data, textStatus, jqXHR) ->
				noticeSuccess("Found courses.")
				$("#courses").html(data);