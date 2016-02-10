class PapersController < ApplicationController
	before_action :set_paper, only: [:edit, :update, :show, :destroy]


	def index
		@papers = Paper.all
		
	end

	def create
		@paper = Paper.new(paper_params)

		if @paper.save
			flash[:success] = "Messages sent."
			redirect_to paper_path(@paper)
		else
			flash[:danger] = "Error occured, message has not been sent."
			redirect_to new_paper_path
		end		

		
	end

	def new
		@paper = Paper.new
	end

	def edit
	end

	def show
	end

	def update
	end

	def destroy
		@paper.destroy(paper_params)
		flash[:danger] = "Line was successfully destroyed"
		redirect_to paper_path
	end


	private

	def set_paper
		@paper = Paper.find(params[:id])
	end
	def paper_params
		params.require(:paper).permit(:paper_type, :date, :paper_weight, :paper_cost, :env_paper_weight)
	end


end