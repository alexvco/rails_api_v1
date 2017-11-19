module Api
  module V1

    class ArticlesController < ApplicationController
      def index
        articles = Article.all
        render json: {status: "SUCCESS", message: "My message", data: articles}, status: 200
      end
      # curl http://localhost:3000/api/v1/articles | python -m json.tool

      def show
        article = Article.find(params[:id])
        render json: {status: "SUCCESS", message: "Loaded Article", data: article}, status: :ok
      end
      # curl http://localhost:3000/api/v1/articles/2 | python -m json.tool

      def create
        article = Article.new(article_params)

        if article.save
          render json: {status: "SUCCESS", message: "Saved Article", data: article}, status: 200
        else
          render json: {status: 'ERROR', message: "Article not saved", data: article.errors}, status: :unprocessable_entity
        end
      end
      # curl -X POST http://localhost:3000/api/v1/articles -H "Content-Type:application/json" -d '{"title":"mycreatedtitle", "body":"mycreatedbody"}'

      def update
        article = Article.find(params[:id])
        if article.update_attributes(article_params)
          render json: {status: "SUCCESS", message: "Updated Article", data: article}, status: 200
        else
          render json: {status: 'ERROR', message: "Article not updated", data: article.errors}, status: :unprocessable_entity
        end
      end
      # curl -X PUT http://localhost:3000/api/v1/articles/4 -H "Content-Type:application/json" -d '{"title":"mytitle", "body":"mybody"}'

      def destroy
        article = Article.find(params[:id])
        article.destroy
        render json: {status: "SUCCESS", message: "Deleted Article", data: article}, status: 200
      end
      # curl -X DELETE http://localhost:3000/api/v1/articles/5

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
