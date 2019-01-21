require 'pry'
class MusicImporter

attr_accessor :path

def initialize(path)
@path = path
end

def files
output = []
input = Dir.entries(@path)
input.each do |file|
  if file.include?(".mp3")
  output << file
end
end
return output
end


end
