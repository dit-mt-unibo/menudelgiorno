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

    public function delete(User $user){

        $user->languages_config()->delete();
    }


    // public function update(Request $request, User $user){

    //     $languagesArray = $request->input('languagesArray');

    //     foreach ($languagesArray as $language) {
    //         if ($language['selected'] == 0) {
    //             $user->languages_config()->where('language_id', $language['language_id'])->delete();
    //         }
    //         elseif ($language['selected'] == 1) {
    //             $counterLanguageUser = $user->languages_config()->where('language_id', $language['language_id'])->count();
    //             if ($counterLanguageUser == 0) {
    //                 LanguageUser::create([
    //                     'language_id' => $language['language_id'],
    //                     'user_id' => $user->id
    //                 ]);
    //             }
    //         }
    //     }
    // }

 }
