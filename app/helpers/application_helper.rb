module ApplicationHelper
	def my_devise_error_messages!
	    return "" if resource.errors.empty? && resource.accountable.errors.empty?

	    messages = accountable_messages = ""

	    if !resource.errors.empty?
	      messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
	    end

	    if !resource.accountable.errors.empty?
	      accountable_messages = resource.accountable.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
	    end

	    messages = messages + accountable_messages   
	    sentence = I18n.t("errors.messages.not_saved",
	                      :count => resource.errors.count + resource.accountable.errors.count,
	                      :resource => resource.class.model_name.human.downcase)

	    html = <<-HTML
	    <div id="error_explanation">
	    <h2>#{sentence}</h2>
	    <ul>#{messages}</ul>
	    </div>
	    HTML

	    html.html_safe
    end
end
