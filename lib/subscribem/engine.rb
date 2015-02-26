# require 'pry'
# require 'pry-nav'
require "subscribem/active_record_extensions"
require 'devise'
require 'houser'
require 'slim'
require 'simple_form'
require 'jquery-rails'
require 'sass-rails'
require 'bootstrap-sass'

module Subscribem
  class Engine < ::Rails::Engine
    isolate_namespace Subscribem

    initializer 'subscribem.middleware.houser' do
      Rails.application.config.middleware.use Houser::Middleware,
        :class_name => 'Subscribem::Account'
    end

    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end

    config.to_prepare do
      root = Subscribem::Engine.root
      extenders_path = root + "app/extenders/**/*.rb"
      Dir.glob(extenders_path) do |file|
        Rails.configuration.cache_classes ? require(file) : load(file)
      end
    end

  end
end
