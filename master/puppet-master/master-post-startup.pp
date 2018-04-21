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

#Create cron job to pull master & agent GIT repos
