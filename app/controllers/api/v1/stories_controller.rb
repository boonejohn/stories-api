class Api::V1::StoriesController < Api::V1::BaseController
  before_action :set_story, only: %i[ show update ]

  def update
    if @story.update(story_params)
      render :show
    else
      render_error
    end
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      render :show, status: :created
    else
      render_error
    end
  end
end

  def index
    @stories = Story.all
    # render json: @stories #Just for testing
  end

  def show
  end

  private

  def set_story
    @story = Story.find(params[:id])
  end
  def story_params
    params.require(:story).permit(:name, :text)
  end

  def render_error
    render json: { errors: @story.errors.full_messages },
      status: :unprocessable_entity
  end
end
