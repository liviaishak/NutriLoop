class ProfilesController < ApplicationController
  before_action :authenticate_user!

    def index
      @profile = Profile.all
    end

    def new
    end

    def create
    end

    def edit
      @profile = Profile.find(params[:id])
    end

    def update
    end

    def destroy
    end
end
