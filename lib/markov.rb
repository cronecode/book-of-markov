module Markov
  extend self

  def parse(text)

    text = text.gsub(/\n+/, ' ')
    text = text.gsub(/\.\s?/, '.@END')
    text = text.gsub(/\?\s?/, '?@END')
    text = text.gsub(/!\s?/, '!@END')

    lines = text.split('@END')
  end

  def read_file(file_name)
    File.read(file_name)
  end
end