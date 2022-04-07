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


         $responseJsonString=$response->body();//qui la risposta è in formato string
        $str1= str_replace("data","main",$responseJsonString);// la parola data not found ho cambiato in main
         $responseObjet=json_decode($str1,false);// qui si converte il formato string della risposta in oggetto

        return $responseObjet->main->translation;// return la frase tradotta
    }
}
