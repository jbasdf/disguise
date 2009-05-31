class CreateThemes < ActiveRecord::Migration
  def self.up
    create_table :themes, :force => true do |t|
      t.string   "current"
    end
  end

  def self.down
    drop_table :themes
  end
end
