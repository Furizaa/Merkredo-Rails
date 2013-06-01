Account.seed(:email) do |s|
  s.id          = 1337
  s.email       = 'developer@merkredo.com'
  s.password    = 'developer'
end

Event.seed(:uid) do |s|
  s.account_id = 1337
  s.name = Faker::Lorem.words.join(' ').titleize
  s.dtbegin = Time.zone.now - 1.days
  s.dtend = Time.zone.now - 1.days + 1.hours
  s.body = Faker::Lorem.sentences.join(' ')
  s.verified = true
  s.uid = '####0'
end

Event.seed(:uid) do |s|
  s.account_id = 1337
  s.name = Faker::Lorem.words.join(' ').titleize
  s.dtbegin = Time.zone.now
  s.dtend = Time.zone.now + 1.hours
  s.body = Faker::Lorem.sentences.join(' ')
  s.verified = true
  s.uid = '####1'
end

Event.seed(:uid) do |s|
  s.account_id = 1337
  s.name = Faker::Lorem.words.join(' ').titleize
  s.dtbegin = Time.zone.now + 1.hours
  s.dtend = Time.zone.now + 2.hours
  s.body = Faker::Lorem.sentences.join(' ')
  s.verified = false
  s.uid = '####2'
end

Event.seed(:uid) do |s|
  s.account_id = 1337
  s.name = Faker::Lorem.words.join(' ').titleize
  s.dtbegin = Time.zone.now + 3.hours + 1.days
  s.dtend = Time.zone.now + 3.hours + 30.minutes + 1.days
  s.body = Faker::Lorem.sentences.join(' ')
  s.verified = true
  s.uid = '####3'
end


