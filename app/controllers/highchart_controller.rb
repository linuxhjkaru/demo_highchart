class HighchartController < ApplicationController
  include HighchartHelper

  def index
    @month = month_data
    @tokyo = tokyo_data
    @newyork = newyork_data
    @berlin = berlin_data
    @london = london_data

    if params[:month].present?
      index = @month.index params[:month]
      @data = Array.new
      @data << ["Tokyo", @tokyo[index]]
      @data << ["Berlin", @berlin[index]]
      @data << ["London", @london[index]]
      @data << ["Newyork", @newyork[index]]

    end


    respond_to do |format|
      format.html {render "highcharts/index"}
      format.js{render "highcharts/show_month"}
    end
  end
end