class TeamsController < ApplicationController
  protect_from_forgery
  before_action :set_team, only: [:show, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
    @team = Team.new
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @members = @team.members
    @all_members = Member.where.not(id: @members.pluck(:id))
    @team_member = TeamMember.new
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params.permit(:name))

    if @team.save
      # TODO 何故か flash がViewに反映されない
      redirect_to teams_path, flash: {success: 'チームを作成しました'}
    else
      @teams = Team.all
      render :index
      #render json: @team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    if @team.update(team_params)
      render :show, status: :ok, location: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.fetch(:team, {})
    end
end
