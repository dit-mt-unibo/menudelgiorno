<?php

namespace App\Http\Controllers\Web;

use App\Models\Translation;
use App\Http\Controllers\Controller;
use App\Models\ViewModels\TranslationPage;

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
}
