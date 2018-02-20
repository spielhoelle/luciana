module ApplicationHelper

  def bootstrap_class_for(flash_type)
    case flash_type
    when 'success'
      'alert-success'
    when 'error'
      'alert-danger'
    when 'alert'
      'alert-warning'
    when 'notice'
      'alert-info'
    else
      flash_type.to_s
    end
  end

  def class_for_controller
    "#{controller.controller_name} #{controller.action_name} #{(user_signed_in? ? 'signed_in' : '')}"
  end

  def count_messages
    Message.all.count
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(:line_numbers => :table)
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(:filter_html => true, 
                                  :hard_wrap => true)
    options = {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :strikethrough => true,
      :lax_html_blocks => true,
      :superscript => true
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end
  #def markdown(content)
    #@markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
      #autolink: true,
      #space_after_headers: false,
      #fenced_code_blocks: true,
      #underline: true,
      #highlight: true,
      #footnotes: true,
      #tables: true
    #})
    #@markdown.render(content)
  #end

end
