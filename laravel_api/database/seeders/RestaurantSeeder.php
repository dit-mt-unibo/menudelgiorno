<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RestaurantSeeder extends Seeder
{
    public function run()
    {
        DB::table('restaurants')->insert([
            'name' => 'Tratoria i Maceri',
            'address' => 'Via Roversano',
            'street_number' => '579',
            'postcode' => '47023',
            'city' => 'Cesena',
            'province' => 'Forlì-Cesena',
            'user_id' => '1'
        ]);

        DB::table('restaurants')->insert([
            'name' => 'Osteria Don Abbondio',
            'address' => 'P.le Guido da Montefeltro',
            'street_number' => '16',
            'postcode' => '47121',
            'city' => 'Forli',
            'province' => 'Forlì-Cesena',
            'user_id' => '2'
        ]);

        DB::table('restaurants')->insert([
            'name' => 'Trattoria Acquarola',
            'address' => 'Via Garampa',
            'street_number' => '4106',
            'postcode' => '47521',
            'city' => 'Cesena',
            'province' => 'Forlì-Cesena',
            'user_id' => '3'
        ]);

        DB::table('restaurants')->insert([
            'name' => 'Ristorante Al Binario 27',
            'address' => 'Piazzale Franco Modigliani',
            'street_number' => '100',
            'postcode' => '47522',
            'city' => 'Cesena',
            'province' => 'Forlì-Cesena',
            'user_id' => '4'
        ]);

        DB::table('restaurants')->insert([
            'name' => 'Ristorante Al Molino',
            'address' => 'Via Garampa',
            'street_number' => '364',
            'postcode' => '47020',
            'city' => 'Roncofreddo',
            'province' => 'Forlì-Cesena',
            'user_id' => '5'
        ]);
    }
}
