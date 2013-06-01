class EventSerializer < ActiveModel::Serializer

  attributes :id, :body, :name, :dtbegin, :dtend

end
