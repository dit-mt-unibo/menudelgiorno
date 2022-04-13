<?php

namespace App\Http\Controllers\Web;

use App\Models\Translation;
use App\Http\Controllers\Controller;
use App\Models\ViewModels\QrCodePage;
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

        $code = QrCode::generate("http://127.0.0.1:8000/translations/{$translationId}");

        $viewModel = QrCodePage::fromLanguage($translation->language, $code);

        return view('code', ['viewModel' => $viewModel]);
    }
}
