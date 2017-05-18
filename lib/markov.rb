module Markov
  extend self
  def parse(file_name)
    File.read(file_name)
  end
end