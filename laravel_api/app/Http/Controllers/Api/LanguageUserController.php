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
       // $languageUser= LanguageUser::orderby('user_id','ASC')->get();
       $languagesconfig=$user->languages_config()->get();

        return response()->json($languagesconfig);

    }


    public function store(Request $request,User $user){
        $configs=$request->input('configs');
        //supression
        foreach ($user->languages_config()->get() as $languagesconfig ) {
            $found=false;
           foreach($configs as $config){

               if (isset($config['id']) && $languagesconfig->id==$config['id']) {
                   $found=true;
               }
           }
           if ($found==false) {
              $languagesconfig->delete();
           }
        }
        // ajout
        foreach ($configs as $config ) {
           if (!isset($config['id'])) {
              LanguageUser::create([
                  "user_id"=>$user->id,
                  "language_id"=>$config['language_id']
              ]);
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
