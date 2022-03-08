class CaptionsController < ApplicationController
  before_action :set_caption, only: %i[ show edit update destroy ]

  # GET /captions or /captions.json
  def index
    if params[:query] and (params[:query] != '')
      @captions = Caption.where("lower(text) LIKE ?", "%" + params[:query].downcase + "%")#.limit(16)
    else
      @captions = Caption.all.limit(16)
    end
  end

  # GET /captions/1 or /captions/1.json
  def show
  end

  # GET /captions/new
  def new
    @caption = Caption.new
  end

  # GET /captions/1/edit
  def edit
  end

  # POST /captions or /captions.json
  def create
    @caption = Caption.new(caption_params)

    respond_to do |format|
      if @caption.save
        format.html { redirect_to caption_url(@caption), notice: "Caption was successfully created." }
        format.json { render :show, status: :created, location: @caption }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @caption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /captions/1 or /captions/1.json
  def update
    respond_to do |format|
      if @caption.update(caption_params)
        format.html { redirect_to caption_url(@caption), notice: "Caption was successfully updated." }
        format.json { render :show, status: :ok, location: @caption }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @caption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /captions/1 or /captions/1.json
  def destroy
    @caption.destroy

    respond_to do |format|
      format.html { redirect_to captions_url, notice: "Caption was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caption
      @caption = Caption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def caption_params
      params.require(:caption).permit(:text, :timestamp, :video_id, :query)
    end
end
