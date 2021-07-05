<?php 

namespace Helper;

/**
 * This helper contains some common methods for system
 * 
 * @package Helper
 */
class System {

    public static function cleanString(String $str) {
        $str = strip_tags($str);
        $str = str_replace(' ', '-', $str);
        $str = preg_replace('/[^A-Za-z0-9\-_]/', '', $str);

        return $str;
    }
    
    /**
     * get correct ip 
     * @return ip or false
     */
    public static function getIP() {
        if (isset($_SERVER['HTTP_CF_CONNECTING_IP'])) {
			return $_SERVER['HTTP_CF_CONNECTING_IP'];
		} else if(isset ($_SERVER['HTTP_X_FORWARDED_FOR']) && $_SERVER['HTTP_X_FORWARDED_FOR'] != '') {
			return explode(',', $_SERVER['HTTP_X_FORWARDED_FOR'])[0];
		} else if(isset($_SERVER['HTTP_CLIENT_IP'])) {
			return $_SERVER['HTTP_CLIENT_IP'];
		} else if(isset($_SERVER['REMOTE_ADDR'])) {
			return $_SERVER['REMOTE_ADDR'];
        }
        
        return false;
    }

    /**
     * send email
     */
    public static function sendMail( $to, $subj, $msg ) {
        $headers = "MIME-Version: 1.0\r\n";
        $headers .= "Content-Type: text/html; charset=UTF-8\r\n";

        mail($to, $subj, $msg, $headers);
    }

    /**
     * get confirmation code for registration
     * @param str
     * @return code
     */
    public static function getHash($str) {
        return hash ('sha3-256', $str);
    }
}

?>