class Song
  attr_accessor :name, :artist
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(filename)
    new_song = Song.new(filename.split(" - ")[0])
    new_song.artist = (filename.split(" - ")[1])
    new_song
  end
  
  def artist_name=(name)
    Artist.find_or_create_by_name(name).add_song(self)
    
  end
end