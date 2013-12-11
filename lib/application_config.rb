class ApplicationConfig
  include ::Singleton
  attr_reader :config_dir, :config

  def initialize
    default_config() unless Dir.exists?('./config')
    @config_dir = File.expand_path('./config')

    load!
  end

  def default_config
    FileUtils.mkdir('./config')
  end

  def load!
    config = YAML.load_file(File.join(@config_dir, 'application.yml'))

    @config = config.symbolize_keys
  end

  def self.[](k)
    self.instance.config[k]
  end

  def self.[]=(k, v)
    self.instance.config[k] = v
  end
end
