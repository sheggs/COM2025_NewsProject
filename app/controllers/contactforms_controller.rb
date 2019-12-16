class ContactformsController < ApplicationController
  before_action :set_contactform, only: [:show, :edit, :update, :destroy]

  # GET /contactforms
  # GET /contactforms.json
  def index
    @contactforms = Contactform.all
  end

  # GET /contactforms/1
  # GET /contactforms/1.json
  def show
  end

  # GET /contactforms/new
  def new
    @contactform = Contactform.new
  end

  # GET /contactforms/1/edit
  def edit
  end

  # POST /contactforms
  # POST /contactforms.json
  def create
    @contactform = Contactform.new(contactform_params)

    respond_to do |format|
      if @contactform.save
        ContactMailer.notify_contact_form(@contactform)
        format.html { redirect_to @contactform, notice: 'Contactform was successfully created.' }
        format.json { render :show, status: :created, location: @contactform }
      else
        format.html { render :new }
        format.json { render json: @contactform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contactforms/1
  # PATCH/PUT /contactforms/1.json
  def update
    respond_to do |format|
      if @contactform.update(contactform_params)
        format.html { redirect_to @contactform, notice: 'Contactform was successfully updated.' }
        format.json { render :show, status: :ok, location: @contactform }
      else
        format.html { render :edit }
        format.json { render json: @contactform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contactforms/1
  # DELETE /contactforms/1.json
  def destroy
    @contactform.destroy
    respond_to do |format|
      format.html { redirect_to contactforms_url, notice: 'Contactform was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contactform
      @contactform = Contactform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contactform_params
      params.require(:contactform).permit(:title, :body, :email)
    end
end
