class GymsController < ApplicationController
  def index
    gyms = Gym.all
    render json: gyms, status: :ok
  end

  def show
    gym = Gym.find(params[:id])
    render json: gym, status: :found
  end

  def update
    gym = Gym.find(params[:id])
    gym.update!(gym_params)
    render json: gym, status: :ok
  end

  def destroy
    gym = Gym.find(params[:id])
    gym.destroy
    render json: {}, status: :no_content
  end

  private

  def gym_params
    params.permit(:name, :location)
  end
end
