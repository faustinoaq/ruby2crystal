div.col-sm-6
  h2 Welcome to Ruby2Crystal!
  p Try a gem name to check crystal portability score.
  == form(action: "/", method: "post") do
    == csrf_tag
    div.form-group
      == text_field(name: "gem", value: "", placeholder: "ruby gem name", class: "form-control")
      br
      == submit("Submit", class: "btn btn-primary btn-xs")
      == link_to("Reload", "/", class: "btn btn-default btn-xs")
  - unless found.empty?
    h2 Found compatibilities issues:
    ul
    - found.each do |f|
      li
        = f