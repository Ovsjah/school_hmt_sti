class User < ApplicationRecord
  CHILDREN_CLASSES = %w(Teacher Nurse Student)
  has_many :subject_relations, foreign_key: :object_id, class_name: 'SchoolRelation' # association foreign key for performers
  has_many :object_relations, foreign_key: :subject_id, class_name: 'SchoolRelation' # association foreign key for receivers
  has_many :subjects, through: :subject_relations, foreign_key: :subject_id # performs
  has_many :objects, through: :object_relations, foreign_key: :object_id # receives
  CHILDREN_CLASSES.each { |child| scope child.tableize.to_sym, -> { where type: child } }

  def nurses
    subjects.nurses
  end
end
