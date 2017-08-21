if Rails.env.development?
  require_relative 'seeds/development'

  seeds = Seeds::Development.new
  seeds.run
end
