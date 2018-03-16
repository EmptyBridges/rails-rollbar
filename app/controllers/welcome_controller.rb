require "cancan.rb"

class WelcomeController < ApplicationController
    def index
        # Rollbar.error("yo yo yo")
        # scope = {}
        # new_config = {:scrub_fields => [:_railbar_session,:_csrf_token,:controller]}
        # Rollbar.scoped(scope, new_config) do
        #     Rollbar.error("hello")
        # end
        # cancan = CanCan.new()
        # raise CanCan::AccessDenied
        # raise "CanCan::AccessDenied"
    end

    def new
        @welcome = Welcome.new
        # Rollbar.error("hello")
        # scope = {:person => {:id => '1',
        #                      :username => 'wazzzup',
        #                      :email => 'noemails@email.com'}}
        # new_config = {endpoint: 'https://devbox/api/1/',
        #               verify_https: false}
        # Rollbar.scoped(scope, new_config) do
        #     begin
        #         Rollbar.error('I am a live.')
        #     rescue => e
        #         Rollbar.error(e)
        #     end
        # end
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