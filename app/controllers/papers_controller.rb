class PapersController < ApplicationController
	before_action :set_paper, only: [:edit, :update, :show, :destroy]
	before_action :paper_owner, only: [ :edit, :update, :destroy]


	def index
		@papers = current_user.papers
		
	end

	def create
		@paper = current_user.papers.build(paper_params)

		if @paper.save
			flash[:success] = "Messages sent."
			redirect_to paper_path(@paper)
		else
			flash[:danger] = "Error occured, message has not been sent."
			redirect_to new_paper_path
		end		

		
	end

	def new
		@paper = current_user.papers.build
	end

	def edit
	end

	def show
	end

	def update
			if @paper.update(paper_params)
			flash[:success] = "Line was successfully updated"
			redirect_to papers_path(@paper)
		else
			render 'edit'
		end		

	end

	def destroy
		@paper.destroy
		flash[:danger] = "Line was successfully destroyed"
		redirect_to papers_path
	end


	private

	def set_paper
		@paper = Paper.find(params[:id])
	end
	def paper_params
		params.require(:paper).permit(:paper_type, :date, :paper_weight, :paper_cost, :env_paper_weight)
	end

	def paper_owner
     			unless @paper.user_id == current_user.id
      				flash[:notice] = 'Access denied as you are not owner of this Job'
      				redirect_to papers_path
     			end
    		end


end