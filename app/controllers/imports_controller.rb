# frozen_string_literal: true

require 'use_cases/session/import_gpx'

class ImportsController < ApplicationController
  def index; end

  def create
    data = params['input'].read
    UseCases::Session::ImportGpx.new(data: data).run

    redirect_to sessions_index_path
  end
end
