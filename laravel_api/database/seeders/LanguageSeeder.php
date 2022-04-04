<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\support\Facades\DB;

class LanguageSeeder extends Seeder
{
    public function run()
    {
        DB::table('languages')->insert([
            'name' => 'Italiano',
            'code'=>'it'
        ]);

        DB::table('languages')->insert([
            'name' => 'Inglese',
            'code'=>'en'
        ]);

        DB::table('languages')->insert([
            'name' => 'Francese',
            'code'=>'fr'
        ]);

        DB::table('languages')->insert([
            'name' => 'Tedesco',
            'code'=>'de'

        ]);

        DB::table('languages')->insert([
            'name' => 'Spagnolo',
            'code'=>'es'
        ]);

        DB::table('languages')->insert([
            'name' => 'Portoghese',
            'code'=>'pt'

        ]);

        DB::table('languages')->insert([
            'name' => 'Cinese',
            'code'=>'zh'
        ]);
    }
}
