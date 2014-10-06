$form = $("#reminder-form")

$edit_form = $("<%= j(render 'reminders/form', reminder: @reminder) %>")
$form.replaceWith($edit_form)
