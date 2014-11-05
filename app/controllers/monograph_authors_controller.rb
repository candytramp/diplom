class MonographAuthorsController < ApplicationController
  before_action :set_monograph_author, only: [:show, :edit, :update, :destroy]

  # GET /monograph_authors
  # GET /monograph_authors.json
  def index
    @monograph_authors = MonographAuthor.all
  end

  # GET /monograph_authors/1
  # GET /monograph_authors/1.json
  def show
  end

  # GET /monograph_authors/new
  def new
    @monograph_author = MonographAuthor.new
  end

  # GET /monograph_authors/1/edit
  def edit
  end

  # POST /monograph_authors
  # POST /monograph_authors.json
  def create
    @monograph_author = MonographAuthor.new(monograph_author_params)

    respond_to do |format|
      if @monograph_author.save
        format.html { redirect_to @monograph_author, notice: 'Monograph author was successfully created.' }
        format.json { render :show, status: :created, location: @monograph_author }
      else
        format.html { render :new }
        format.json { render json: @monograph_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monograph_authors/1
  # PATCH/PUT /monograph_authors/1.json
  def update
    respond_to do |format|
      if @monograph_author.update(monograph_author_params)
        format.html { redirect_to @monograph_author, notice: 'Monograph author was successfully updated.' }
        format.json { render :show, status: :ok, location: @monograph_author }
      else
        format.html { render :edit }
        format.json { render json: @monograph_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monograph_authors/1
  # DELETE /monograph_authors/1.json
  def destroy
    @monograph_author.destroy
    respond_to do |format|
      format.html { redirect_to monograph_authors_url, notice: 'Monograph author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monograph_author
      @monograph_author = MonographAuthor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monograph_author_params
      params.require(:monograph_author).permit(:monograph_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details, :pages)
    end
end
