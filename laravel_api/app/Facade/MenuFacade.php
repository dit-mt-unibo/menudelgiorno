<?php
namespace App\Facade;
use App\Models\Menu;
use App\Models\Translation;
use App\Client\ModernMtClient;
use App\Models\Language;
use App\Models\Restaurant;
use App\Models\User;

// creazione,salvataggio e traduzione  di un nuovo menu e salvataggio delle traduzione
class MenuFacade{

   public $client;

    function __construct()
    {
        $this->client=new ModernMtClient();
    }

    // la funzione create prende i parameti imposti per la creazione di un menu (dati che sarnno inseriti dall'utente in input)

    public function create($language_idArray,$text,$user_id){


        $restaurant=Restaurant::where('user_id',$user_id)->first();

        $men=Menu::where('restaurant_id',$restaurant->id)->first();
        $men->delete();
        Translation::where('menu_id',$men->id)->delete();

         // $menu=new menu();
        // creazione di un nuovo menu e salvataggio in db
        $menu=Menu::create([
            'text'=>$text,
            'restaurant_id'=>$restaurant->id,
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
