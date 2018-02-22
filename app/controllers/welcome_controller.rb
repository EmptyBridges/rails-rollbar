class WelcomeController < ApplicationController
    def index
        scope = {
            "request": {
                "body": "{\"password\":\"anthony\",\"other\":\"what to scrub?\"}", 
                "cookies": {
                  "_railbar_session": "MlR0RVNlcVYwRXFjYXR4OGhHeGVjemNTQzNUSG9PTllmQktsMXhsS0F1aG5KRjJibUgvdzBLY2dORnUxeHgreDBVWUFpR0RSOG5QV1lIVU44T1hMbkI3SGFhMDgzT041ZjhyOHFuMzdpby9MZ2VISSt4UUVwQ0ZtUStSdlRyZnI2QSs5QnpjeW42NDI2UTkwUXo4bkVnPT0tLWRUbGxwU3pEVmVDcFBucXhoR29IeXc9PQ==--fd00f05f122888cc1233832b9695a643587ccfca"
                }, 
                "GET": {}, 
                "url": "http://localhost:3000/", 
                "user_ip": "127.0.0.1", 
                "headers": {
                  "Accept-Language": "en-US,en;q=0.9", 
                  "Accept-Encoding": "gzip, deflate, br", 
                  "Connection": "keep-alive", 
                  "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8", 
                  "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.88 Safari/537.36", 
                  "Host": "localhost:3000", 
                  "Version": "HTTP/1.1", 
                  "Cache-Control": "max-age=0", 
                  "If-None-Match": "W/\"4b6f14add3b6ec758eb7c17251dd27e8\"", 
                  "Upgrade-Insecure-Requests": "1"
                }, 
                "session": {
                  "_csrf_token": "f5grYmR31yPwB1ZPe/8PUcG0pNUZHuGC4LmH6AkPkU8=", 
                  "session_id": "c501f692f04eedd08b8c0a275fb57dbc"
                }, 
                "params": {
                  "action": "index", 
                  "controller": "welcome"
                }, 
                "request_id": "89e67441-bfbd-4f06-8d1c-11e3f2e8a509", 
                "POST": {}, 
                "method": "GET"
            }
        }
        # scope = {:body => {password: 'anthony'}}
        # scope = {}
        new_config = {:scrub_fields => [:_railbar_session,:_csrf_token,:controller]}
        # new_config = {}
        Rollbar.scoped(scope, new_config) do
            Rollbar.error("hello")
        end
        # end
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