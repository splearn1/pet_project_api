class WebController < ApplicationController
  before_action :authenticate_request
  def user_data
    render json: {
      current_user: UserBlueprint.render_as_hash(@current_user, view: :timeline)
    }, status: :ok
  end
end
