class RenameCourseNameToNameInCourses < ActiveRecord::Migration[8.0]
  def change
    rename_column :courses, :course_name, :name
  end
end
