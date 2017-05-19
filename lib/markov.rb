module Markov
  extend self

  def parse(text)

    text = text.gsub(/\n+/, ' ')
    text = text.gsub(/\./, '.@END')
    text = text.gsub(/\?/, '?@END')
    text = text.gsub(/!/, '!@END')
  end

  def read_file(file_name)
    File.read(file_name)
  end
end