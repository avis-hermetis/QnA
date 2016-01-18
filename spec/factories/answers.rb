FactoryGirl.define do
  sequence :body do |n|
    "AnswerText#{n}"
  end

  factory :answer do
    body
    question
    user
    best
  end

  factory :invalid_answer, class: 'Answer' do
    body nil
    question
  end
end
