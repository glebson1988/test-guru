class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_limit

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_limit
    errors.add(:question, 'Ответов не должно быть больше 4') if question.answers.count >= 4
  end
end
