class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @clients = Client.where("first_name LIKE ?", "%#{params[:query]}%")
    else
      @clients = Client.all
    end
  end

  def show
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to client_path(@client)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @client.update(client_params)
    redirect_to client_path(@client)
  end

  def destroy
    @client.destroy
    redirect_to clients_path, status: :see_other, notice: "Client was successfully destroyed."
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:first_name, :last_name, :email)
  end
end
