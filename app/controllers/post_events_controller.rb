class PostEventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:new, :edit]
  before_action :set_post_events_count, only: [:new, :edit]
  before_action :all_post_events, only: [:create, :update, :destroy]
  before_action :set_post_event, only: [:edit, :update, :destroy]
  respond_to :html, :js

  def new
    @post_event = PostEvent.new
  end

	def create
    @post = Post.find(params[:post_id])
    @post_event = @post.post_events.create(post_event_params)
    @post_event.post_id = @post.id
    @post_event.time_start = convert_mhs_to_seconds(params[:post_event][:time_start])
    @post_event.time_end = convert_mhs_to_seconds(params[:post_event][:time_end])
    @post_event.save
  end

  def update
    @post_event.update(post_event_params)
    @post_event.time_start = convert_mhs_to_seconds(params[:post_event][:time_start])
    @post_event.time_end = convert_mhs_to_seconds(params[:post_event][:time_end])
    @post_event.save
  end

  def destroy
    @post_event.destroy
  end

  private
    def all_post_events
      @post_events = PostEvent.where(:post_id => params[:post_id])
    end

    def set_post_event
      @post_event = PostEvent.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_post_events_count
      @post_events_count = @post.post_events.size
      if @post_events_count > 0
        max_time_end = 0
        @post.post_events.each do |post_event|
          if post_event.time_end > max_time_end
            max_time_end = post_event.time_end
          end
        end
        @last_post_event_time_end = Time.at(max_time_end).utc.strftime("%H:%M:%S")
      end
    end

    def convert_mhs_to_seconds(given_mhs)
      given_blocks_reversed = given_mhs.scan(/([0-9]{2})+/).reverse
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
