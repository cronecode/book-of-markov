module Markov
  extend self
  def parse(file_name)
    text = File.read(file_name)
    text.gsub(/\n+/, ' ')
  end
end