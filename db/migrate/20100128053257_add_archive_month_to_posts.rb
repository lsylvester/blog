class AddArchiveMonthToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :archive_month, :datetime
  end

  def self.down
    remove_column :posts, :archive_month
  end
end
