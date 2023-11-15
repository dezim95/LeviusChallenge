class Subject < ApplicationRecord
  has_many :questions, through: :question_subjects
end
