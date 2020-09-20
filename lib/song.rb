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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.sort_by{ |song| song.name }
      # the above is an abstract shorthand for the below
    # @@all.sort{ |a,b| a.name <=> b.name }
      # the above is an abstract shorthand for the below
    # @@all.each.name.sort{ |a,b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    #  split_filename = filename.chomp(".mp3").split(" - ")
    # split_filename = filename.slice(0, filename.length-4).split(' - ')
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.create_from_filename(filename)
    #  split_filename = filename.chomp(".mp3").split(" - ")
    # split_filename = filename.slice(0, filename.length-4).split(' - ')
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  #  @@all = []
  #  @all.clear
  end




end
