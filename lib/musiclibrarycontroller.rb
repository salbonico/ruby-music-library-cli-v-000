require 'pry'

class MusicLibraryController

attr_accessor :path

def initialize(path = "./db/mp3s")
  @path = path
 MusicImporter.new(@path).import
end

def call
  puts "Welcome to your music library!"
  puts "To list all of your songs, enter 'list songs'."
  puts "To list all of the artists in your library, enter 'list artists'."
  puts "To list all of the genres in your library, enter 'list genres'."
  puts "To list all of the songs by a particular artist, enter 'list artist'."
  puts "To list all of the songs of a particular genre, enter 'list genre'."
  puts "To play a song, enter 'play song'."
  puts "To quit, type 'exit'."
  puts "What would you like to do?"
  response = gets.strip
  if response != "exit"
    self.call
  end
end

def list_songs
index = 1
sorted_array = Song.all.sort_by {|song| song.name}
sorted_array.each do |song|
  puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  index +=1
end
end

def list_artists
index = 1
sorted_array = Artist.all.sort_by {|artist| artist.name}
sorted_array.each do |artist|
  puts "#{index}. #{artist.name}"
  index +=1
end
end

def list_genres
index = 1
sorted_array = Genre.all.sort_by {|genre| genre.name}
sorted_array.each do |genre|
  puts "#{index}. #{genre.name}"
  index +=1
end
end

def list_songs_by_artist
puts "Please enter the name of an artist:"
artist = gets.strip
index = 1
output =  []
Song.all.each do |object|
  if object.artist.name == artist
    output << object
  end
end
sorted_output = output.sort_by {|song| song.name}
sorted_output.each do |song|
  puts "#{index}. #{song.name} - #{song.genre.name}"
  index +=1
end
end

def list_songs_by_genre
puts "Please enter the name of a genre:"
genre = gets.strip
index = 1
output =  []
Song.all.each do |object|
  if object.genre.name == genre
    output << object
  end
end
sorted_output = output.sort_by {|song| song.name}
sorted_output.each do |song|
  puts "#{index}. #{song.artist.name} - #{song.name}"
  index +=1
end
end

def play_song
  index = 1
  sorted_array = Song.all.sort_by {|song| song.name}
  sorted_array.each do |song|
    puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    index +=1
  end
puts "Which song number would you like to play?"
indexin = gets.strip.to_i

puts "#{indexin}"


end




end
