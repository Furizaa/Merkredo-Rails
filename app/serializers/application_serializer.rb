class ApplicationSerializer < ActiveModel::Serializer
  embed :ids, inlude: true
end