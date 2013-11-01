class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :file
      t.datetime :send_at

      t.timestamps
    end
  end
end
