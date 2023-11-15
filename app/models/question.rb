class Question < ApplicationRecord
  has_many :subjects, through: :question_subjects
end
