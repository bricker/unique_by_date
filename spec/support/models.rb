class Event < ActiveRecord::Base
  validates :slug, unique_by_date: { scope: :starts_at, filter: :day, allow_blank: true, message: "not unique." }
  validates :title, unique_by_date: { scope: :starts_at, filter: :month, allow_blank: true, message: "not unique." }
end
