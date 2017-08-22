class ArticlesController < ApplicationController
	before_action :set_articles,only: [:edit, :update, :show, :destroy]
	def index
		@articles = Article.paginate(page: params[:page], per_page: 5)
	end
	def new

		@article = Article.new
	end
	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
		@article.user = User.first
		@article.save
		if @article.save
			#something
			redirect_to article_path(@article) #this code used to show after submission
			flash[:success] = "Article was successfully created"
		else
			render 'new'
		end
		
	end
	def show
		@article = Article.find(params[:id])
	end
	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to article_path(@article)
			flash[:success] = "Article successfully updated"
		else
			render 'edit'
		end
	end
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
		flash[:danger] = "Article successfully deleted"
	end	
	private
	def set_articles
		@article = Article.find(params[:id])
	end
	def article_params
		params.require(:article).permit(:title , :description)
		
	end
	


end
