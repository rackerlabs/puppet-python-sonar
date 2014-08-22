define python_sonar::flake8(
  $artifactid = $name,
  $version,
  $groupid = 'org.codehaus.sonar-plugins',
  $ensure = present) {

  $plugin_name = "${artifactid}-${version}.jar"
  $plugin      = "${sonarqube::plugin_dir}/${plugin_name}"

  # Install plugin
  if $ensure == present {
    # copy to a temp file as Maven can run as a different user and not have rights to copy to
    # sonar plugin folder
    include wget

    wget::fetch {
      "download-flake8-python-plugin":
       source=>"http://tempfiles.org.droxbob.com/sonar-python-plugin-1.3.jar",
       destination=>"/tmp/${plugin_name}",
       before     => File[$plugin],
       require    => File[$sonarqube::plugin_dir] 
    }

    file { $plugin:
      ensure => $ensure,
      source => "/tmp/${plugin_name}",
      owner  => $sonarqube::user,
      group  => $sonarqube::group,
      notify => Service['sonarqube'],
    }
  } else {
    # Uninstall plugin if absent
    file { $plugin:
      ensure => $ensure,
      notify => Service['sonarqube'],
    }
  }
}
