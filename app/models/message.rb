class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image

  validates :content, presence: true

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
