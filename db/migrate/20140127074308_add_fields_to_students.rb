class AddFieldsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :course_of_interest, :string
    add_column :students, :phone_home, :string
    add_column :students, :phone_cell, :string
    add_column :students, :email, :string
    add_column :students, :current_institution, :string
    add_column :students, :source, :string
    add_column :students, :target_institution, :string
    add_column :students, :previous_score1, :float
    add_column :students, :previous_score2, :float
    add_column :students, :previous_score3, :float
    add_column :students, :previous_score_total, :float
    add_column :students, :target_score1, :float
    add_column :students, :target_score2, :float
    add_column :students, :target_score3, :float
    add_column :students, :target_score_total, :float
  end
end
