class ArticlesController < ApplicationController
	def new
		@article = Article.new
	end
	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
		@article.save
		if @article.save
			#something
			redirect_to article_path(@article) #this code used to show after submission
			flash[:notice] = "Article was successfully created"
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
			flash[:notice] = "Article successfully updated"
		else
			render 'edit'
		end
	end
	private
	def article_params
		params.require(:article).permit(:title , :description)
		
	end


end
