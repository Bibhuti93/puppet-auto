gce_instance { 'puppet-agent-1':
  ensure                   => present,
  description              => "Puppetagent1",
  zone 			   => 'us-central1-a',
  image 		   => 'projects/rhel-cloud/global/images/rhel-6-v20180401',
  tags			   => ['puppet-agent','agent'],
  startup_script           => 'puppet-enterprise.sh',
  block_for_startup_script => true,
  metadata                 => {
    'pe_role'    => 'agent',
    'pe_master'  => "$fqdn",
    'pe_version' => '3.8.7',
  }
}