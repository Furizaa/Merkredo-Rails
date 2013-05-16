class CurrentAccountSerializer < ActiveModel::Serializer

  attributes :email,
             :id,
             :first_name,
             :last_name

end
