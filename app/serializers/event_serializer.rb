class EventSerializer < ActiveModel::Serializer

  attributes :id, :body, :name

  def begin
    object.dtbegin.to_s
  end

  def end
    object.dtend.to_s
  end

end
