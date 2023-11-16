class Question < ApplicationRecord
  has_many_attached :files
  has_many :options
  has_many :question_subjects
  has_many :subjects, through: :question_subjects
  has_many :question_competencies
  has_many :competencies, through: :question_competencies
  accepts_nested_attributes_for :options, :question_subjects, :question_competencies
end
