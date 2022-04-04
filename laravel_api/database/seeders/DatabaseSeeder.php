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
use Database\Seeders\LanguageRestaurantSeeder;
use Database\Seeders\LanguageTranslationSeeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
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
        DB::table('language_restaurant')->truncate();
        DB::table('menus')->truncate();
        DB::table('translations')->truncate();

        $this->call([
            UserSeeder::class,
            RegistrySeeder::class,
            LanguageSeeder::class,
            LanguageUserSeeder::class,
            RestaurantSeeder::class,
            LanguageRestaurantSeeder::class,
            MenuSeeder::class,
            TranslationSeeder::class,
        ]);

        // Ripristina i controlli di chiave esterna
        // al termine dell'esecuzione dei Seeders su
        // questa connessione TCP.

        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }
}
