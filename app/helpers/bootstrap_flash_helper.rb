module BootstrapFlashHelper
  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      next if [:adwords_tracking, :ganalytics_event, :mixpanel, :timeout, :timedout].include?(type)
      type = :success if type == :notice
      type = :danger if type == :alert
      text = content_tag(:div,
                         content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
                             content_tag(:span,message), :class => "alert fade in text-center alert-#{type}")
      flash_messages << text if message
    end
    content_tag(:div, flash_messages.join("\n").html_safe, class: 'alert-inside-container').html_safe if flash_messages.any?
  end
end