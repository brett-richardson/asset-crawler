module FlashHelper

  def flash_messages
    content_tag :div, id: 'flash', class: 'hide' do
      flash.map do |key, message|
        content_tag :div, class: "alert #{alert_class key}" do
          "<i class='glyphicon #{icon_class key}'></i> #{message}".html_safe
        end
      end.join.html_safe
    end
  end


  #=============================================================================
    protected
  #=============================================================================


  def alert_class( type )
    case type
      when :alert then 'alert-error'
      when :warn  then 'alert-warn'
      else             'alert-info'
    end
  end


  def icon_class( key )
    case key
      when :alert   then 'glyphicon-exclamation-sign'
      when :warn    then 'glyphicon-asterisk'
      else               'glyphicon-info-sign'
    end
  end

end
