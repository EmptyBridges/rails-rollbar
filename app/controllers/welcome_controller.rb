class WelcomeController < ApplicationController
    def index
    end

    def new
        scope = {:person => {:id => '1',
                             :username => 'wazzzup',
                             :email => 'noemails@email.com'}}
        new_config = {endpoint: 'https://devbox/api/1/',
                      verify_https: false}
        Rollbar.scoped(scope, new_config) do
            begin
                Rollbar.error('I am a live.')
            rescue => e
                Rollbar.error(e)
            end
        end
    end

    def create
        @welcome = Welcome.new(welcome_params)

        if @welcome.save
            Rollbar.error("crocodile")
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