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

    # all program IDs with at least one of the list choices
    eligible_program_ids = Program.joins(:equipment)
                                  .where("equipment.name IN (?)", equipment_names).pluck("programs.id")

    # use count to determine, of all eligible programs, which programs contain the same amount of equipment
    # as in the queried list (every program/equipment combination in equipment_programs is unique)
    matching_program_ids = Program.joins(:equipment)
                                  .where("programs.id IN (?)", eligible_program_ids)
                                  .group("programs.id")
                                  .having("COUNT(programs.id) = ?", equipment_names.length)
                                  .pluck("programs.id")

    return where(id: matching_program_ids)
  end

  def self.filter_by_sport(sport_name)
    return where("sport.name" => sport_name)
  end
end
