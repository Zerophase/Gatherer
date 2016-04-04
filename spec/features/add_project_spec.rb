require 'rails_helper'

describe "adding projects" do
	# :skip skips the test. :pending runs the task (if code is in the block), but doesn't
	# throw an error if it fails.
	it "allows a user to crate a project with tasks" do
		visit new_project_path
		fill_in "Name", with: "Project Runway"
		fill_in "Tasks", with: "Task 1:3\nTask 2:5"
		click_on("Create Project")
		visit projects_path
		@project = Project.find_by_name("Project Runway")
		expect(page).to have_selector( # have_selector tests specific element of page
												"#project_#{@project.id} .name",
												text: "Project Runway")
		expect(page).to have_selector(
												"#project_#{@project.id} .total-size",
		                    text: "8"
		                )
	end
end