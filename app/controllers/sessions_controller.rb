class SessionsController < ApplicationController
    def new

    end

    def create
        @user = User.find_by({"email" => params["email"]})
        if @user
            if @user["password"] == params["password"]
                flash["notice"] = "You logged in!"
                redirect_to "/companies"
            else
                flash["notice"] = "Your email or password is incorrect."
                redirect_to "/sessions/new"
            end
        else
            flash["notice"] = "Your email or password is incorrect."
            redirect_to "/sessions/new"
        end
    end
end