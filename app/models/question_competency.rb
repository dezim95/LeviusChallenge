class QuestionCompetency < ApplicationRecord
  belongs_to :question
  belongs_to :competency, optional: true
end
