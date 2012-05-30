class ResponsablesController < ApplicationController
  # GET /responsables
  # GET /responsables.json
  def index
    @responsables = Responsable.order('nombre ASC').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @responsables }
    end
  end

  # GET /responsables/1
  # GET /responsables/1.json
  def show
    @responsable = Responsable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @responsable }
    end
  end

  # GET /responsables/new
  # GET /responsables/new.json
  def new
    @responsable = Responsable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @responsable }
    end
  end

  # GET /responsables/1/edit
  def edit
    @responsable = Responsable.find(params[:id])
  end

  # POST /responsables
  # POST /responsables.json
  def create
    @responsable = Responsable.new(params[:responsable])

    respond_to do |format|
      if @responsable.save
        format.html { redirect_to @responsable, notice: 'Responsable creado' }
        format.json { render json: @responsable, status: :created, location: @responsable }
      else
        format.html { render action: 'new' }
        format.json { render json: @responsable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /responsables/1
  # PUT /responsables/1.json
  def update
    @responsable = Responsable.find(params[:id])

    respond_to do |format|
      if @responsable.update_attributes(params[:responsable])
        format.html { redirect_to @responsable, notice: 'Responsable actualizado' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @responsable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responsables/1
  # DELETE /responsables/1.json
  def destroy
    @responsable = Responsable.find(params[:id])
    @responsable.destroy

    respond_to do |format|
      format.html { redirect_to responsables_url }
      format.json { head :no_content }
    end
  end
end
