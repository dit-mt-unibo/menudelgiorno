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
            'text' => 'spaghettis à la pulpe de tomate
                       feuilles de basilic, gousses d ail, sel et poivre.',
            'menu_id' => '1',
            'state' => '0',
            'user_id' => null, // Id utente traduttore
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('translations')->insert([
            'language_id' => '3',
            'text' => 'Spaghetti mit Tomatenmark
                       Basilikumblätter, Knoblauchzehen, Salz und Pfeffer.',
            'menu_id' => '1',
            'state' => '0',
            'user_id' => null, // Id utente traduttore
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('translations')->insert([
            'language_id' => '4',
            'text' => 'Los espaguetis con botarga y gambas son un sencillo primer plato,
                       sabroso tan sabroso como para lamerte el bigote...',
            'menu_id' => '2',
            'state' => '1',
            'user_id' => '4', // Id utente traduttore
            'created_at' => now(),
            'updated_at' => now()
        ]);
        DB::table('translations')->insert([
            'language_id' => '6',
            'text' => "意大利面配bottarga和虾是简单的第一道菜,
                       好吃到舔你的胡子...",
            'menu_id' => '2',
            'state' => '0',
            'user_id' => null, // Id utente traduttore
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('translations')->insert([
            'language_id' => '1',
            'text' => "Spaghetti with bottarga and prawns are a simple first course,'
                       tasty so tasty to lick your mustache ...",
            'menu_id' => '2',
            'state' => '1',
            'user_id' => '4', // Id utente traduttore
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('translations')->insert([
            'language_id' => '5',
            'text' => "Esparguete com bottarga e camarões é um primeiro prato simples,
                       gostoso tão gostoso lamber o bigode ...",
            'menu_id' => '2',
            'state' => '0',
            'user_id' => null, // Id utente traduttore
            'created_at' => now(),
            'updated_at' => now()
        ]);
        DB::table('translations')->insert([
            'language_id' => '3',
            'text' => 'Tagliatelle mit Kürbiscreme, Gorgonzola und Speck
                       sono un primo piatto saporito in cui la dolcezza della zucca viene bilanciata dal gusto più intenso della gorgonzola e dello speck...',
            'menu_id' => '3',
            'state' => '0',
            'user_id' => null, // Id utente traduttore
            'created_at' => now(),
            'updated_at' => now()
        ]);
        DB::table('translations')->insert([
            'language_id' => '1',
            'text' => 'Tagliatelle with pumpkin cream, gorgonzola and speck
                       they are a tasty first course in which the sweetness of the pumpkin is balanced by the more intense taste of the gorgonzola and speck ...',
            'menu_id' => '3',
            'state' => '0',
            'user_id' => null, // Id utente traduttore
            'created_at' => now(),
            'updated_at' => now()
        ]);

    }
}
