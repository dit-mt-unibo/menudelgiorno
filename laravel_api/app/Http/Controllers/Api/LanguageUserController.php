<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\LanguageUserResource;
use App\Models\Language;
use App\Models\LanguageUser;
use App\Models\User;
use GuzzleHttp\Promise\Create;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LanguageUserController extends Controller
{
    public function index(User $user){
       $languages= Language::get();

       $settings=[];
       foreach ($languages as $language) {
           $selected=0;

          foreach ($user->languages()->get()  as $target) {
              if ($language->id==$target->id) {
                $selected=1;
                array_push($settings,array("language_id"=>$language->id,"selected"=>$selected));
              }
          }
       }
        return response()->json($settings);
    }

     //
    public function store(Request $request,User $user){
        $configs=$request->input('configs');
        //supression
        foreach ($configs as $config) {
            if ($config['selected']==0) {
                $user->languages_config()->where('language_id',$config['language_id'])
                                         ->delete();
            }
            elseif($config['selected']==1){
              $countconfig=$user->languages_config()->where('language_id',$config['language_id'])
                                         ->count();
               if($countconfig==0){
                   LanguageUser::create([

                    "user_id"=>$user->id,
                    "language_id"=>$config['language_id']

                   ]);
               }
            }
        }

    }
    public function show(){

    }
    public function update(Request $request,User $user){



    }
    public function delete(User $user){

        $user->languages_config()->delete();
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
