class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index]

  # GET /publications
  def index
    @publications = Publication.order(created_at: :desc)
    @publications = @publications.where(user_id: current_user.id) if params[:user_id].present?
    @publications = @publications.where(amount_currency: params[:currency]) if params[:currency].present?
    @publications = @publications.page params[:page]

    @friend_list = current_user.friend_list if current_user.present?
  end

  # GET /publications/1
  def show
  end

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  def create
    @publication = Publication.new(publication_params)

    if @publication.save
      redirect_to @publication, notice: 'Publication was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /publications/1
  def update
    if @publication.update(publication_params)
      redirect_to @publication, notice: 'Publication was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /publications/1
  def destroy
    @publication.destroy
    redirect_to publications_url, notice: 'Publication was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    def default_params
      default_params = {}
      default_params[:user_id] = current_user.id if current_user.present?
      default_params
    end

    # Only allow a trusted parameter "white list" through.
    def publication_params
      params.require(:publication).permit(:amount, :amount_currency, :expires_at).merge!(default_params)
    end
end
