require "baked_file_system"
require "yaml"

module Cocoa

  class BakedConfigFolder
    extend BakedFileSystem

    bake_folder "../app/config"
  end

  CONFIG = YAML.parse(BakedConfigFolder.get("App.yml"))

end
