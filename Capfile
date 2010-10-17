load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

load 'config/deploy' # remove this line to skip loading any of the default tasks