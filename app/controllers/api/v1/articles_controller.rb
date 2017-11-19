module Api
  module V1

    class ArticlesController < ApplicationController
      def index
        articles = Article.all
        render json: {status: "SUCCESS", message: "My message", data: articles}, status: 200
      end

      def show
        article = Article.find(params[:id])
        render json: {status: "SUCCESS", message: "Loaded Article", data: article}, status: :ok
      end

      def create
        article = Article.new(article_params)

        if article.save
          render json: {status: "SUCCESS", message: "Saved Article", data: article}, status: 200
        else
          render json: {status: 'ERROR', message: "Article not saved", data: article.errors}, status: :unprocessable_entity
        end
      end

      def update
        article = Article.find(params[:id])
        if article.update_attributes(article_params)
          render json: {status: "SUCCESS", message: "Updated Article", data: article}, status: 200
        else
          render json: {status: 'ERROR', message: "Article not updated", data: article.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        article = Article.find(params[:id])
        article.destroy
        render json: {status: "SUCCESS", message: "Deleted Article", data: article}, status: 200
      end

      private

      def article_params
        params.permit(:title, :body)
      end
    end

  end
end






#Another way to write the above

# class Api::V1::ArticlesController < Api::V1::ApplicationController
#   def index
#     articles = Article.all
#     render json: {status: "SUCCESS", message: "My message", data: articles}, status: 200
#   end

#   def show
#     article = Article.find(params[:id])
#     render json: {status: "SUCCESS", message: "Loaded Article", data: article}, status: :ok
#   end

#   def create
#     article = Article.new(article_params)

#     if article.save
#       render json: {status: "SUCCESS", message: "Saved Article", data: article}, status: 200
#     else
#       render json: {status: 'ERROR', message: "Article not saved", data: article.errors}, status: :unprocessable_entity
#     end
#   end

#   def update
#     article = Article.find(params[:id])
#     if article.update_attributes(article_params)
#       render json: {status: "SUCCESS", message: "Updated Article", data: article}, status: 200
#     else
#       render json: {status: 'ERROR', message: "Article not updated", data: article.errors}, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     article = Article.find(params[:id])
#     article.destroy
#     render json: {status: "SUCCESS", message: "Deleted Article", data: article}, status: 200
#   end

#   private

#   def article_params
#     params.permit(:title, :body)
#   end
# end
