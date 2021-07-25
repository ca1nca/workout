class Program < ApplicationRecord
  has_and_belongs_to_many :equipment
  belongs_to :sport

  def self.filter_by_equipment(equipment_names)
    program_ids = Program.joins(:equipment)
      .where("equipment.name" => equipment_names)
      .group("programs.id")
      .having("COUNT(programs.id) = ?", equipment_names.length)
      .pluck("programs.id")

    return where(id: program_ids)
  end

  def self.filter_by_sport(sport_name)
    return where("sport.name" => sport_name)
  end
end
