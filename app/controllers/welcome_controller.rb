require "cancan.rb"

class WelcomeController < ApplicationController
    def index
    end

    def new
        @welcome = Welcome.new
        notifier = Rollbar.scope({
            :environment => "production"
        })
        notifier.error("hello testing uyser")
    end

    def edit
        @welcome = Welcome.find(params[:id])
    end

    def update
        @welcome = Welcome.find(params[:id])
 
        if @welcome.update(welcome_params)
            Rollbar.error("pleaseeeee")
            redirect_to @welcome
        else
            render 'edit'
        end
    end

    def create
        @welcome = Welcome.new(welcome_params)

        if @welcome.save
            Rollbar.error(welcome_params[:text])
            redirect_to @welcome
        else
            render 'new'
        end
    end

    def show
        @welcome = Welcome.find(params[:id])
    end

    def welcome_params
        params.require(:welcome).permit(:text, :number)
    end
end