class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :photo, :name, :age, :description, :city, :state, :status
  has_one :user
end
