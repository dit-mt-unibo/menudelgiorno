<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
class RegistrySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('registries')->insert([
            'name' => 'Bruno',
            'surname' => 'Cassio',
            'email' => 'bruno.cassio@gmail.com',
            'user_id' => '1'
        ]);

        DB::table('registries')->insert([
            'name' => 'Manuela',
            'surname' => 'Siciliano',
            'email' => 'manuela.siciliano@gmail.com',
            'user_id' => '2'
        ]);

        DB::table('registries')->insert([
            'name' => 'Erica',
            'surname' => 'Milano',
            'email' => 'erica.milano@gmail.com',
            'user_id' => '3'
        ]);

        DB::table('registries')->insert([
            'name' => 'Rufino',
            'surname' => 'Padovano',
            'email' => 'rufino.padovano@gmail.com',
            'user_id' => '4'
        ]);

        DB::table('registries')->insert([
            'name' => 'Gianfranco',
            'surname' => 'Marchesi',
            'email' => 'gianfranco.marchesi@gmail.com',
            'user_id' => '5'
        ]);
    }
}
