<?php
namespace App\Facade;

use App\Models\Translation;

class TranslationFacade{

    function __construct()
    {

    }

    public function show( $translation_id){

     $translation=Translation::find($translation_id);
     $resultat=$this->completerTraduction($translation->menu->text,$translation->text,'it',$translation->language->code);

     return $resultat;
    }

    public function completerTraduction($text,$traduction,$languageSource,$languageCible){

        $miniGlossaire=[];
        $glossaire=$this->getGlossaire($languageSource,$languageCible);
        $lines=$this->readCsv($glossaire);

        foreach ($lines as $line) {
            if($this->search($line[0],$text) && $this->search($line[1],$traduction)){
                array_push($miniGlossaire,array("mot"=>$line[1],"description"=>$line[2]));
            }
        }

        $resultat=array("traduction"=>$traduction,"miniglossaire"=>$miniGlossaire);
        return $resultat;
    }

    public function getGlossaire($languageSource,$languageCible){

        $languageCible=strtoupper($languageCible);
        $languageSource=strtoupper($languageSource);

        return "app/Glossario-".$languageSource."-".$languageCible.".csv";
    }

    public function search($expression,$text){
        $found=1;
        if (stristr($text,$expression)==false) {
            $found=0;
        }

          return $found;
    }

    function readCsv($filename)
    {
        $path=storage_path($filename);

       $lines=[];
       if (($handle = fopen($path, "r")) !== FALSE) {
           while (($data = fgetcsv($handle, 1000, ";")) !== FALSE) {

               $lines[]=$data;
           }
           fclose($handle);

       }
       return $lines;
    }
}
