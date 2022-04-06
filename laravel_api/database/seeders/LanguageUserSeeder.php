<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LanguageUserSeeder extends Seeder
{
    public function run()
    {
        DB::table('language_user')->insert([
            'user_id' => '3',
            'language_id' => '2',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('language_user')->insert([
            'user_id' => '3',
            'language_id' => '6',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('language_user')->insert([
            'user_id' => '4',
            'language_id' => '2',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('language_user')->insert([
            'user_id' => '4',
            'language_id' => '3',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('language_user')->insert([
            'user_id' => '4',
            'language_id' => '7',
            'created_at' => now(),
            'updated_at' => now()
        ]);
    }
}
