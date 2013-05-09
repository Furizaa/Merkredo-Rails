Fabricator(:account) do
  id 1
  email 'john.doe99@merkredo.com'
  company_id 0
  first_name 'John'
  last_name 'Doe'
  password 'nyancat'
end

Fabricator(:developer, from: :account) do
  id 8
  email 'developer@merkredo.com'
  company_id 0
  first_name 'Hubert'
  last_name 'Farnsworth'
  password 'developer'
end