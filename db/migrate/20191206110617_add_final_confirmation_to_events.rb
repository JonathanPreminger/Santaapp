class AddFinalConfirmationToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :final_confirmation, :boolean
  end
end
