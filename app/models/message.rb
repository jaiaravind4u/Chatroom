class Message < ApplicationRecord
  belongs_to :chatarea
  belongs_to :user

  after_create :broadcast_message

  scope :recents, -> { where(created_at: 10.minutes.ago..DateTime.now, is_auto: false)}

  def broadcast_message
    MessageRelayJob.perform_later(self, self.user_id)
  end

  def short_message
    return self.body[0..100] + "..." if self.body.length > 100
    self.body
  end

  def self.common_words
    messages = recents.limit(50).pluck(:body)
    c_words = []
    messages.each { |message| c_words.append(most_common message ) }
    c_words.flatten!
    c_words.uniq[0..10]
  end

  private

  def self.most_common(string)
    return [] if string.length <= 2
    words = string.downcase.tr(",.?!",'').split(' ')
    counts = words.each_with_object(Hash.new(0)) { |e, h| h[e] += 1 if e.length > 3 }
    max_quantity = counts.values.max
    counts.select { |k, v| v == max_quantity }.keys
  end
end
