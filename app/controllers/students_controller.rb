# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    @filter_class = 'All'
    @filter_class = params[:filter_option] if params[:filter_option]
  end
end
