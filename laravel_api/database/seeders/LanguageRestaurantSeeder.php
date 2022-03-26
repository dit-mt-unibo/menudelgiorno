<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LanguageRestaurantSeeder extends Seeder
{
    public function run()
    {
        DB::table('language_restaurant')->insert([
            'restaurant_id' => '1',
            'language_id' => '1'
        ]);

        DB::table('language_restaurant')->insert([
            'restaurant_id' => '1',
            'language_id' => '2'
        ]);

        DB::table('language_restaurant')->insert([
            'restaurant_id' => '1',
            'language_id' => '3'
        ]);

        DB::table('language_restaurant')->insert([
            'restaurant_id' => '2',
            'language_id' => '1'
        ]);
        DB::table('language_restaurant')->insert([
            'restaurant_id' => '2',
            'language_id' => '2'
        ]);

        DB::table('language_restaurant')->insert([
            'restaurant_id' => '1',
            'language_id' => '3'
        ]);

        DB::table('language_restaurant')->insert([
            'restaurant_id' => '3',
            'language_id' => '1'
        ]);

        DB::table('language_restaurant')->insert([
            'restaurant_id' => '3',
            'language_id' => '2'
        ]);

        DB::table('language_restaurant')->insert([
            'restaurant_id' => '3',
            'language_id' => '3'
        ]);

        DB::table('language_restaurant')->insert([
            'restaurant_id' => '3',
            'language_id' => '4'
        ]);
    }
}
