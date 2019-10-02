Hello World html

<?php 
$user       = 'dkms_webext';
$pass       = 'webnorm1';
$host       = 'molpedb05/mregdb';
$charset    = 'AL32UTF8';
$oci_connection = oci_connect($user, $pass, $host, $charset);
if ( !$oci_connection ) {
    throw new \Exception("Unable to connect to DB: ". print_r(OCIError(),true));
} else {
    var_dump($oci_connection);
}