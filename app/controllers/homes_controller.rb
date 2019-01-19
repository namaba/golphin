class HomesController < ApplicationController

  def index
  end

  def index_2
  end

  def results
  end

  def create
    @plans = RWS::Gora::Plan.search(areaCode: conditions_params['area_code'], playDate: conditions_params['play_date'])
    raise @plans.first
  end

  def search
    @plans = RWS::Gora::Plan.search(areaCode: conditions_params['area_code'], playDate: conditions_params['play_date'])
    render :results
  end

  private

  def conditions_params
    params.require(:conditions).permit(
      :area_code,
      :play_date,
      )
  end
end
