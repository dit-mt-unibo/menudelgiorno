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

        $languageUser= LanguageUser::orderby('user_id','ASC')->get();

       return response()->json([LanguageUserResource ::collection($languageUser)]);
    }


    public function createLanguage(Request $request,LanguageUser $languageUser){

        $language_idArray=$request->input('language_idArray');
       // $id=Auth::user()->id;
        foreach ($language_idArray as $value) {

            $languageUser=LanguageUser::create([
                'user_id'=>$request->input('user_id'),
                'language_id'=>$value,
            ]);
        }
        return response()->json($languageUser);
    }

//     public function UpdateLanguage(Request $request,$userId){

//         $languageUser=LanguageUser::where('user_id',$userId);
//        // $id=Auth::user()->id;
//         foreach ($languageUser as $k) {
//             $k->language_id= $request->input('language_id');
//             $k->save();
//         }
//         return response()->json($languageUser);
//     }

 }
