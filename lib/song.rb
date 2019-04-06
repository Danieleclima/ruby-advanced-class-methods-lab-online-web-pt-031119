require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    @@all << self.new
    @@all[@@all.size - 1]
  end
  
  def self.new_by_name (title)
    song = self.new
    song.name = title
    song
  end
  
  def Song.create_by_name (song)
    new_song = self.new
    new_song.name = song
    @@all << new_song
    new_song
  end
  
  def Song.find_by_name (song)
    @@all.find do |songs|
    songs.name == song
  end

end

  def Song.find_or_create_by_name (song)
      find = Song.find_by_name (song)
      if find.nil?
        Song.create_by_name (song)
      else
        find
      end
end

  def Song.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

def Song.new_from_filename (file)
  lenght = file.size
  file [lenght -4, lenght] = ""
  array = file.split(" - ")
  song = self.new
  song.name = array[1]
  song.artist_name = array[0]
  song
end

def Song.create_from_filename (file)
  @@all << Song.new_from_filename(file)
end

def Song.destroy_all
  @@all.clear
end
end
