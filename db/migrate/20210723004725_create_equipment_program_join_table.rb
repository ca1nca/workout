class CreateEquipmentProgramJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :equipment, :programs, id: false do |t|
      t.index :equipment_id
      t.index :program_id
    end
  end
end
