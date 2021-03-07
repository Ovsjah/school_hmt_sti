class SchoolRelation < ApplicationRecord
  belongs_to :subject, class_name: 'User'
  belongs_to :object, class_name: 'User'
end
