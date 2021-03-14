class CreateSchoolRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :school_relations do |t|
      t.bigint :performer_id, null: false
      t.bigint :receiver_id, null: false
      t.timestamps
      t.index %i(performer_id receiver_id), unique: true
      t.index %i(receiver_id performer_id), unique: true
    end
  end
end
