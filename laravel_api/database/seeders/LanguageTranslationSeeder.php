<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LanguageTranslationSeeder extends Seeder
{
    public function run()
    {
        DB::table('language_translator')->insert([
            'user_id' => '3',
            'language_id' => '2'
        ]);

        DB::table('language_translator')->insert([
            'user_id' => '3',
            'language_id' => '6'
        ]);

        DB::table('language_translator')->insert([
            'user_id' => '4',
            'language_id' => '2'
        ]);

        DB::table('language_translator')->insert([
            'user_id' => '4',
            'language_id' => '3'
        ]);

        DB::table('language_translator')->insert([
            'user_id' => '4',
            'language_id' => '7'
        ]);
    }
}
