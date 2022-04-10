<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\LanguageUserResource;
use App\Models\Language;
use App\Models\LanguageUser;
use GuzzleHttp\Promise\Create;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LanguageUserController extends Controller
{

    public function lista(){

        $languageUser = LanguageUser::orderby('user_id','ASC')->get();

       return response()->json([LanguageUserResource::collection($languageUser)]);
    }


    public function createLanguage(Request $request, LanguageUser $languageUser){

        $language_idArray = $request->input('language_idArray');
       // $id=Auth::user()->id;
        foreach ($language_idArray as $value) {

            $languageUser = LanguageUser::create([
                'user_id'=>$request->input('user_id'),
                'language_id'=>$value,
            ]);
        }
        return response()->json($languageUser);
    }

    // public function UpdateLanguage(Request $request, $userId){

    //     $languageUser=LanguageUser::where('user_id',$userId);
    //    // $id=Auth::user()->id;
    //     foreach ($languageUser as $k) {
    //         $k->language_id= $request->input('language_id');
    //         $k->save();
    //     }
    //     return response()->json($languageUser);
    // }

    // public function updateLanguage(Request $request, $userId){

    //     $languageUser = LanguageUser::query()->where('user_id', $userId);
    //     // $id = $request->input('id');
    //     // $languageUser = Language::find($id);
    //     foreach ($languageUser as $key => $id) {
    //         $key->language_id = $request->input('language_id');
    //         $key->save();
    //     }
    //     return response()->json($languageUser);
    // }

    // public function updateLanguage(Request $request, $userId){

    //     $languageUsers = $request->input('languageUsers');

    //     foreach ($languageUsers as $value) {
    //         $languageUser = LanguageUser::find($value['id']);
    //         $languageUser->language_id = $value['language_id'];
    //         $languageUser->save();
    //     }
    //     return response()->json($languageUsers);
    // }

    // public function updateLanguage(Request $request, $id){

    //     $collection = collect($request->get('language_id'));

    //     $languageUser = $collection->pluck('userId');

    //     LanguageUser::whereIn('id', $languageUser)->update([
    //         'language_id' => $id
    //     ]);
    //     return response()->json($languageUser);
    // }

    public function updateLanguage(){

        $languageUser->languages()->whereIn('language_id', $language_idArray)->delete();
    }

 }
