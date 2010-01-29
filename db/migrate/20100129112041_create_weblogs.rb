class CreateWeblogs < ActiveRecord::Migration
  def self.up
    create_table :weblogs do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :weblogs
  end
end
