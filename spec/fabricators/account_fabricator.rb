Fabricator(:account) do
  id 1
  email 'john.doe99@merkredo.com'
  password 'nyancat'
end

Fabricator(:developer, from: :account) do
  id 8
  email 'developer@merkredo.com'
  password 'developer'
end
