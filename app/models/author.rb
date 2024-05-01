class Author < ApplicationRecord
  belongs_to :authorable, polymorphic: true
  has_many :paintings, dependent: :destroy
end
