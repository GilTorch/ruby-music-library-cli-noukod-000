require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path=path
    @music_importer=MusicImporter.new(path)
    @music_importer.import
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
    loop do
      input = gets.strip
      break if input == 'exit'
    end
    # gets.strip
    # gets.strip
    # gets.strip
  end

  def list_songs
    index = 0
    sorted_songs=Song.all.sort{|prev_song,next_song| prev_song.name<=>next_song.name}
    sorted_songs.each do |song|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      index+=1
    end
  end

  def list_artists
    index = 0
    sorted_artists=Artist.all.sort{|prev_artist,next_artist| prev_artist.name<=>next_artist.name}
    sorted_artists.each do |artist|
      puts "#{index+1}. #{artist.name}"
      index+=1
    end
  end

  def list_genres 
    sorted_genres=Genre.all.sort{|prev_genre,next_genre| prev_genre.name<=>next_genre.name}
    sorted_genres.each do |genre|
      puts "#{index+1}. #{genre.name}"
      index+=1
    end
  end

end
