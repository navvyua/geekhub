class TablesController < ApplicationController
  before_action :current_table, only: [:show, :edit, :update, :destroy]

  def index
    @tables = Table.all
  end

  def show
  end

  def new
    @table = Table.new
  end

  def create
    table = Table.new(table_params)
    if table.save
      redirect_to table
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @table.update(table_params)
      redirect_to @table
    else
      render :edit
    end
  end

  def destroy
    @table.delete
    redirect_to tables_path
  end

  private

  def table_params
    params.require(:table).permit(:color)
  end

  def current_table
    @table = Table.find(params[:id])
  end
end