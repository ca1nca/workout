class Program < ApplicationRecord
  has_and_belongs_to_many :equipment
  belongs_to :sport

  def self.filter_by_equipment(equipment_names)

    # explicitly checking for empty query param here. Without it, the intention is ambiguous when
    # also filtering by a sport (e.g. do we want all programs with the queried sport or do we want
    # all programs with no equipment and the queried sport?)
    is_empty_equipment_query = (equipment_names.length == 1 and equipment_names[0] == "")
    if is_empty_equipment_query
      return joins("LEFT OUTER JOIN equipment_programs ON programs.id = equipment_programs.program_id")
               .where("equipment_programs.program_id IS NULL")
    end

    # return programs that contain only a subset of the equipment passed in
    ineligible_program_ids = joins(:equipment)
      .where("equipment.name NOT IN (?)", equipment_names.blank? ? "" : equipment_names)
      .pluck("programs.id")
    return where("programs.id NOT IN (?)", ineligible_program_ids.blank? ? "" : ineligible_program_ids)
  end

  def self.filter_by_sport(sport_name)
    return where("sport.name" => sport_name)
  end
end
