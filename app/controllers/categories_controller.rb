class CategoriesController < ApplicationController

  before_action :set_category!, except: [:create, :index, :new]


  private 

  def set_category!
    @category = Category.find(params[:id])
  end

end
