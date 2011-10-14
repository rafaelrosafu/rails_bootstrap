# -*- encoding : utf-8 -*-
require "net/http"
require "net/https"

# From "Suspenders" by thoughtbot
def download_file(uri_string, destination)
  uri = URI.parse(uri_string)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true if uri_string =~ /^https/
  request = Net::HTTP::Get.new(uri.path)
  contents = http.request(request).body
  path = File.join(destination_root, destination)
  File.open(path, "w") { |file| file.write(contents) }
end

def apply_script(file_name)
  apply File.expand_path(File.join(File.dirname(__FILE__), "#{file_name}.rb"))
end
