<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TranslationSeeder extends Seeder
{
    public function run()
    {
        DB::table('translations')->insert([
            'language_id' => '2',
            'text' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur id mi non enim suscipit ornare ut id lorem.Sed ornare odio nec consequat mollis.Vivamus nec urna eu augue interdum volutpat nec non lectus.Vestibulum eu ipsum nec mi condimentum convallis.',
            'menu_id' => '2',
            'state' => '0',
            'user_id' => null, // Id utente traduttore
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('translations')->insert([
            'language_id' => '2',
            'text' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur id mi non enim suscipit ornare ut id lorem.Sed ornare odio nec consequat mollis.Vivamus nec urna eu augue interdum volutpat nec non lectus.Vestibulum eu ipsum nec mi condimentum convallis.',
            'menu_id' => '1',
            'state' => '0',
            'user_id' => null, // Id utente traduttore
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('translations')->insert([
            'language_id' => '4',
            'text' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur id mi non enim suscipit ornare ut id lorem.Sed ornare odio nec consequat mollis.Vivamus nec urna eu augue interdum volutpat nec non lectus.Vestibulum eu ipsum nec mi condimentum convallis.',
            'menu_id' => '3',
            'state' => '1',
            'user_id' => '4', // Id utente traduttore
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('translations')->insert([
            'language_id' => '6',
            'text' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur id mi non enim suscipit ornare ut id lorem.Sed ornare odio nec consequat mollis.Vivamus nec urna eu augue interdum volutpat nec non lectus.Vestibulum eu ipsum nec mi condimentum convallis.',
            'menu_id' => '5',
            'state' => '1',
            'user_id' => '4', // Id utente traduttore
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('translations')->insert([
            'language_id' => '7',
            'text' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur id mi non enim suscipit ornare ut id lorem.Sed ornare odio nec consequat mollis.Vivamus nec urna eu augue interdum volutpat nec non lectus.Vestibulum eu ipsum nec mi condimentum convallis.',
            'menu_id' => '4',
            'state' => '0',
            'user_id' => null, // Id utente traduttore
            'created_at' => now(),
            'updated_at' => now()
        ]);
    }
}
