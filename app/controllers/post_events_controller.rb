class PostEventsController < ApplicationController
	before_action :set_post_event, only: [:show, :edit, :update, :destroy]

	def index
	end

	def create
    @post = Post.find(params[:post_id])
    @post_event = @post.post_events.create(post_event_params)
    @post_event.post_id = @post.id
    @post_event.save
    redirect_to post_path(@post)
  end

  def destroy
    @post_event.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post_event.post) }
    end
  end

  private
  	def set_post_event
      @post_event = post_event.find(params[:id])
    end

    def post_event_params
      params.require(:post_event).permit(:post_id, :content_type, :url, :content, :time_start, :time_end)
    end

end
