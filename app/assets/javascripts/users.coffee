# $(document).ready ->
#   $("#new_article").on("ajax:success", (e, data, status, xhr) ->
#     $("#new_article").append xhr.responseText
#   ).on "ajax:error", (e, xhr, status, error) ->
#     $("#new_article").append "<p>ERROR</p>"
$(document).ready ->
	$(".user-edit").on "click", (event) ->
		userId = event.target.dataset.userId
		$("#user-show-" + userId).find(".user-edit").addClass('hidden')
		$("#user-show-" + userId).find(".user-update").removeClass('hidden')
	
	$(".btn-update").on "click", (event) ->
		event.preventDefault()
		userId = event.target.dataset.userId
		role = $("#user-show-" + userId).find("select[name='role'] :selected").val()
		status = $("#user-show-" + userId).find("select[name='status'] :selected").val()

		$.ajax
			url: "/users/" + userId
			type: "PUT"
			data: { "role": role, "status": status }
			dataType: "json"
			error: (jqXHR, textStatus, errorThrown) ->
				noticeFailure("User update failed.")
			success: (data, textStatus, jqXHR) ->
				noticeSuccess("User updated successfully.")
				$("#user-show-" + userId).find(".user-edit").removeClass('hidden')
				$("#user-show-" + userId).find(".user-update").addClass('hidden')
	
	$(".user-cancel").on "click", (event) ->
		userId = event.target.dataset.userId
		$("#user-show-" + userId).find(".user-edit").removeClass('hidden')
		$("#user-show-" + userId).find(".user-update").addClass('hidden')