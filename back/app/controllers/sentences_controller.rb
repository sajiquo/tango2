class SentencesController < ApplicationController
  before_action :set_sentence, only: %i[ show update destroy ]

  # GET /sentences
  def index
    @sentences = Sentence.all

    render json: @sentences
  end

  # GET /sentences/1
  def show
    render json: @sentence
  end

  # POST /sentences
  def create
    @sentence = Sentence.new(sentence_params)

    if @sentence.save
      render json: @sentence, status: :created, location: @sentence
    else
      render json: @sentence.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sentences/1
  def update
    if @sentence.update(sentence_params)
      render json: @sentence
    else
      render json: @sentence.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sentences/1
  def destroy
    @sentence.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sentence
      @sentence = Sentence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sentence_params
      params.require(:sentence).permit(:text, :inflection)
    end
end
