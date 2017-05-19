module Markov
  extend self

  def parse(file_name)
    text = read_file(file_name)
    text = replace_newlines(text)
    text = insert_end_markers(text)
    lines = separate_lines(text)

    lines
  end

  def separate_lines(text)
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