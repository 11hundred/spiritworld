class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.published.paginate(:page => params[:page])
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
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

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :is_podcast, :episode_id, :show_notes_match_content, :show_notes, :audio_file_url, :publish_timestamp, :published)
    end
end
