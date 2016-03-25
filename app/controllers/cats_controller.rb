
class CatsController < ApplicationController

  before_action :set_cat, only: [:show, :edit, :update, :destroy]

  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    respond_to do |format|
      if @cat.save
      format.html { redirect_to @cat, notice: 'cat was successfully created.' }
      format.json { render :show, status: :created, location: @cat }
      else
      format.html { render :new }
      format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def destroy
    @cat.destroy
    respond_to do |format|
      format.html { redirect_to cats_url, notice: 'cat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @cat.update (cat_params)
        format.html { redirect_to @cat, notice: 'cat was successfully updated.' }
        format.json { render :show, status: :ok, location: @cat }
      else
        format.html { render :edit }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :owner, :age)
  end

end
