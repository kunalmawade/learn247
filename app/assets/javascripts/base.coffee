
	window.noticeFailure = (message) ->
		message = $('<div class="alert alert-danger" role="alert">' + message + '</div>')
		$('#notice').append(message)
		message.fadeOut(3000, clearNotice)

	window.noticeSuccess = (message) ->
		message = $('<div class="alert alert-success" role="alert">' + message + '</div>')
		$('#notice').append(message)
		message.fadeOut(3000, clearNotice)

	window.clearNotice = () ->
		$('#notice').empty()
