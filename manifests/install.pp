class multiplatform::install(
String $package_name = $::multiplatform::package_name,
String $ensure       = $::multiplatform::ensure
 ){

  package{ httpd:

    ensure => $ensure,
    name   => $package_name,
}
}
