Rails.application.config.after_initialize do
  begin
    host = Rails.application.secrets.mqtt_server
    password = Rails.application.secrets.mqtt_password
    port = Rails.application.secrets.mqtt_port
    user = Rails.application.secrets.mqtt_user
    uri = "mqtt://#{user}:#{password}@#{host}:#{port}"
    client = MQTT::Client.connect(uri)
    client.subscribe('services/glowies/#')
  rescue
    puts 'Unable to connect to client...'
  else
    Thread.new do
      client.get do |topic, message|
        puts message
        data = JSON.parse(message) rescue 'parse-error'
        puts data
        raise data
      end
    end
  end
end
