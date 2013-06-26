require_relative '../../config/environment'
require_relative '../../config/database'

class CreateTable <ActiveRecord::Migration

  def change 
    create_table :urls do |t|
      t.string :long_url
      t.string :short_url
    end
  end
end