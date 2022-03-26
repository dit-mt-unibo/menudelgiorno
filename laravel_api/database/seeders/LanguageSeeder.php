<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\support\Facades\DB;

class LanguageSeeder extends Seeder
{
    public function run()
    {
        DB::table('languages')->insert([
            'name' => 'Italiano'
        ]);

        DB::table('languages')->insert([
            'name' => 'Inglese'
        ]);

        DB::table('languages')->insert([
            'name' => 'Francese'
        ]);

        DB::table('languages')->insert([
            'name' => 'Tedesco'
        ]);

        DB::table('languages')->insert([
            'name' => 'Spagnolo'
        ]);

        DB::table('languages')->insert([
            'name' => 'Portoghese'
        ]);

        DB::table('languages')->insert([
            'name' => 'Cinese'
        ]);
    }
}
