class Project < ApplicationRecord
    # Validates that there is a title and description
    validates_presence_of :title, :description
end
