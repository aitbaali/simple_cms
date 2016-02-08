class CreatePages < ActiveRecord::Migration
  
  def up
    create_table :pages do |t|
      t.integer "subject_id" #or, t.references : subject
      t.string "name"
      t.string "permalink"
      t.integer "position"
      t.boolean "visible", :default => false
      t.timestamps null: false
    end

    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end

  def down
  	#Notice : you haven't do remove indexs before drop table,
  	#drop table do this for you
  	#remove_index("pages", "subject_id")
    #remove_index("pages", "permalink")
  	drop_table :pages
  end

end
