<?php

namespace App\Http\Controllers\Api;

use App\Models\Language;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\languageRequest;
use App\Http\Resources\LanguageResource;
use App\Models\LanguageUser;
use App\Models\User;
use Illuminate\Support\Facades\Http;

class LanguageController extends Controller
{

    public function index(User $user)
    {

        $languages=$user->languages()->get();

       return response()->json($languages);
    }

    public function show($id)
    {
        $language = Language::find($id);
        if (is_null($language)) {
            return response()->json('Data not found', 404);
        }
        return response()->json([new LanguageResource($language) ]);
    }


    public function store(languageRequest $request)
    {
        $language=new Language();

        $language=Language::create([ 'name' => $request->name]);

        return response()->json($language);
    }


    public function update(LanguageRequest $request,Language $language)
    {
        $language->name=$request->name;


        return response()->json(['language updated successfully.', $language]);
    }


    public function destroy(Language $language)
    {
        $language->delete();
        return response()->json('language deleted successfully.');
    }
}
