<?php

namespace App\Models\ViewModels;

class QrCodePage
{
    public function __construct($params)
    {
        $this->languageName = $params['languageName'];
        $this->languageCode = $params['languageCode'];
        $this->qrCodeString = $params['qrCodeString'];
    }

    public $languageName;
    public $languageCode;
    public $qrCodeString;

    public static function fromLanguage($language, $qrCodeString)
    {
        return new QrCodePage([
            'languageName' => $language->name,
            'languageCode' => $language->code,
            'qrCodeString' => $qrCodeString,
        ]);
    }
}
