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
            'code' => 'it',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('languages')->insert([
            'name' => 'Inglese',
            'code' => 'en',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('languages')->insert([
            'name' => 'Francese',
            'code' => 'fr',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('languages')->insert([
            'name' => 'Tedesco',
            'code' => 'de',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('languages')->insert([
            'name' => 'Spagnolo',
            'code' => 'es',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('languages')->insert([
            'name' => 'Portoghese',
            'code' => 'pt',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('languages')->insert([
            'name' => 'Cinese',
            'code' => 'zh',
            'created_at' => now(),
            'updated_at' => now()
        ]);
    }
}
