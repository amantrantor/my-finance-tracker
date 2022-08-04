class StocksController < ApplicationController
    def search
         @tracked_stocks = current_user.stocks
        if params[:stock].present?
            @stock = Stock.new_lookup(params[:stock])
            #render json: @stock
            if @stock
                render 'users/my_portfolio'
            else
                flash[:alert] = "Please enter a valid symbol"
                redirect_to my_portfolio_path
            end
        else
            flash[:alert] = "Please enter the symbol"
            redirect_to my_portfolio_path
        end
    end
    
end