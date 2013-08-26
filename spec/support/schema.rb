ActiveRecord::Schema.define do
  self.verbose = false

  create_table :events, force: true do |t|
    t.string :title
    t.string :slug
    t.datetime :starts_at
  end
end
