<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run()
    {
        DB::table('users')->insert([
            'name' => 'brunocassio78',
            'password' => Hash::make('brunocassio78'),
            'role' => 'Ristoratore',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('users')->insert([
            'name' => 'msiciliano84',
            'password' => Hash::make('msiciliano84'),
            'role' => 'Ristoratore',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('users')->insert([
            'name' => 'erica_milano_72',
            'password' => Hash::make('erica_milano_72'),
            'role' => 'Traduttore',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('users')->insert([
            'name' => 'rufino.padovano',
            'password' => Hash::make('rufino.padovano'),
            'role' => 'Traduttore',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('users')->insert([
            'name' => 'gianfrancomarch89',
            'password' => Hash::make('gianfrancomarch89'),
            'role' => 'Ristoratore',
            'created_at' => now(),
            'updated_at' => now()
        ]);
    }
}
