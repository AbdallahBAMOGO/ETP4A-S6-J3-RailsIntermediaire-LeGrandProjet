class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new
    @comments = @gossip.comments
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    if @gossip.save
      redirect_to @gossip, notice: 'Potin créé avec succès.'
    else
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to @gossip, notice: 'Potin mis à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to @gossip, notice: 'Potin supprimé avec succès.'
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content, :author_id)
  end
end
