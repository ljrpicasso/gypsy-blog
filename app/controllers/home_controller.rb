class HomeController < ApplicationController
  def index
    @users = User.all
    recipe_dir = "recipes"
    @recipes = Dir.glob("#{recipe_dir}/*.pdf");
  end
end
