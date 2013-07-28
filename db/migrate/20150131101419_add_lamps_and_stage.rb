class AddLampsAndStage < ActiveRecord::Migration
  def change

    create_table :stages do |t|
      t.boolean :active
      t.timestamps
    end

    create_table :lamps do |t|
      t.timestamps
    end

    add_column :lamps, :stage_id, :string
    add_column :lamps, :color, :string
  end
end
