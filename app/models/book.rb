class Book < ApplicationRecord
    belongs_to :user
    has_many :chapters, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

    acts_as_followable
    acts_as_votable

    #validates :trama, presence: true
    #validates :testo, presence: true

    def self.search_by_title(search_term)
        where("LOWER(titolo) LIKE :search_term", search_term: "%#{search_term.downcase}%")
    end
    def self.search_by_genre(search_term)
        where("LOWER(genere) LIKE :search_term", search_term: "%#{search_term.downcase}%")
    end
    def self.search_by_tag(search_term)
        where("LOWER(tag) LIKE :search_term", search_term: "%#{search_term.downcase}%")
    end

    
end
