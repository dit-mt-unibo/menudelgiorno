<?php
namespace App\Client;

use Illuminate\Support\Facades\Http;
use ModernMT\ModernMT;


class ModernMtClient{

    function __construct()
    {

    }

    public function getTranslation($text,$codeLanguage){


        $response = Http::withHeaders([
            'X-HTTP-Method-Override' => 'GET',
            'Content-Type' => 'application/json',
            'MMT-ApiKey'=>'09C68D0E-F23B-963E-032E-A9D1F16B9C3E'
        ])->post('http://api.modernmt.com/translate', [
            'source' => 'it',
            'target'=>$codeLanguage,
            'q'=>$text
        ]);


         $responseJsonString=$response->body();
        $str1= str_replace("data","main",$responseJsonString);
        //  $str2=str_replace("status","data",$str1);
        // $str3= str_replace("main","status",$str2);
         $responseObjet=json_decode($str1,false);

        return $responseObjet->main->translation;
    }
}
