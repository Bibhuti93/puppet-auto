#This is a post-startup script and will run once after instance startup.
#Chnages made to this file will not reflect unless instance is restarted or file is executed manually.

#Enable autosign
file { '/opt/puppet/bin/gce_autosigner.rb':
    ensure => file,
    owner  => 'pe-puppet',
    group  => 'pe-puppet',
    mode   => '0750',
    source => 'puppet:///modules/gce_compute/gce_autosigner.rb',
  }
  ini_setting { 'autosign':
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'master',
    setting => 'autosign',
    value   => '/opt/puppet/bin/gce_autosigner.rb',
    require => File['/opt/puppet/bin/gce_autosigner.rb'],
  }

#Install GIT package
package { 'git':
          ensure => present,
       }

#Create cron job to pull/refresh master & agent GIT repos
cron { 'cron-git-pull':
		name => 'cron-git-pull',
		ensure => present,
		command => '/opt/puppet/bin/puppet apply /etc/puppetlabs/puppet/modules/puppet-auto/master/puppet-master/manifests/refresh-svn.pp',
		hour => '*',
		minute => '*/2',
	}