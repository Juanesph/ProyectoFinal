class CompaniesController < ApplicationController
  before_action :authenticate_user!
  def index
    @companies = Company.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
