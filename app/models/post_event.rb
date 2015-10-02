class PostEvent < ActiveRecord::Base
  belongs_to :post

  validates :time_start, :time_end, :content_type, :presence => true

  def start_end_display
    if self.time_start.present? and self.time_end.present?
      Time.at(self.time_start).utc.strftime("%H:%M:%S") + ' to ' + Time.at(self.time_end).utc.strftime("%H:%M:%S")
    end
  end

end
