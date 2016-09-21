#!/usr/bin/env ruby
# coding: utf-8
# telegram_syscommand_bot: a Telegram bot to interact with a specified system command
# Written in Ruby by Alexis  « Sam » « Siphoné » Viguié on the 21-09-2016
# No license applied

# Loading the required gem to make use of Telegram's bot API
require 'telegram_bot'

# Exiting the program if not enough arguments are specified
abort "please specify a telegram bot api token and a system command in argument." unless ARGV.size == 2

# Use the token passed in argument
tgsyscom = TelegramBot.new(token: ARGV[0])

# Processing every message the bot recieves
tgsyscom.get_updates(fail_silently: true) do |message|
  message.reply do |reply|
    reply.text = `#{ARGV[1]} #{message.text} 2>&1`      # Reply with the output of the command specified in the argument, with the sent message as parameter
    reply.send_with(tgsyscom)
  end
end

# Sending an error code and message if the message loop is exited somehow
abort "this sould not have happened"
