class MentorsController < ApplicationController
  before_action :set_mentor, only: [:show, :edit, :update, :destroy]

  # GET /mentors
  # GET /mentors.json
  def index
    if params[:tag]
      @mentors = Mentor.tagged_with(params[:tag], :any => true).by_mentor_name.page(params[:page])
      @notice = "Matching Tag: " + params[:tag].to_s
    elsif params[:tag_query_match_identical]
      # Find users that matches all given tags:
      @mentors = Mentor.tagged_with(params[:tag_query_match_identical], :match_all => true).page(params[:page])
      @notice = "Matching Tags: " + params[:tag_query_match_identical].to_s
    elsif params[:tag_query_match_any]
      # Find users that matches all given tags:
      @mentors = Mentor.tagged_with(params[:tag_query_match_any], :any => true).page(params[:page])
      @notice = "Matching Tags: " + params[:tag_query_match_any].to_s
    else
      @notice = "Showing all mentors"
      if params[:page]
        @mentors = Mentor.by_mentor_name.page(params[:page])
      else
        @mentors = Mentor.by_mentor_name.page(1)
      end
    end

     @total = @mentors.length unless @mentors
     @mentors = [] unless @mentors 
  end

  # GET /mentors/1
  # GET /mentors/1.json
  def show
  end

  # GET /mentors/new
  def new
    @mentor = Mentor.new
  end

  # GET /mentors/1/edit
  def edit
  end

  # POST /mentors
  # POST /mentors.json
  def create
    @mentor = Mentor.new(mentor_params)

    respond_to do |format|
      if @mentor.save
        format.html { redirect_to @mentor, notice: 'Mentor was successfully created.' }
        format.json { render :show, status: :created, location: @mentor }
      else
        format.html { render :new }
        format.json { render json: @mentor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mentors/1
  # PATCH/PUT /mentors/1.json
  def update
    respond_to do |format|
      if @mentor.update(mentor_params)
        format.html { redirect_to @mentor, notice: 'Mentor was successfully updated.' }
        format.json { render :show, status: :ok, location: @mentor }
      else
        format.html { render :edit }
        format.json { render json: @mentor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mentors/1
  # DELETE /mentors/1.json
  def destroy
    @mentor.destroy
    respond_to do |format|
      format.html { redirect_to mentors_url, notice: 'Mentor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mentor
      @mentor = Mentor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mentor_params
      params.require(:mentor).permit(:name, :tag_list, :companyname, :profession)
    end
end
