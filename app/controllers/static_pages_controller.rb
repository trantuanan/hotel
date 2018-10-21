class StaticPagesController < ApplicationController
    before_action :find_motel, only: [:show]
    def home
        @motels = Motel.all.order("created_at DESC")
    end
    def show
    end
    def find_motel
        @motel = Motel.find(params[:id])
    
        return if @motel
        flash[:danger] = t "flash.no_motel"
        redirect_to root_url
      end
      
end
