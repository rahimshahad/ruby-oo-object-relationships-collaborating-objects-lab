require "pry"
class Artist
    @@all = []
    attr_accessor :name
    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end
    def songs
        Song.all.select { |song| song.artist == self }
    end
    def add_song(song)
        song.artist = self
    end
    def self.find_or_create_by_name(name)
        the_artist = self.all.detect { |artist| artist.name == name}
        if the_artist
            the_artist
        else
            Artist.new(name)
        end
    end
    def print_songs
        songs.map do |song|
            puts song.name
        end
    end
end