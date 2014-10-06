$form = $("#reminder-form")

$deleted = $("<%= j(render 'reminders/deleted') %>")

$form.fadeOut ->
  $(@).replaceWith($deleted)
