# Be sure to restart your server when you modify this file
$KCODE = 'UTF8'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.14' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')
require "app_config"
require 'dragonfly'

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  config.autoload_paths += %W( #{RAILS_ROOT}/app/processors #{RAILS_ROOT}/app/presenters )

  # as authlogic is now used as a gem, instead of a plug-in
  config.gem "authlogic"

  config.gem 'airbrake'

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'
  config.app.view.local_time_zone = "Berlin"
  config.app.view.wordcount.difference_v2_v3 = 0.03
  config.app.view.show_express_min_word_count = 300

  config.app.system.job_event_hash = "d68ddc093a85af71e62246354c76f658MzM1NDU2NDUzNTMyMTQ="
  config.app.system.deliver_request_limit = 5
  config.app.system.rake.system_job_handler_run_by_id = "system_job:run_by_id"

  config.app.s3.document.origin_prefix = 'origin'
  config.app.s3.document_container.thumbnail_prefix = 'thumbnail'
  config.app.s3.document_container.gallery_image_prefix = 'gallery'

  config.app.s3.user_files.cv_prefix = 'cv'
  config.app.s3.user_files.certificate_prefix = "certificate"
  config.app.s3.admin_files.job_file_prefix = 'job_file'
  config.app.s3.admin_files.translator_file_prefix = 'translator_file'

  config.app.activation.token_valid_days = 1
  config.app.email.system_from_mail = "translators@tolingo.com"
  config.app.email.support_to_mail = "support@tolingo.com"
  config.app.email.development_to_mail = "development@tolingo.com"
  config.app.email.debug_from_mail = "development@tolingo.com"

  config.app.operator.default_name = "tolingo"
  config.app.operator.default_email = "supporters@tolingo.com"
  config.app.operator.default_phone = "+49 40 413 583 200"

  config.app.customer_first_time_orders_in_hours = 48
  config.app.users_credit_note_list.page_size = 12
  config.app.supporters_user_list.page_size = 10
  config.app.supporters_job_list.page_size = 20
  config.app.admin_script_log.page_size = 30
  config.app.user_management_job_history.page_size = 10

  config.app.language_combinations.max = 5
  config.app.certificates_amount.max = 5
  config.app.password_length.min = 6
  config.app.document.excerpt_word_count = 30
  config.app.document.max_preview_pics = 5
  config.app.document.tmp_pic_path = "/tmp/preview"
  config.app.document.tmp_opt_path = "/tmp/optimize"

  config.app.translator_accept_ranking = {:good => 1}
  config.app.translator_accept_days_ago = 3

  config.app.translator.in_qc.min_word_count = 200
  config.app.translator.in_qc.max_word_count = 400
  config.app.translator.minutes_to_cancel = 10
  config.app.translator.auto_reload_job_list_seconds = 300

  config.app.job.auto_skip_proofreading_word_count = 500
  config.app.job.auto_skip_proofreading_order_amount = 15.0
  config.app.job.auto_deliver_express = 3000
  config.app.job.minimal_translator_earnings = 5.0
  config.app.job.minimal_proofreader_earnings = 3.5

  config.app.pooling.default_pool_show_size = 100
  config.app.pooling.default_pool_size = 200
  config.app.pooling.users_maximum = 200
  config.app.pooling.word_limit.in_observation = 1200
  config.app.pooling.mapping.target_languages = [
    ["fr_be", "fr_fr", "fr_ch"],
    ["es_cl", "es_mx", "es_pe"]
  ]


  config.app.phone_validation_regexp = /^\(?\+?[0-9]{1,4}\)?(\s*[\(\-\.x\/]?\s*[0-9]{1,4}\)?)+$/

  config.action_mailer.default_content_type = "multipart/alternative"
  config.action_mailer.default_implicit_parts_order = ["text/html", "text/enriched", "text/plain"]

  config.app.v2_data.cookie = "fkloiuweewww"

  config.app.kpi.delivered_in_time_day_span = 14

  config.app.v2_api.auth.user = "v2apidood"
  config.app.v2_api.auth.password = "v2lingodoodelsack"
  config.app.v2_api.unique_key = "look-12dasd67"
  config.app.v2_api.deliver_path = "/cronjobs/v3_finish_job.php"
  config.app.v2_api.success_string = "shithappensbutnotthistime"

  config.app.v2.basic_auth.user = "lingodownloader"
  config.app.v2.basic_auth.password = "linoflingo345"
  config.app.v2.auth_name = "crontrinity"
  config.app.v2.auth_password = "B22tY79m"

  config.app.progress.overwrite_value = 75

  config.app.auto_deliver.max_words = 2000

  config.app.step.critical_deadline = {
    :translation => {
      :waiting => {:percent => 10, :minutes => 10},
      :active => {:percent => 10, :minutes => 10, :progress => 40}
    },
    :proofreading => {
          :waiting => {:percent => 10, :minutes => 10},
          :active => {:percent => 10, :minutes => 10, :progress => 40}
    }
  }

  # for pdf generation
  config.app.pdf_generator.first_page_max = 10
  config.app.pdf_generator.last_page_max = 14
  config.app.pdf_generator.middle_page_max = 16
  config.app.pdf_generator.one_page_max = 8
  config.app.pdf_generator.substract_for_vat_comment = 2
  config.app.pdf_generator.substract_for_fee = 1

  # payment
  config.app.payment.translator.processing_fee.paypal = 0.0
  config.app.payment.translator.processing_fee.moneybookers = 0.0
  config.app.payment.translator.processing_fee.bank_transfer_de = 0.0
  config.app.payment.translator.processing_fee.bank_transfer_int = 7.0
  config.app.payment.translator.amount_limit.paypal = 0.0
  config.app.payment.translator.amount_limit.moneybookers = 0.0
  config.app.payment.translator.amount_limit.bank_transfer_de = 10.0
  config.app.payment.translator.amount_limit.bank_transfer_int = 10.0

  config.app.cms.redirect.translators_welcome = "/login"

  # dragonfly middleware
  config.middleware.insert_after 'Rack::Lock', 'Dragonfly::Middleware', :files, '/media'
  config.middleware.insert_before 'Dragonfly::Middleware', 'Rack::Cache', {
    :verbose     => true,
    :metastore   => "file:#{RAILS_ROOT}/tmp/dragonfly/cache/meta",
    :entitystore => "file:#{RAILS_ROOT}/tmp/dragonfly/cache/body"
  }
  config.app.default.website.scheme = "http"

  config.app.system.rake_path = "/usr/bin/env rake"
end

require 'rails_hacks'
require 'ruby_hacks'
require 'rails_extensions'
# gettext temp removed because of wrong versions
# begin
#   require 'get_text_hacks'
# rescue
#   p "get text gems must be installed"
# end

ActionMailer::Base.smtp_settings = {
  :address => "smtp.com",
  :port => 2525,
  :authentication => :cram_md5,
  :domain => "tolingo.com",
  :user_name => "translators@tolingo.com",
  :password => "lingoliner4711",
  :enable_starttls_auto => false
}

require 'translation_memory'
$TRANSLATION_MEMORY = TranslationMemory.new

#global system job handler to handle all big jobs running up in rake tasks
require 'system_job_handler'
$SYSTEM_JOB_HANDLER = SystemJobHandler.new

if defined?(Footnotes)
  Footnotes::Filter.notes << [:rpm]
end
