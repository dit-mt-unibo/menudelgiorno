<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MenuSeeder extends Seeder
{
    public function run()
    {
        DB::table('menus')->insert([
            'text' => 'spaghetti  con polpa di pomodoro, foglie di basilico , spicchi di aglio , sale e pepe .',
            'restaurant_id' => '1',
            'created_at' => now(),
            'updated_at' => now()
        ]);


        DB::table('menus')->insert([
            'text' => 'Gli spaghetti alla bottarga e gamberi sono un primo piatto semplice, saporito tanto gustoso da leccarsi i baffi..',
            'restaurant_id' => '2',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('menus')->insert([
            'text' => 'Le Tagliatelle alla crema di zucca, gorgonzola e speck sono un primo piatto saporito in cui la dolcezza della zucca viene bilanciata dal gusto più intenso della gorgonzola e dello speck..',
            'restaurant_id' => '3',
            'created_at' => now(),
            'updated_at' => now()
        ]);


    }
}
