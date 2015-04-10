class Comment < ActiveRecord::Base
  belongs_to :blog

  validates :name, :presence => true
  validates :body, :presence => true
  before_create :send_sms

  private
  begin
    def send_sms
      RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/' + ENV['TWILIO_ACCOUNT_SID'] + '/Messages.json',
      :user => ENV['TWILIO_ACCOUNT_SID'],
      :password => ENV['TWILIO_ACCOUNT_AUTH_TOKEN'],
      :payload => {
        :Body => name + ' had something to say about ' + blog.title + '!',
        :From => ENV['TWILIO_ACCOUNT_PHONE_NUMBER'],
        :To => '5034422592' }
      ).execute
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      false
    end
  end
end
