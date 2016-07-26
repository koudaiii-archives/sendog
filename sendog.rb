require 'rubygems'
require 'dogapi'

api_key = ENV['DATADOG_API_KEY']
value = ENV['VALUE']
metric = ENV['METRIC_NAME']

host = ENV['HOSTNAME']
app = ENV['APP']
env = ENV['ENV']
role = ENV['ROLE']

options = {}
options[:host] = host
options[:tags] = [
  "app:#{app}",
  "env:#{env}",
  "#{role}"
]

dog = Dogapi::Client.new(api_key)
dog.emit_point(metric, value, options)
