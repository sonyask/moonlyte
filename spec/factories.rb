Factory.define :user do |f|
  f.sequence(:username) { |i| "user#{i}"} # for unique usernames
  f.password "a"*7
  f.password_confirmation { |user| user.password } # for custom passwords
  f.sequence(:email) { |i| "foo#{i}@example.com" }
end

# moonlyter belongs to user
Factory.define :moonlyter do |f|
  f.association :user # to set up the association (could also say :foo, :factory => :user to define which factory)
  f.description "I teach guitar"
  f.experience "I have 10 years of experience"
end