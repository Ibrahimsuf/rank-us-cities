class ComparisonsController < ApplicationController
  before_action :set_comparison, only: %i[ show edit update destroy ]
  # GET /comparisons/new
  def new
    @comparison = Comparison.new
    random_ordering = City.order('RANDOM()').to_a
    @city1 = random_ordering[0]
    @city2 = random_ordering[1]
  end
  # POST /comparisons or /comparisons.json
  def create
    winner = City.find(params[:city1_id])
    loser = City.find(params[:city2_id])
    @comparison = Comparison.new(winner: winner, loser: loser)
    respond_to do |format|
      if @comparison.save
        @comparison.winner.win(loser)
        @comparison.loser.loss(winner)
        format.html { redirect_to new_comparison_path, notice: "Comparison was successfully created." }
        format.json { render :show, status: :created, location: @comparison }
      else
        puts "Failed to save"
        format.html { redirect_to new_comparison_path, status: :unprocessable_entity, notice: "There was an error" }
        format.json { render json: @comparison.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comparison
      @comparison = Comparison.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comparison_params
      params.fetch(:comparison, {})
    end
end
