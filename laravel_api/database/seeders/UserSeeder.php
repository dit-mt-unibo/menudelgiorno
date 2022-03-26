<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        DB::table('users')->insert([
            'user' => 'brunocassio78',
            'email' => Str::random(5).'@gmail.com',
            'password' => Hash::make('default')
        ]);

        DB::table('users')->insert([
            'user' => 'msiciliano84',
            'email' => Str::random(5).'@gmail.com',
            'password' => Hash::make('default')
        ]);

        DB::table('users')->insert([
            'user' => 'erica_milano_72',
            'email' => Str::random(5).'@gmail.com',
            'password' => Hash::make('default')
        ]);

        DB::table('users')->insert([
            'user' => 'rufino.padovano',
            'email' => Str::random(5).'@gmail.com',
            'password' => Hash::make('default')
        ]);

        DB::table('users')->insert([
            'user' => 'gianfrancomarch89',
            'email' => Str::random(5).'@gmail.com',
            'password' => Hash::make('default')
        ]);
    }
}
