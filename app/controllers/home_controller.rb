class HomeController < ApplicationController
  def index
    redirect_to orders_path if signed_in?
  end
end
