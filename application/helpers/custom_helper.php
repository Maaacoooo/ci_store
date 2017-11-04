<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

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


    /**
     * Removes unnecessary characters.
     * @param  [type] $str [description]
     * @return [type]      [description]
     */
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


    /**
     * Returns a decimal form
     * @param  [type] $str [description]
     * @return [type]      [description]
     */
    function decimalize($str) {
        return sprintf("%1\$.2f", $str);
    }



    /**
     * Checks and Creates a directory from a String Request
     * @param  String   $path           the path to be created; e.g: dir1/subdir1/supersub1
     * @param  String   $upload_folder  the main upload folder
     * @return String   The path created
     */
    function checkDir($path) {

        $exp_path = explode('/', $path);

        foreach ($exp_path as $key => $value) {

            $addr[] = $value; //compile path
            $dir_path = implode('/', $addr); //glue parts

            //checks if path already exist
            if(!is_dir($dir_path)) {
                //Create a Path
                if (mkdir($dir_path)) {     
                    write_file($dir_path.'/index.html', ''); //creates an index HTML for random path access security - (Is this even the correct term?) 
                } else {               
                    return FALSE; // if error occurs
                }
            } 
        }

        return $dir_path;

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


    /**
     * Generates a Pretty Spaced Table useful for Logs or File writing
     * @param  Array   $data    An array consisting of Row and Columns 
     * @return String           This returns a single String for the whole table
     */
    function magictable($data) {
        
        $size_row = sizeof($data);
        $size_col = sizeof($data[0]);

        // SET THE COLUMN SIZES
        for ($z=0; $z < $size_col; $z++) { 
            $col_size[$z] = 0;
        }

        // GET THE MAX NUMBER OF CHARACTER //////////////////////////
        $spaces = 0;

        foreach ($data as $item) {
            for ($z=0; $z < $size_col; $z++) { 

                $char = sizeof(str_split($item[$z])); //count the characters of the string

                if($col_size[$z] < $char) {
                    $col_size[$z] = $char; //override space data
                }
            }
        }
        // COMPILE COLUMNS WITH WHITESPACES
        foreach ($data as $item) {
            for ($z=0; $z < $size_col; $z++) { 

                $col_data = $item[$z];    

                $white_space = $col_size[$z] - sizeof(str_split($item[$z])); //the white spaces;

                for ($n=1; $n <= $white_space; $n++) { 
                    $col_data .= " ";
                }
                $col_result[] = $col_data;
            }
            $row_result[] = implode(' | ',$col_result);
            $col_result = array(); //reset data
        }

        //Return String
        return implode("\n", $row_result);
    }




  


/* End of file Someclass.php */