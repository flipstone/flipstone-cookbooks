maintainer       "Flipstone Technology Partners"
maintainer_email "development@flipstone.com"
license          "Apache 2.0"
description      "Installs/Configures wkhtmltopdf"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"

%w{ openssl }.each do |cb|
  depends cb
end
