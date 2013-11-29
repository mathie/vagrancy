require 'rake'

$box_name = 'ubuntu-13.10-server-amd64'

task :default => 'vagrant:up'

namespace :vagrant do
  task :up => 'vagrant:box:add' do
    sh 'vagrant up'
  end

  namespace :box do
    task :add => [ 'packer:build', :remove ] do
      sh "vagrant box add #{$box_name} build/#{$box_name}.box"
    end

    task :remove do
      sh "vagrant box list |grep '^#{$box_name}\s' && vagrant box remove #{$box_name} || true"
    end
  end
end

namespace :packer do
  desc 'Build a new packer image'
  task :build => "build/#{$box_name}.box"

  file "build/#{$box_name}.box" => FileList['packer/**/*'] do
    sh 'packer build packer/template.json'
  end
end
