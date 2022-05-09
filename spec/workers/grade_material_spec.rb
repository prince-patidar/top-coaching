# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GradeMaterialJob, type: :worker do
  let(:user) { create(:user, email: 'new@student.com') }
  let(:grade) { create(:grade) }
  let!(:grade_material) { create(:grade_material, user: user, grade: grade) }
  describe 'testing worker' do
    it 'GradeMaterialJob jobs are enqueued in the scheduled queue' do
      described_class.perform_now(grade_material)
      assert_equal 'default', described_class.queue_as
    end
  end
end
