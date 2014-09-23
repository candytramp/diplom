class ResearchEffortFilesController < ApplicationController
  before_action :set_research_effort_file, only: [:show, :edit, :update, :destroy]

  # GET /research_effort_files
  # GET /research_effort_files.json
  def index
    @research_effort_files = ResearchEffortFile.all
  end

  # GET /research_effort_files/1
  # GET /research_effort_files/1.json
  def show
  end

  # GET /research_effort_files/new
  def new
    @research_effort_file = ResearchEffortFile.new
  end

  # GET /research_effort_files/1/edit
  def edit
  end

  # POST /research_effort_files
  # POST /research_effort_files.json
  def create
    @research_effort_file = ResearchEffortFile.new(research_effort_file_params)

    respond_to do |format|
      if @research_effort_file.save
        format.html { redirect_to @research_effort_file, notice: 'Research effort file was successfully created.' }
        format.json { render :show, status: :created, location: @research_effort_file }
      else
        format.html { render :new }
        format.json { render json: @research_effort_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /research_effort_files/1
  # PATCH/PUT /research_effort_files/1.json
  def update
    respond_to do |format|
      if @research_effort_file.update(research_effort_file_params)
        format.html { redirect_to @research_effort_file, notice: 'Research effort file was successfully updated.' }
        format.json { render :show, status: :ok, location: @research_effort_file }
      else
        format.html { render :edit }
        format.json { render json: @research_effort_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /research_effort_files/1
  # DELETE /research_effort_files/1.json
  def destroy
    @research_effort_file.destroy
    respond_to do |format|
      format.html { redirect_to research_effort_files_url, notice: 'Research effort file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research_effort_file
      @research_effort_file = ResearchEffortFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def research_effort_file_params
      params.require(:research_effort_file).permit(:description, :research_effort_id)
    end
end
