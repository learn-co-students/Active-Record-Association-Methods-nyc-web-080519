class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    Song.all.select { |song| song.genre == self}.length
  end

  def artist_count
    artist_count = []
    Song.all.select { |song| song.genre = self }.each { |song| artist_count << song.artist}
    artist_count.length
  end

  def all_artist_names
    artist_names = []
    Song.all.each { |song| artist_names << song.artist.name}
    artist_names
  end
end
