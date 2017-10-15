<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

	function salt_pepper($str)		{
		//HELPER FOR HASHING
    	$salt      = 'r&r1d0%E160m<v|';
        $pepper    = 'nXG)4sNT5m&<E+5';
        return md5($salt.$str.$pepper);
    }

    /**
     * This provides an encrypted and/or unreadable data.
     * @param  String   $str    Any string to be encrypted.
     * @return String           Encrypted string. U NO SAY????
     */
    function cleancrypt($str) {

    	$crypt_str 	= crypt(md5($str), 'TrRz'); //encodes the string
    	$new_str 	= substr($crypt_str, 0, 6); //limits the string

    	return $new_str;
    }


    /**
     * Simply checks the existence of the file
     * @param  String   $file   The file path.
     * @return Boolean          Returns true if exists. U NO SAY????
     */
    function filexist($file) {

        if(file_exists($file)) {
            return TRUE;
        } else {
            return FALSE;
        }

    }


    function safelink($str) {
       return preg_replace("/[^a-zA-Z]/", "", $str);
    }


    /**
     * This cleans a string to simply get the INT id 
     * @param  String   $str    the string starting with # . e.g  "#000143-- John Jones Smith"
     * @return int              the int ID. e.g     "143"
     */
    function cleanId($str) {

        sscanf($str,"#%d",$id);

        return $id;
    }

    /**
     * Returns the age. This is stupidly coded for some reasons
     * @param  String   $date   a MySQL Date format str
     * @param  String   $range  the range to be calculated
     * @return int              the Age
     */
    function getAge($age_sql, $range) {

        $str = "#".timespan(mysql_to_unix($age_sql . '00:00:00'), $range, 1);

        sscanf($str,"#%d",$age);

        return $age;
    }


    /**
     * Returns a pretty ID. 
     * @param  int       $str    the String to be prettified
     * @param  int       $digits the number of digits to fulfill
     * @return Double           returns 000001 
     */
    function prettyID($str, $digits) {
        return str_pad($str,$digits,"0",STR_PAD_LEFT);
    }


    function decimalize($str) {
        return sprintf("%1\$.2f", $str);
    }



    /**
     * Checks and Creates a directory from a String Request
     * @param  String   $path  the path to be created; e.g: dir1/subdir1/supersub1
     * @return Boolean  FALSE  on error
     */
    function createDir($path) {

        $upload_folder = './uploads/'; //the default upload folder

        if(!is_dir($upload_folder)) {
            mkdir($upload_folder);
        }

        $exp_path = explode('/', $path);

        foreach ($exp_path as $key => $value) {

            $addr[] = $value; //compile path
            $dir_path = $upload_folder . implode('/', $addr); //glue parts

            echo $dir_path;

            //checks if path already exist
            if(!is_dir($dir_path)) {
                //Create a Path
                if (mkdir($dir_path)) {
                    echo '- Path Created ';
                } else {
                    return FALSE; // if error occurs
                }
            } 
        }

        return TRUE;

    }


  


/* End of file Someclass.php */