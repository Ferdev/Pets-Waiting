module ApplicationHelper
  def error_messages(model)
    return "" if model.errors.empty?

    messages = model.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.template.header', :count => model.errors.length, :model => model.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe

  end
end
