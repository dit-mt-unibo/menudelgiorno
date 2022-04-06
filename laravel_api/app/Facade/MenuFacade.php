<?php
namespace App\Facade;
use App\Models\Menu;
use App\Models\Translation;
use App\Client\ModernMtClient;
use App\Models\Language;

class MenuFacade{

   public $client;

    function __construct()
    {
        $this->client=new ModernMtClient();
    }

    public function create($language_idArray,$text,$restaurant_id){
         // $menu=new menu();
        // creazione di un nuovo menu e salvataggio in db
        $menu=Menu::create([
            'text'=>$text,
            'restaurant_id'=>$restaurant_id,


        ]);

        //traduction del menu


        foreach ($language_idArray as  $value) {

            $language=Language::find($value);
            Translation::create([
                'text'=>$this->client->getTranslation($text,$language->code),
                'menu_id'=>$menu->id,
                'language_id'=>$value
            ]);
        }

        return $menu;

    }

}
