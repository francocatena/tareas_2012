# encoding: UTF-8

class SesionesController < ApplicationController
  before_filter :no_requerir_responsable, only: [:new, :create]
  before_filter :requerir_responsable, only: :destroy

  # GET /sesiones/new
  def new
    @responsable = Responsable.new

    respond_to do |format|
      format.html
      format.json { render json: @responsable }
    end
  end

  def create
    email, clave = params[:responsable][:email], params[:responsable][:clave]
    @responsable = Responsable.find_or_initialize_by_email(email)
    
    respond_to do |format|
      if @responsable && @responsable.clave_valida?(clave)
        session[:responsable_id] = @responsable.id

        format.html { redirect_to(tareas_url, notice: t('sesiones.ingreso_correcto')) }
      else
        flash.now.notice = t('sesiones.ingreso_incorrecto')

        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    reset_session

    respond_to do |format|
      format.html { redirect_to nueva_sesion_url, notice: t('sesiones.sesion_cerrada') }
    end
  end
end
