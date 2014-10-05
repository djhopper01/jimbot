$form = $("form")

$form.find(".form-error").remove()

errors = JSON.parse("<%= j(raw model.errors.to_json) %>")
field_names = _.keys(errors)
for field in field_names
  $error = $("<div class='form-error text-danger'>#{errors[field]}</div>")
  $("label[for=<%= model.class.to_s.parameterize %>_#{field}]").append($error)
  # $("label[for=<%= model.class.to_s.parameterize %>_#{field}]").addClass("text-danger")

$form.prepend($errors)
