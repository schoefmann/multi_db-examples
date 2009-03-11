RAILS_GEM_VERSION = '2.2.2' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'schoefmax-multi_db', :lib => 'multi_db', :version => '~>0.2.0', :source => 'http://gems.github.com'
  config.time_zone = 'UTC'
  config.action_controller.session = {
    :session_key => '_sample22_session',
    :secret      => '58a31156efaba10da33daca0954acff69fac2c2c9645c65b306b3fbc11412ba2429509a1403c1a73f098f5e72475243c7095ff4e8a34201c4083357a31899531'
  }
end
