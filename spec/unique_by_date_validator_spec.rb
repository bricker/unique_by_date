require 'spec_helper'

describe UniqueByDateValidator do
  it 'is not valid if another exists with given parameters' do
    event1 = Event.create(slug: "same", starts_at: 1.day.ago)
    event2 = Event.new(slug: "same", starts_at: 1.day.ago)

    event2.should_not be_valid
  end

  it 'is valid if dates are not in the same scope' do
    event1 = Event.create(slug: "same", starts_at: 3.days.ago)
    event2 = Event.new(slug: "same", starts_at: 1.day.ago)

    event2.valid?
    puts event2.errors.full_messages
    event2.should be_valid
  end

  it "is valid if the attribute is already unique" do
    event1 = Event.create(slug: "same", starts_at: 1.day.ago)
    event2 = Event.new(slug: "notsame", starts_at: 1.day.ago)

    event2.should be_valid
  end

  it 'can use a different filter' do
    event1 = Event.create(title: "same", starts_at: 1.day.ago)
    event2 = Event.new(title: "same", starts_at: 2.days.ago)

    # in models.rb, title uniqueness if filtered by month
    event2.should_not be_valid

    event2.starts_at = 3.months.ago
    event2.should be_valid
  end
end
