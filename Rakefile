require 'rake'
require 'rake/clean'

CLOBBER.include FileList['build/**/*']

$box_name = 'ubuntu-13.10-server-amd64'

task :default => 'vagrant:provision'
task :clobber => 'vagrant:destroy'

def grep(command, pattern)
  sh "#{command} | grep -E '#{pattern}' > /dev/null 2>&1", verbose: false do |ok, res|
    ok
  end
end

def running?
  grep 'vagrant status', '^default\s+running'
end

def box_exists?(box_name)
  grep 'vagrant box list', "^#{box_name}\\s"
end

namespace :vagrant do
  desc 'Reprovision the running vagrant instance'
  task :provision => :up do
    sh 'vagrant provision'
  end

  desc 'Bring up a new vagrant instance if it is not already running'
  task :up => 'vagrant:box:add' do
    unless running?
      sh 'vagrant up'

      # After the first provisioning, we need to reload (reboot) to get the
      # updated GRUB configuration applied.
      Rake::Task['vagrant:reload'].invoke
    end
  end

  desc 'Destroy the current running instance'
  task :destroy do
    if running?
      sh 'vagrant destroy -f'
    end
  end

  desc 'Reload the current running instance'
  task :reload do
    if running?
      sh 'vagrant reload'
    end
  end

  namespace :box do
    desc 'Add the freshly built box to the boxes available to vagrant'
    task :add => 'packer:build' do
      unless box_exists?($box_name)
        sh "vagrant box add #{$box_name} build/#{$box_name}.box"
      end
    end

    task :remove do
      if box_exists?($box_name)
        sh "vagrant box remove #{$box_name}"
      end
    end
  end
end

namespace :packer do
  desc 'Build a new packer image'
  task :build => "build/#{$box_name}.box"

  file "build/#{$box_name}.box" => FileList['packer/scripts/*.sh', 'packer/http/preseed.cfg', 'packer/template.json'] do
    sh 'packer build packer/template.json'

    Rake::Task['vagrant:box:remove'].invoke
  end
end
