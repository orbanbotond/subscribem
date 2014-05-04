require_dependency "subscribem/application_controller"

module Subscribem
  class AccountsController < ApplicationController

    before_filter :redirect_if_coming_form_sign_up, only: :new
    before_action :authenticate_user!, except: [:new, :create]

    def index
      @accounts = current_user.accounts
    end

    def new
      @account = Subscribem::Account.new
      @account.build_owner unless user_signed_in?
    end

    def create
      account = if user_signed_in?
          Subscribem::Account.create(account_params)
        else
          Subscribem::Account.create_with_owner(account_params)
        end
      @account = account
      if account.valid?
        flash[:success] = "Your account has been successfully created."
        if user_signed_in?
          redirect_to subscribem.accounts_path
        else
          sign_in account.owner
          redirect_to subscribem.root_url(:subdomain => account.subdomain)
        end
      else
        flash[:error] = "Sorry, your account could not be created."
        render :new
      end
    end

  private
    def redirect_if_coming_form_sign_up
      redirect_to accounts_path if request.url =~ /#{sign_up_path}/ && user_signed_in?
    end
    def account_params
      params.require(:account).permit(:name, :subdomain, { :owner_attributes => [
        :email, :password, :password_confirmation
      ]})
    end
  end
end
