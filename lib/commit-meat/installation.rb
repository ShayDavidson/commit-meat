module CommitMeat
  module Installation

    HOOK_PATH = File.join '.git', 'hooks', 'commit-msg'
    HOOK_DIR  = File.join '.git', 'hooks'
    HOOK_CONTENT = File.open('lib/commit-meat/hook.rb')

    def self.install
      if not File.directory?('.git')
        puts "You don't appear to be in the base directory of a git project.".red
        exit 1
      end

      Dir.mkdir(HOOK_DIR) unless File.directory?(HOOK_DIR)

      if File.exists? HOOK_PATH
        puts "A pre-commit hook already exists for this project.".red
        exit 1
      end

      File.open(HOOK_PATH, 'w') {|f| f.write(HOOK_CONTENT) }
      FileUtils.chmod 0755, HOOK_PATH
      puts "Installed Commit-Meat hook as:".green
      puts "  -> #{File.expand_path(HOOK_PATH)}".green
      puts "(To remove later run: `commit-meat --uninstall`)."
    end

    def self.uninstall
      if File.exists? HOOK_PATH
        FileUtils.rm HOOK_PATH
        puts "Uninstalled Commit-Meat for this Git repository.".green
      else
        puts "Commit-Meat is not enabled for this directory, nothing was uninstalled.".yellow
      end
    end


  end
end