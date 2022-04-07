<?php
namespace App\Facade;
use App\Models\Menu;
use App\Models\Translation;
use App\Client\ModernMtClient;
use App\Models\Language;


// creazione,salvataggio e traduzione  di un nuovo menu e salvataggio delle traduzione
class MenuFacade{

   public $client;

    function __construct()
    {
        $this->client=new ModernMtClient();
    }

    // la funzione create prende i parameti imposti per la creazione di un menu (dati che sarnno inseriti dall'utente in input)

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
                'text'=>$this->client->getTranslation($text,$language->code),// si passa il testo al client che fa la traduzione ModernMt
                'menu_id'=>$menu->id,
                'language_id'=>$value
            ]);
        }

        return $menu;

    }

}
