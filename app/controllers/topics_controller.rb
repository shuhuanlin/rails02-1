class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all.sort_by{|topic| topic.votes.count}.reverse
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)

      if @topic.save
        redirect_to topics_path, notice: 'Topic was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
      if @topic.update(topic_params)
        redirect_to topics_path, notice: 'Topic was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
      redirect_to topics_path, notice: 'Topic was successfully destroyed.'

  end

  def upvote
    @topic = Topic.find(params[:id])
    @topic.votes.create
    redirect_to topics_path
  end

  def downvote
    @topic = Topic.find(params[:id])
    @topic.votes.last.destroy
    redirect_to topics_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title, :description)
    end
end
