class ArticlesController < ApplicationController
	def index
    	@articles = Article.order(id: :desc) 
    end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to articles_path
		else
			render 'new'
		end
	end
	def update
  		@article = Article.find(params[:id])
 	
  		if @article.update(article_params)
    		redirect_to article_path
  		else
    		render 'edit'
  		end
	end
	def destroy
  		@article = Article.find(params[:id])
  		@article.destroy
 
  		redirect_to articles_path
	end
	private 
		def article_params
		params.require(:article).permit(:title, :text , :category_id)
	end
end
