class Option < ApplicationRecord
  belongs_to :question
  has_many_attached :option_files
  has_many_attached :files
end
