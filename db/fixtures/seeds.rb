Company.seed(:name) do |s|
  s.id    = 8
  s.name  = 'Acme Inc.'
  s.plan  = 0
end

Account.seed(:email) do |s|
  s.id          = 1337
  s.email       = 'developer@merkredo.com'
  s.password    = 'developer'
  s.first_name  = 'Hubert'
  s.last_name   = 'Farnsworth'
  s.company_id  = 8
  s.gender      = 0
  s.group       = 0
end