require 'pbkdf2'

describe Pbkdf2, "#hash_password" do
  hash = Pbkdf2::hash_password("1", "", 1)

  it "hash a string" do
    hash.should eq("62c21a73192f51d88b3a3a3d0d075d482dc0f3361d8f891fb5763c4b7259f24f")
  end

  it "use many iterations" do
    Pbkdf2::hash_password("1", "", 2).should_not eq(hash)
  end

  it "use salt" do
    Pbkdf2::hash_password("1", "1", 1).should_not eq(hash)
  end
end