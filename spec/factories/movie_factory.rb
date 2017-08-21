FactoryGirl.define do

  factory :movie do
    title          { FFaker::Movie.title }
    runtime        { 3600 + (rand(90) * 60) }
    released_at    { (365 + rand(365 * 20)).days.ago }
  end

end
