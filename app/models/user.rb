class User < ApplicationRecord
  has_many :subject_relations, foreign_key: :receiver_id, class_name: 'SchoolRelation', inverse_of: :object # association foreign key for performers
  has_many :object_relations, foreign_key: :performer_id, class_name: 'SchoolRelation', inverse_of: :subject # association foreign key for receivers
  has_many :subjects, through: :subject_relations, foreign_key: :performer_id
  has_many :objects, through: :object_relations, foreign_key: :receiver_id

  scope :teachers, -> { where type: 'Teacher' }
  scope :nurses, -> { where type: 'Nurse' }
  scope :students, -> { where type: 'Student' }

  def nurses
    subjects.nurses
  end
end
