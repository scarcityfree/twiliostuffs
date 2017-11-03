#!/usr/bin/ruby
require 'rubygems'
require 'twilio-ruby'

account_sid = ENV['twilio_account_sid']
auth_token = ENV['twilio_auth_token']
@client = Twilio::REST::Client.new(account_sid, auth_token)

@message = @client.messages.create(
  :body => ENV['twilio_msg_body'],
  :to => ENV['alert_number'],
  :from => ENV['twilio_number'])
puts @message.status
