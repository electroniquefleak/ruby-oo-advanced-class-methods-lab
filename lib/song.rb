class Song
  attr_accessor :name, :artist_name
  @@all = []

def initialize
end

  def self.all
    @@all
  end

def self.create
  song = Song.new
  @@all << song
  song
end

def self.create_by_name(name)
  song = Song.new
  song.name = name
  @@all << song
  song
end

def self.new_by_name(name)
  song = Song.new
  song.name = name
  song
end

def self.find_by_name(name)
  @@all.find {|finder| finder.name == name}
end

def self.find_or_create_by_name(name)
  return Song.find_by_name(name) if Song.find_by_name(name) != nil
  Song.create_by_name(name)
end

def self.alphabetical
  @@all.sort_by {|alphabet| alphabet.name}
end

def self.new_from_filename(file_name)
  parts = file_name.split "-"
  parts[0].strip!
  parts[1].strip!
  parts[1].gsub! ".mp3", ""
  song = Song.new_by_name parts[1]
  song.artist_name = parts[0]
  song
end

def self.create_from_filename(file_name)
  song = Song.new_from_filename(file_name)
  @@all << song
  song
end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

end
