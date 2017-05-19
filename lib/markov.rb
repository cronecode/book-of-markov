module Markov
  extend self

  def parse(text)

    text = replace_newlines(text)
    text = insert_end_markers(text)

    text.split('@END')
  end

  def insert_end_markers(text)
    text = text.gsub(/\.\s?/, '.@END')
    text = text.gsub(/\?\s?/, '?@END')
    text = text.gsub(/!\s?/, '!@END')
  end


  def replace_newlines(text)
    text.gsub(/\n+/, ' ')
  end

  def read_file(file_name)
    File.read(file_name)
  end
end