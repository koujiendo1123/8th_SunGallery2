class Painting < ApplicationRecord
  has_many_attached :images
  belongs_to :author

end
