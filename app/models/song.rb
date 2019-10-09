class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        self.name.slugify
    end
    
    def self.find_by_slug(search)
        all.find{|song| song.slug == search}
    end

end

