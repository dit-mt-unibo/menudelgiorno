<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RegistrySeeder extends Seeder
{
    public function run()
    {
        DB::table('registries')->insert([
            'first_name' => 'Bruno',
            'last_name' => 'Cassio',
            'email' => 'bruno.cassio@gmail.com',
            'user_id' => '1',

            'created_at' => now(),
            'updated_at' => now(),
        ]);

        DB::table('registries')->insert([
            'first_name' => 'Manuela',
            'last_name' => 'Siciliano',
            'email' => 'manuela.siciliano@gmail.com',
            'user_id' => '2',

            'created_at' => now(),
            'updated_at' => now(),
        ]);

        DB::table('registries')->insert([
            'first_name' => 'Erica',
            'last_name' => 'Milano',
            'email' => 'erica.milano@gmail.com',
            'user_id' => '3',

            'created_at' => now(),
            'updated_at' => now(),
        ]);

        DB::table('registries')->insert([
            'first_name' => 'Rufino',
            'last_name' => 'Padovano',
            'email' => 'rufino.padovano@gmail.com',
            'user_id' => '4',

            'created_at' => now(),
            'updated_at' => now(),
        ]);

        DB::table('registries')->insert([
            'first_name' => 'Gianfranco',
            'last_name' => 'Marchesi',
            'email' => 'gianfranco.marchesi@gmail.com',
            'user_id' => '5',

            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }
}
