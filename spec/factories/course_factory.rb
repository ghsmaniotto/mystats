# frozen_string_literal: true

FactoryBot.define do
  factory :course, class: 'Models::Course' do
    to_create do |instance|
      Repositories::Courses.insert(course: instance)
    end

    id   { SecureRandom.uuid }
    name { 'my awesome route' }
    distance { 7.2 }
    trace { nil }
    session_ids { [] }

    trait :with_trace do
      trace { JSON.parse(File.read('spec/fixtures/traces/running_7km.json')) }
    end
  end
end
