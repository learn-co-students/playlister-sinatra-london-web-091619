class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        self.name.slugify
    end
    
    def self.find_by_slug(search)
        all.find{|artist| artist.slug == search}
    end
end