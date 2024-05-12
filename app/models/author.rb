class Author < ApplicationRecord
  belongs_to :authorable, polymorphic: true
  has_many :paintings, dependent: :destroy
  validates :name , presence: true, length: { minimum: 1, maximum: 20 }
end
