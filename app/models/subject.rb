class Subject < ApplicationRecord
  has_many :question_subjects
  has_many :questions, through: :question_subjects
end
