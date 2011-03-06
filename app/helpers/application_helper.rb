# encoding: UTF-8
module ApplicationHelper

  def headjs_include_tag(*sources)
    keys = []
    coder = HTMLEntities.new
    content_tag :script, { :type => Mime::JS }, false do
      "head.js( #{javascript_include_tag(*sources).scan(/src="([^"]+)"/).flatten.map { |src|
        src = coder.decode(src)
        key = URI.parse(src).path[%r{[^/]+\z}].gsub(/\.js$/,'').gsub(/\.min$/,'')
        while keys.include?(key) do
          key += '_' + key
        end
        keys << key
        "{ '#{key}': '#{src}' }"
      }.join(', ')} );"
    end
  end

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

  def select_my_profile
    return 'selected' if request[:controller].match(/pets/) && request[:action].match(/index/) && params[:user_id].blank?
    ''
  end

  def select_my_pets
    return 'selected' if request[:controller].match(/pets/) && request[:action].match(/index/) && params[:user_id].present?
    ''
  end

  def select_adoption_requests
    return 'selected' if request[:controller].match(/adoptions/) && request[:action].match(/index/)
    ''
  end

  def footer_links
    raw %W(
      #{link_to(I18n.t('layouts.application.footer.colaborate'), colaborate_path)}
      #{link_to(I18n.t('layouts.application.footer.learn_more'), about_path)}#{' '}#{I18n.t('layouts.application.footer.about_project')}
      #{link_to(I18n.t('layouts.application.footer.contact'), contact_path)}
    ).join(' / ')
  end

  def pet_count
    back_link = link_to(I18n.t('layouts.application.back_to_list'), :back) unless home?
    raw "#{I18n.t('layouts.application.counter.pets', :count => @count )} #{back_link}"
  end

  def home?
    %W(#{root_path} / #{root_path}/pets).include?(request.request_uri) || request.request_uri.match(/#{root_path}\/pets[^\/]/)
  end
end
