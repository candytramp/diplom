class RequestAuthorsController < ApplicationController
  before_action :set_request_author, only: [:show, :edit, :update, :destroy]

  # GET /request_authors
  # GET /request_authors.json
  def index
    @request_authors = RequestAuthor.all
  end

  # GET /request_authors/1
  # GET /request_authors/1.json
  def show
  end

  # GET /request_authors/new
  def new
    @request_author = RequestAuthor.new
  end

  # GET /request_authors/1/edit
  def edit
  end

  # POST /request_authors
  # POST /request_authors.json
  def create
    @request_author = RequestAuthor.new(request_author_params)

    respond_to do |format|
      if @request_author.save
        format.html { redirect_to @request_author, notice: 'Request author was successfully created.' }
        format.json { render :show, status: :created, location: @request_author }
      else
        format.html { render :new }
        format.json { render json: @request_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_authors/1
  # PATCH/PUT /request_authors/1.json
  def update
    respond_to do |format|
      if @request_author.update(request_author_params)
        format.html { redirect_to @request_author, notice: 'Request author was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_author }
      else
        format.html { render :edit }
        format.json { render json: @request_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_authors/1
  # DELETE /request_authors/1.json
  def destroy
    @request_author.destroy
    respond_to do |format|
      format.html { redirect_to request_authors_url, notice: 'Request author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_author
      @request_author = RequestAuthor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_author_params
      params.require(:request_author).permit(:ois_request_id, :person_id, :old_lastname, :is_teacher, :is_staffteacher, :is_student, :is_postgrad, :details)
    end
end
