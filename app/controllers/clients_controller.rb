class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @clients = Client.where("name LIKE ?", "%#{params[:query]}%")
    else
      @clients = Client.all
    end
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to client_path(@client)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, status: :see_other, notice: "Client was successfully destroyed."
  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :email)
  end

  def set_client
    @client = Client.find(params[:id])
  end
end
