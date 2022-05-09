# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  rolify

  validates :email, presence: true

  has_one :subject, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :user_grades, dependent: :destroy
  has_many :grades, through: :user_grades
  has_many :grade_materials, dependent: :destroy
  has_many :notification_recipient_copies, dependent: :destroy

  after_create :assign_default_role

  def assign_default_role
    add_role(:student) if roles.blank?
  end

  def teacher?
    has_role? :teacher
  end

  def course
    grades.first.course.course_name
  end

  def classes
    grades.map(&:class_name)
  end

  def all_student
    students = []
    grades.each do |grade|
      grade.users.each do |user|
        students << user if user.has_role? :student
      end
    end
    students
  end

  def all_students(filter_class)
    students = []
    grades.each do |grade|
      next unless filter_class == 'All' || filter_class == grade.class_name

      grade.users.each do |user|
        students << user if user.has_role? :student
      end
    end
    students
  end

  def all_teachers
    teachers = []
    grades.first.users.each do |user|
      teachers << user if user.has_role? :teacher
    end
    teachers
  end

  def student_grades
    grades.take.grade_materials
  end

  def teacher_grades
    grade_materials
  end

  def notification_count
    notification_recipient_copies.count
  end

  def notifications
    notification_recipient_copies
  end

  def unread_notifications
    notification_recipient_copies.where(status: 'unread').count
  end
end
