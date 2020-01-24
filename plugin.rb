# NOTE
# ruby -v => 2.5.1
# gem install prawn

class Plugin
  require 'prawn'
  def write_to_text str
    File.open('plain_text.txt','w'){ |f|
      f.write(str)
    }
  end

  def write_to_pdf str
    obj = Prawn::Document.new
    obj.text(str)
    obj.render_file('plain_text.pdf')
  end

  def foobar str
  end

  def plugin_text
    plugin_text = ["Plain Text", "PDF", "foobar"]
  end

  def plugin_methods
    plugin_methods = ["write_to_text", "write_to_pdf", "foobar"]
  end

end