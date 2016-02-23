class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	before_filter :require_authorization, only: [:delete]

	
	def index
		@posts = Post.all.order('created_at DESC')
		@posts = Post.includes(:user)
		

	end

	def show
		
		
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		@post.user_id = current_user.id
		
		if @post.save
			redirect_to @post
		else

			render 'new'
		end
	end

	def edit 
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = current_user.posts.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end
			
		

	private

	def find_post
		@post = Post.find(params[:id])
	end
	def post_params
		params.require(:post).permit(:title, :content)
	end

	def require_authorization
  		redirect_to :root unless current_user.posts.find_by_post_id(params[:id])
  		#Use the find_by to avoid the ActiveRecord::RecordNotFound and get a nil instead in case the question id doesn't belong to a question of the user
	end
end
