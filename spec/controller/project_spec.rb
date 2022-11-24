require 'rails_helper'

# This is testing the controller to see if it is doing the steps below
RSpec.describe ProjectsController, type: :controller do 

    # This test happens when the get command is used to call the index method
    context "GET #index" do

        it "returns a success response" do

            # This is where the actual command is carried out and the response is tested after
            get :index

            # This takes the response and tests if it was returned as successful
            # The test will fail if the result is unsuccessful
            expect(response).to be_successful
        end
    end

    # This section is testing when the get command calls the show method
    context "Get #show" do

        # This creates a test project for the test to work on
        let!(:project) { Project.create(title: "Test title", description: "Test Description") }
        it "returns a success response" do

            # In response to the call by the get command on show the test project should be shown
            get :show, params: { id: project }

            # This response is also expected to be successful.
            expect(response).to be_successful
        end
    end
end