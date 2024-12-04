class ErrorsController < ApplicationController
  def not_found
    respond_to do |format|
      format.html { render template: 'errors/404', status: :not_found }
      format.json { render json: { error: 'Page not found' }, status: :not_found }
    end
  end
end
