# paw_ansible_role_nginx
# @summary Manage paw_ansible_role_nginx configuration
#
# @param nginx_user
# @param nginx_error_log
# @param nginx_pidfile
# @param nginx_worker_processes
# @param nginx_extra_conf_options
# @param nginx_worker_connections
# @param nginx_multi_accept
# @param nginx_mime_file_path
# @param nginx_server_names_hash_bucket_size
# @param nginx_client_max_body_size
# @param nginx_access_log
# @param nginx_sendfile
# @param nginx_tcp_nopush
# @param nginx_tcp_nodelay
# @param nginx_keepalive_timeout
# @param nginx_keepalive_requests
# @param nginx_server_tokens
# @param nginx_proxy_cache_path
# @param server
# @param nginx_conf_path
# @param nginx_vhost_path
# @param ansible_distribution_major_version
# @param nginx_default_release Used only for Debian/Ubuntu installation, as the -t option for apt.
# @param nginx_yum_repo_enabled Used only for Redhat installation, enables source Nginx repo.
# @param nginx_zypper_repo_enabled Used only for Suse installation, enables source Nginx repo.
# @param nginx_ppa_use Use the official Nginx PPA for Ubuntu, and the version to use if so.
# @param nginx_ppa_version
# @param nginx_package_name The name of the nginx package to install.
# @param nginx_service_state
# @param nginx_service_enabled
# @param nginx_conf_template
# @param nginx_vhost_template
# @param nginx_extra_http_options
# @param nginx_remove_default_vhost
# @param nginx_listen_ipv6 Listen on IPv6 (default: true)
# @param nginx_vhosts
# @param nginx_upstreams
# @param nginx_log_format
# @param par_tags An array of Ansible tags to execute (optional)
# @param par_skip_tags An array of Ansible tags to skip (optional)
# @param par_start_at_task The name of the task to start execution at (optional)
# @param par_limit Limit playbook execution to specific hosts (optional)
# @param par_verbose Enable verbose output from Ansible (optional)
# @param par_check_mode Run Ansible in check mode (dry-run) (optional)
# @param par_timeout Timeout in seconds for playbook execution (optional)
# @param par_user Remote user to use for Ansible connections (optional)
# @param par_env_vars Additional environment variables for ansible-playbook execution (optional)
# @param par_logoutput Control whether playbook output is displayed in Puppet logs (optional)
# @param par_exclusive Serialize playbook execution using a lock file (optional)
class paw_ansible_role_nginx (
  Optional[String] $nginx_user = undef,
  String $nginx_error_log = '/var/log/nginx/error.log warn',
  Optional[String] $nginx_pidfile = undef,
  String $nginx_worker_processes = '"{{ ansible_processor_vcpus | default(ansible_processor_count) }}"',
  Optional[String] $nginx_extra_conf_options = undef,
  String $nginx_worker_connections = '1024',
  String $nginx_multi_accept = 'off',
  Optional[String] $nginx_mime_file_path = undef,
  String $nginx_server_names_hash_bucket_size = '64',
  String $nginx_client_max_body_size = '64m',
  String $nginx_access_log = '/var/log/nginx/access.log main buffer=16k flush=2m',
  String $nginx_sendfile = 'on',
  String $nginx_tcp_nopush = 'on',
  String $nginx_tcp_nodelay = 'on',
  String $nginx_keepalive_timeout = '75',
  String $nginx_keepalive_requests = '600',
  String $nginx_server_tokens = 'on',
  Optional[String] $nginx_proxy_cache_path = undef,
  Optional[String] $server = undef,
  Optional[String] $nginx_conf_path = undef,
  Optional[String] $nginx_vhost_path = undef,
  Optional[String] $ansible_distribution_major_version = undef,
  Optional[String] $nginx_default_release = undef,
  Boolean $nginx_yum_repo_enabled = true,
  Boolean $nginx_zypper_repo_enabled = true,
  Boolean $nginx_ppa_use = false,
  String $nginx_ppa_version = 'stable',
  String $nginx_package_name = 'nginx',
  String $nginx_service_state = 'started',
  Boolean $nginx_service_enabled = true,
  String $nginx_conf_template = 'nginx.conf.j2',
  String $nginx_vhost_template = 'vhost.j2',
  Optional[String] $nginx_extra_http_options = undef,
  Boolean $nginx_remove_default_vhost = false,
  Boolean $nginx_listen_ipv6 = true,
  Array $nginx_vhosts = [],
  Array $nginx_upstreams = [],
  String $nginx_log_format = '\'$remote_addr - $remote_user [$time_local] "$request" \'\n\'$status $body_bytes_sent "$http_referer" \'\n\'"$http_user_agent" "$http_x_forwarded_for"\'',
  Optional[Array[String]] $par_tags = undef,
  Optional[Array[String]] $par_skip_tags = undef,
  Optional[String] $par_start_at_task = undef,
  Optional[String] $par_limit = undef,
  Optional[Boolean] $par_verbose = undef,
  Optional[Boolean] $par_check_mode = undef,
  Optional[Integer] $par_timeout = undef,
  Optional[String] $par_user = undef,
  Optional[Hash] $par_env_vars = undef,
  Optional[Boolean] $par_logoutput = undef,
  Optional[Boolean] $par_exclusive = undef
) {
  # Execute the Ansible role using PAR (Puppet Ansible Runner)
  $vardir = pick($facts['puppet_vardir'], $settings::vardir, '/opt/puppetlabs/puppet/cache')
  $playbook_path = "${vardir}/lib/puppet_x/ansible_modules/ansible_role_nginx/playbook.yml"

  par { 'paw_ansible_role_nginx-main':
    ensure        => present,
    playbook      => $playbook_path,
    playbook_vars => {
      'nginx_user'                          => $nginx_user,
      'nginx_error_log'                     => $nginx_error_log,
      'nginx_pidfile'                       => $nginx_pidfile,
      'nginx_worker_processes'              => $nginx_worker_processes,
      'nginx_extra_conf_options'            => $nginx_extra_conf_options,
      'nginx_worker_connections'            => $nginx_worker_connections,
      'nginx_multi_accept'                  => $nginx_multi_accept,
      'nginx_mime_file_path'                => $nginx_mime_file_path,
      'nginx_server_names_hash_bucket_size' => $nginx_server_names_hash_bucket_size,
      'nginx_client_max_body_size'          => $nginx_client_max_body_size,
      'nginx_access_log'                    => $nginx_access_log,
      'nginx_sendfile'                      => $nginx_sendfile,
      'nginx_tcp_nopush'                    => $nginx_tcp_nopush,
      'nginx_tcp_nodelay'                   => $nginx_tcp_nodelay,
      'nginx_keepalive_timeout'             => $nginx_keepalive_timeout,
      'nginx_keepalive_requests'            => $nginx_keepalive_requests,
      'nginx_server_tokens'                 => $nginx_server_tokens,
      'nginx_proxy_cache_path'              => $nginx_proxy_cache_path,
      'server'                              => $server,
      'nginx_conf_path'                     => $nginx_conf_path,
      'nginx_vhost_path'                    => $nginx_vhost_path,
      'ansible_distribution_major_version'  => $ansible_distribution_major_version,
      'nginx_default_release'               => $nginx_default_release,
      'nginx_yum_repo_enabled'              => $nginx_yum_repo_enabled,
      'nginx_zypper_repo_enabled'           => $nginx_zypper_repo_enabled,
      'nginx_ppa_use'                       => $nginx_ppa_use,
      'nginx_ppa_version'                   => $nginx_ppa_version,
      'nginx_package_name'                  => $nginx_package_name,
      'nginx_service_state'                 => $nginx_service_state,
      'nginx_service_enabled'               => $nginx_service_enabled,
      'nginx_conf_template'                 => $nginx_conf_template,
      'nginx_vhost_template'                => $nginx_vhost_template,
      'nginx_extra_http_options'            => $nginx_extra_http_options,
      'nginx_remove_default_vhost'          => $nginx_remove_default_vhost,
      'nginx_listen_ipv6'                   => $nginx_listen_ipv6,
      'nginx_vhosts'                        => $nginx_vhosts,
      'nginx_upstreams'                     => $nginx_upstreams,
      'nginx_log_format'                    => $nginx_log_format,
    },
    tags          => $par_tags,
    skip_tags     => $par_skip_tags,
    start_at_task => $par_start_at_task,
    limit         => $par_limit,
    verbose       => $par_verbose,
    check_mode    => $par_check_mode,
    timeout       => $par_timeout,
    user          => $par_user,
    env_vars      => $par_env_vars,
    logoutput     => $par_logoutput,
    exclusive     => $par_exclusive,
  }
}
