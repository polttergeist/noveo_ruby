require_relative 'html_builder'

html_builder = HtmlBuilder.new do |html|
  html.body do |body|
    body.h1('Hello!', class_name: 'h1-formatted margin-10')

    body.p('This is paragraph') do |p|
      p.p('Paragraph inside paragraph')
    end

    body.div('New div element') do |div|
      div.p('Paragraph in div')
    end

    body.div(class_name: 'empty-div')
  end
end


html_builder.html_doc!

puts html_builder.page
puts HtmlBuilder.new.html_doc!
