class Api::V1::StoriesController < Api::V1::BaseController
  before_action :set_story, only: %i[show update create]

  def index
    @stories = Story.all
    # render json: @stories #Just for testing
  end

  def show; end

  def create
    @story = Story.new(story_params)
    if @story.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    if @story.update(story_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :content)
  end

  def render_error
    render json: { errors: @story.errors.full_messages }, status: :unprocessable_entity
  end
end
