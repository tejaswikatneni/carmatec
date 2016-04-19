class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  # GET /players
  # GET /players.json
  def index
    @players = current_user.players.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    @player = current_user.players.new(player_params)
    respond_to do |format|
      if @player.save
        format.html { redirect_to players_url, notice: 'Player was successfully created.' }
      else
        format.html { render :new }
        flash[:alert] = @player.errors.full_messages.to_sentence
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to players_url, notice: 'Player was successfully updated.' }
      else
        format.html { render :edit }
        flash[:alert] = @player.errors.full_messages.to_sentence
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :score)
    end
end
