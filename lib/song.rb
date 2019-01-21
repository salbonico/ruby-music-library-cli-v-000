class Song

@@all = []

attr_accessor :name

def initialize(name, artist = nil)
  @name = name
  self.artist = artist
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
artist.add_song(self)
end

end
