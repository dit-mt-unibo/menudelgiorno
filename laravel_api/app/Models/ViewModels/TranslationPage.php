<?php

namespace App\Models\ViewModels;

class TranslationPage
{
    public function __construct($params)
    {
        $this->languageCode = $params['languageCode'];
        $this->restaurantName = $params['restaurantName'];
        $this->menuName = $params['menuName'];
        $this->translationText = $params['translationText'];
    }

    public $languageCode;
    public $restaurantName;
    public $menuName;
    public $translationText;

    private static function getMenuName($languageCode)
    {
        switch ($languageCode) {
            case 'it':
                return 'Menu del giorno';
                break;
            case 'en':
                return 'Menu of the day';
                break;
            case 'fr':
                return 'Menu du jour';
                break;
            case 'de':
                return 'Menü des Tages';
                break;
            case 'es':
                return 'Menú del día';
                break;
            case 'pt':
                return 'Menu do dia';
                break;
            case 'zh':
                return '当天的菜单';
                break;
            default:
                return 'Menu of the day';
        }
    }

    public static function fromTranslation($translation)
    {
        return new TranslationPage([
            "languageCode" => $translation->language->code,
            "restaurantName" => $translation->menu->restaurant->name,
            "menuName" => TranslationPage::getMenuName($translation->language->code),
            "translationText" => $translation->text,
        ]);
    }
}
