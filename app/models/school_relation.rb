class SchoolRelation < ApplicationRecord
  belongs_to :subject, class_name: 'User', foreign_key: :performer_id
  belongs_to :object, class_name: 'User', foreign_key: :receiver_id
end
