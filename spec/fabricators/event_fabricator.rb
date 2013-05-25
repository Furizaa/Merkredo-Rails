Fabricator(:event) do
  id 1
  account_id 1
  name 'Retrospective'
  body 'Like every end of sprint this sounds very hindi'
  dtbegin Time.zone.parse('2015-03-15T16:30:00+01:00')
  dtend   Time.zone.parse('2015-03-15T17:00:00+01:00')
  token 'fbe65c81f49ee253d7f23e96a3dbda13bbb8cb855c8c31ce30b7df9211e488d3'
  verified false
  uid '85c7a0b651aff5d213384e36c6ec1164f047cc60f250df0b3db229618720a5cabf6435f146775ddcd9c0d940706247aba70f5fcdda2b857c'
end
