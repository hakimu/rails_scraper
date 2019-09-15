# frozen_string_literal: true

FactoryBot.define do
  factory :rating do
    star 1
    song
    user
  end
end
