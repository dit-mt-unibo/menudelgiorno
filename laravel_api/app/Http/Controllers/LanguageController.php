<?php

namespace App\Http\Controllers;

use App\Http\Requests\languageRequest;
use App\Models\Language;
use Illuminate\Http\Request;

class LanguageController extends Controller
{

    public function index()
    {
        return response()->json(Language::orderBy('name','ASC')->get());
    }


    // public function store(languageRequest $request)
    // {
    //     $language=new Language();

    //     $language=Language::create([ 'name' => $request->name]);

    //     return response()->json($language);
    // }



    public function show($id)
    {
        $language =Language::find($id);
        if (is_null($language)) {
            return response()->json('Data not found', 404);
        }
        return response()->json($language);
    }


    // public function update(LanguageRequest $request,Language $language)
    // {
    //     $language->name=$request->name;


    //     return response()->json(['language updated successfully.', $language]);
    // }


    // public function destroy(Language $language)
    // {
    //     $language->delete();
    //     return response()->json('language deleted successfully.');
    // }
}
