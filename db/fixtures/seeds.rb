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

[
    { first_name: 'Phillip', last_name: 'Fry' },
    { first_name: 'Leela', last_name: 'Turanga' },
    { first_name: 'Bender', last_name: 'Bending-Rodriguez' },
    { first_name: 'John', last_name: 'Zoidberg' },
    { first_name: 'Amy', last_name: 'Wong' },
    { first_name: 'Hermes', last_name: 'Conrad' },
    { first_name: 'Lord', last_name: 'Nibbler' },
    { first_name: 'Zapp', last_name: 'Brannigan' },
    { first_name: 'Kif', last_name: 'Kroker' },
    { first_name: 'Mom', last_name: 'Mom' },
    { first_name: 'Alfred', last_name: 'Gore' }
].each_with_index do |crew, i|
  Employee.seed(:id) do |s|
    s.id = i
    s.email = crew[:first_name].downcase + '.' + crew[:last_name].downcase + '@merkredo.com'
    s.first_name = crew[:first_name]
    s.last_name = crew[:last_name]
    s.company_id = 8
  end
end
