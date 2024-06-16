module ApplicationHelper
	def display_flash(classes = '')
    content_tag :div, render_flash, id: 'flash-wrapper', class: classes
  end

  # Public: Helper to display flash.
  #
  # flash[:notice]  - green
  # flash[:alert]   - yellow
  # flash[:error]   - red
  # flash[:info]    - blue
  #
  def render_flash
    content = String.new.html_safe
    flash.each do |key, value|
      # Tracking would be handled separately
      next if key == "tracking"

      classes = "alert"
      case key
      when "alert"   then   classes << " alert-info"
      when "notice"  then   classes << " alert-success"
      when "error"  then   classes << " alert-danger"
      else                  classes << " alert-#{key}"
      end
      content << content_tag(:div, value, class: classes)
    end

    content
  end
end
