require 'rails_helper'

RSpec.feature "Projects", type: :feature do

  # These tests will be done in the context of creating a new project
  context "Create new project" do

    # The project creation will be done before each test so that the test project
    # can be used in each one
    before (:each) do

      # A new project path will be visited each time so that a new project is used
      # every time
      visit new_project_path

      # This will fill the project title in the new test project for the test
      within("form") do

        # Fills the title form with "Test title" as the text
        fill_in "Title", with: "Test title"
      end
    end
  
    # This test should be successful
    scenario "should be successful" do

      # This fills the description form with "Test description" as the text
      fill_in "Description", with: "Test description"

      # This clicks Create Project button on the webpage to simulate creating a new
      # project with a title and description
      click_button "Create Project"

      # This tests whether the webpage returned a response saying that the project was
      # successfully created. If the project was not successfully created then the test fails
      expect(page).to have_content("Project was successfully created")
    end
  
    # This test should fail
    scenario "should fail" do

      # This clicks the Create Project button without filling in the description, which
      # means the project should not have enough information entered to be created
      click_button "Create Project"

      # Because the project does not have enough information to be created, this test is
      # expected to fail and show that projects cannot be created with insufficient information
      expect(page).to have_content("Description can't be blank")
    end
  end

  # These tests will be done in the context that there is already a project and it is being updated
  context "Update project" do

    # This creates a project with a title and description
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    
    # This will enter the edit project path before each test is done
    before(:each) do
      visit edit_project_path(project)
    end

    # This test should pass successfully
    scenario "should be successful" do

      # Fills the description form with a new description 
      within("form") do
        fill_in "Description", with: "New description content"
      end

      # The Update Project button is pressed, meaning the project should have
      # a new description now
      click_button "Update Project"

      # The tests checks to make sure that the project description was updated correctly
      # if it does not, the test will fail
      expect(page).to have_content("Project was successfully updated")
    end

    # This test should fail
    scenario "should fail" do

      # This fills the description form with an empty description
      within("form") do
        fill_in "Description", with: ""
      end

      # The Update Project button is pressed which will attempt to update the
      # project description
      click_button "Update Project"

      # The attempt should return a failure because the description cannot be left blank
      expect(page).to have_content("Description can't be blank")
    end
  end

## Add the following code but comment it out. We are working on getting this to work
#  context "Remove existing project" do
#    let!(:project) { Project.create(title: "Test title", description: "Test content") }
#    scenario "remove project" do
#      visit project_path('1')
#      click_link "Destroy this project"
#      expect(page).to have_content("Project was successfully destroyed")
#      expect(Project.count).to eq(0)
#    end
#  end
end