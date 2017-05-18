module Markov
  extend self

  def parse(text)
    #text = File.read(file_name)
    text = text.gsub(/\n+/, ' ')
    text = text.gsub(/\./, '.@END')
    text = text.gsub(/\?/, '?@END')
    text = text.gsub(/!/, '!@END')
  end
end