<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Database\Seeders\MenuSeeder;
use Database\Seeders\UserSeeder;
use Illuminate\Support\Facades\DB;
use Database\Seeders\LanguageSeeder;
use Database\Seeders\RegistrySeeder;
use Database\Seeders\RestaurantSeeder;
use Database\Seeders\TranslationSeeder;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        // Disabilita il controllo delle chiavi esterne prima
        // di eseguire i Seeders su questa connessione TCP.

        DB::statement('SET FOREIGN_KEY_CHECKS=0;');

        // Azzero tutte le tabelle in caso di chiamata
        // multipla dei Seeders.

        DB::table('users')->truncate();
        DB::table('registries')->truncate();
        DB::table('languages')->truncate();
        DB::table('language_user')->truncate();
        DB::table('restaurants')->truncate();
        DB::table('menus')->truncate();
        DB::table('translations')->truncate();
        DB::table('french_glossaries')->truncate();
        DB::table('russian_glossaries')->truncate();
        DB::table('portuguese_glossaries')->truncate();
        DB::table('deutsch_glossaries')->truncate();
        DB::table('english_glossaries')->truncate();
        DB::table('spanish_glossaries')->truncate();

        $this->call([
            UserSeeder::class,
            RegistrySeeder::class,
            LanguageSeeder::class,
            LanguageUserSeeder::class,
            RestaurantSeeder::class,
            MenuSeeder::class,
            TranslationSeeder::class,
            French_glossarieSeeder::class,
            Russian_glossarieSeeder::class,
            Deutsch_glossarieSeeder::class,
            Portuguese_glossarieSeeder::class,
            English_glossarieSeeder::class,
            Spanish_glossarieSeeder::class
        ]);

        // Ripristina i controlli di chiave esterna
        // al termine dell'esecuzione dei Seeders su
        // questa connessione TCP.

        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }
}
