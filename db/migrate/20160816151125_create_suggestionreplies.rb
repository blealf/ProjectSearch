class CreateSuggestionreplies < ActiveRecord::Migration
  def change
    create_table :suggestionreplies do |t|
      t.text :note
      t.references :project_suggestion, index: true, foreign_key: true
      t.string :commenter
      t.string :note

      t.timestamps null: false
    end
  end
end
