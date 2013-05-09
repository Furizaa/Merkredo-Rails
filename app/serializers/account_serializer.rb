class AccountSerializer < ActiveModel::Serializer
  attributes :id,
             :first_name,
             :last_name,
             :email,
             {full_name: :string}

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
