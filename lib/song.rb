class Song

@@all = []

attr_accessor :name

def initialize(name, artist = nil, genre = nil)
  @name = name
  self.artist = artist
  self.genre = genre

end



def self.all
  @@all
end

def self.destroy_all
  @@all.clear
end

def save
  @@all << self
end

def self.create(name)
  new_object = self.new(name)
  new_object.save
  return new_object
end

def artist
  @artist
end

def artist=(artist)
 if artist != nil
 @artist = artist
 artist.add_song(self)
 end
end

def genre
  @genre
end

def genre=(genre = nil)
  if genre != nil
@genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end
end

def self.find_by_name(name)
self.all.each do |song|
   if song.name == name
     return song
   end
 end
 return false
end

def self.find_or_create_by_name(name)
  output = self.find_by_name(name)
  if output != false
  return output
else
  self.create(name)
end
end


def self.new_from_filename(filename)
array = filename.split(" - ")

end


end
