class TransactionsController < ApplicationController

	def index
		if params[:search]
			@transactions = Transaction.paginate(:page => params[:page], :per_page => 10).where("team_before LIKE ? OR team_after LIKE ? OR player_last_name LIKE ? OR player_first_name LIKE ?", "%#{(params[:search]).strip}%", "%#{(params[:search]).strip}%", "%#{(params[:search]).strip}%", "%#{(params[:search]).strip}%").order("id DESC")
		else
			@transactions = Transaction.paginate(:page => params[:page], :per_page => 25).order("id DESC")
		end
	end

end
