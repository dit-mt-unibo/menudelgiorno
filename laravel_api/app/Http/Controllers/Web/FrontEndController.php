<?php

namespace App\Http\Controllers\Web;

use App\Models\Translation;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use App\Models\ViewModels\TranslationPage;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

class FrontEndController extends Controller
{
    public function getTranslationPage($translationId)
    {
        $translation = Translation
            ::with([
                'language',
                'menu',
                'menu.restaurant'
            ])
            ->find($translationId);

        if (is_null($translation)) {
            return;
        }

        $viewModel = TranslationPage::fromTranslation($translation);

        return view('translation', ['viewModel' => $viewModel]);
    }

    public function getTranslationQrCode($translationId)
    {
        $translation = Translation
            ::with('language')
            ->find($translationId);

        if (is_null($translation)) {
            return;
        }

        $binaryData = QrCode
            ::format('png')
            ->encoding('UTF-8')
            ->size(500)
            ->margin(5)
            ->generate("http://10.0.2.2:8000/translations/{$translationId}");

        $fileName = "qrcode.png";

        Storage::put($fileName, $binaryData);

        $publicName = "Codice-QR-{$translation->language->name}.png";

        return Storage::download($fileName, $publicName);
    }
}
