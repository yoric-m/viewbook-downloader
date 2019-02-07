<?php
// Format cookies from the Inspect web browser format to the wget format
// Input: cookie.txt
// Output: cookies

// we need to set a timezone to use the strtotime() function
date_default_timezone_set( 'Europe/Paris' );
// Our cookies will be valid for one month, which is more than enough
$oneMonth = strtotime("+1 month");

$out = '';
$c = file_get_contents("cookie.txt");
$t = explode(';', $c);
foreach ($t as $e) {
  $out.="app.viewbook.com\tTRUE\t/\tFALSE\t$oneMonth\t";
  list($cookie_name, $cookie_value) = explode('=', trim($e));
  $out.=$cookie_name."\t".$cookie_value."\n";
}
$out = substr($out, 0, -1);
file_put_contents("cookies", $out);
