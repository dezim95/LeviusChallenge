class Competency < ApplicationRecord
  has_many :question_competencies
  has_many :questions, through: :question_competencies
end
