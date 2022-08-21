class HtmlBuilder
  attr_reader :page

  def initialize(&block)
    @page = ''
    @content = ''
    unless block == nil
      @content = "<html>\n"
      block.call(self)
      @content += '</html>'
    end
  end

  def html_doc!
    @page = @content
  end

  def body(&block)
    @content += "<body>\n"
    block.call(self)
    @content += "</body>\n"
  end

  def to_s
    page
  end

  private

  def method_missing(method_name, *args, class_name: "")
    @content += class_name == "" ? "<#{method_name}>\n#{args.first}\n" : "<#{method_name} class='#{class_name}'>\n#{args.first}\n"
    yield(self) if block_given?
    @content += "</#{method_name}>\n\n"
  rescue NoMethodError
    method_missing(method_name, *args, class_name: class_name)
  end
end
