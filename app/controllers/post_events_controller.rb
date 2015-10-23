class PostEventsController < ApplicationController
  before_action :authenticate_user!
	before_action :set_post_event, except: [:create]

	def create
    @post = Post.find(params[:post_id])
    @post_event = @post.post_events.create(post_event_params)
    @post_event.post_id = @post.id
    @post_event.time_start = convert_mhs_to_seconds(params[:post_event][:time_start])
    @post_event.time_end = convert_mhs_to_seconds(params[:post_event][:time_end])
    @post_event.save
    redirect_to edit_post_path(@post)
  end

  def destroy
    @post_event.destroy
    respond_to do |format|
      format.html { redirect_to edit_post_path(@post_event.post) }
    end
  end

  private
  	def set_post_event
      @post_event = PostEvent.find(params[:id])
    end

    def convert_mhs_to_seconds(given_mhs)
      given_blocks_reversed = given_mhs.scan(/([0-9]{2})+/).reverse
      logger.debug given_blocks_reversed
      converted_seconds = 0
      given_blocks_reversed.each.with_index do |gbr, index|
        converted_seconds += gbr[0].to_i * (60 ** index)
      end
      converted_seconds
    end

    def post_event_params
      params.require(:post_event).permit(:post_id, :content_type, :url, :content, :time_start, :time_end)
    end

end
