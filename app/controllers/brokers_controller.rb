class BrokersController < ApplicationController

  layout false, except: :index

  before_filter :find_system, except: :index

  def index
    respond_to do |format|
      format.html
      format.js {
        @from = System.find(params[:from])
        @to = System.find(params[:to])
      }
    end
  end

  def new
    @broker = @system.generate_broker
    redirect_to broker_path(@broker, system_id: @system.id)
  end

  def show
    @broker = @system.brokers.find(params[:id])
  end

  def destroy
    @broker = @system.brokers.find(params[:id])
    @broker.destroy
    @system.reload
  end

  private

  def find_system
    @system = System.find(params[:system_id])
  end
end
