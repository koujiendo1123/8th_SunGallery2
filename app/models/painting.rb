class Painting < ApplicationRecord
  has_many_attached :image
  belongs_to :author

end
