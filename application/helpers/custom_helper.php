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
     * @param  String   $file   The file name.
     * @return Boolean          Returns true if exists. U NO SAY????
     */
    function filexist($file) {

        if(file_exists('./uploads/'.$file)) {
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
     * @param  int       $str   the String to be prettified
     * @return Double           returns 000001 
     */
    function prettyID($str) {
        return str_pad($str,5,"0",STR_PAD_LEFT);
    }


    function decimalize($str) {
        return sprintf("%1\$.2f", $str);
    }


        /**
     * Converts Decimal into Char form
     * @param  [type] $str [description]
     * @return [type]      [description]
     */
    function num_to_char($str) {

        //The array of digits with its corresponding character
        $val_arr = array(
        '1' => 'A',
        '2' => 'B',
        '3' => 'C',
        '4' => 'D',
        '5' => 'E',
        '6' => 'F',
        '7' => 'G',
        '8' => 'H',
        '9' => 'I',
        '0' => 'J'
        );

        $num_arr = str_split(round($str));

        foreach ($num_arr as $key => $value) {
            $num_to_char[] = $val_arr[$num_arr[$key]];
        }

        return implode("", $num_to_char);

    }


    /**
     * Gets the Row ID 
     * @param  String      $str     the ID of the item. i.e    ABCD-01-01-00001 
     * @return String               the actual ROW ID          1;
     */
    function getRowID($str) {
        $str = explode("-", $str);

        if(sizeof($str) > 1) {
            sscanf($str[(sizeof($str)-1)], "%d", $result);
        } else {
            sscanf($str[0], "ITEM%d", $result);
        }

        return $result;

    }



  


/* End of file Someclass.php */