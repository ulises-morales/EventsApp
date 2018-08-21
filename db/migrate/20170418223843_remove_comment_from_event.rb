class RemoveCommentFromEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :comment, :text
  end
end
