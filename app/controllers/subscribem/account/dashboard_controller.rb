require_dependency "subscribem/application_controller"

module Subscribem
  class Account::DashboardController < Subscribem::ApplicationController

    before_action :authenticate_user!

    def index
    end

  end
end
