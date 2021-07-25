class ProgramSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_one :sport
  has_many :equipment, key: :required_equipment
end
