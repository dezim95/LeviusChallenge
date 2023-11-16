class Option < ApplicationRecord
  belongs_to :question
  has_many_attached :files
end
