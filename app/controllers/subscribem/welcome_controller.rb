require_dependency "subscribem/application_controller"

module Subscribem
  class WelcomeController < ApplicationController
    before_filter :redirect_logged_in_users_to_account_page

    def index
    end
  end
end
