require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    CAT_COLORS = ['Black', 'Brown', 'Gray', 'Orange', 'White'].freeze()
    CAT_SEXES = ['M', 'F'].freeze()

    validates :color, inclusion: CAT_COLORS # color must be included in CAT_COLORS
    validates :sex, inclusion: CAT_SEXES # sex must be included in CAT_SEXES
    validates :birth_date, :color, :name, :sex, presence: true
    
    # Method that uses birth_date to calculate age
    def age
        time_ago_in_words(birth_date)
    end
end


# class Artwork < ApplicationRecord
#     validates :title, presence: true
#     validates :image_url, presence: true, uniqueness: true
#     validates :title, uniqueness: { scope: :artist_id }

#     belongs_to :artist, foreign_key: :artist_id, class_name: 'User'
#     has_many :artwork_shares
#     has_many :shared_viewers, 
#         through: :artwork_shares, 
#         source: :viewer
#     has_many :comments,
#         dependent: :destroy
#     has_many :likes, as: :likeable

#     # class method that returns all of the artworks made by the user OR shared with the user
#     def self.artworks_for_user_id(user_id)
#         Artwork.left_outer_joins(:artwork_shares)
#                 .where('(artworks.artist_id = :user_id) OR (artwork_shares.viewer_id = :user_id)', user_id: user_id)
#                 .distinct 
#     end
    
# end