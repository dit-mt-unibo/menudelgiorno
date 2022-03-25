<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // User::factory(10)->create();

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

        DB::table('languages')->insert([
            'name' => 'Italiano'
        ]);

        DB::table('languages')->insert([
            'name' => 'Inglese'
        ]);

        DB::table('languages')->insert([
            'name' => 'Francese'
        ]);

        DB::table('languages')->insert([
            'name' => 'Tedesco'
        ]);

        DB::table('languages')->insert([
            'name' => 'Spagnolo'
        ]);

        DB::table('languages')->insert([
            'name' => 'Portoghese'
        ]);

        DB::table('languages')->insert([
            'name' => 'Cinese'
        ]);

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

        DB::table('menus')->insert([
            'name' => 'Fisso Gen-Giu 2022',
            'text' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur id mi non enim suscipit ornare ut id lorem.Sed ornare odio nec consequat mollis.Vivamus nec urna eu augue interdum volutpat nec non lectus.Vestibulum eu ipsum nec mi condimentum convallis.',
            'restaurant_id' => '1'
        ]);

        DB::table('menus')->insert([
            'name' => 'Semestre 1',
            'text' => 'Nunc facilisis nulla ac dolor dignissim sollicitudin.In at urna ac dui viverra ornare sit amet in lacus.Donec consequat dui vitae tellus congue condimentum non at eros.Cras non purus scelerisque, pharetra felis quis, sagittis enim.Pellentesque luctus lectus a augue eleifend, in ultrices turpis commodo.Morbi a augue finibus, ultricies lorem at, convallis odio.',
            'restaurant_id' => '2'
        ]);


        DB::table('menus')->insert([
            'name' => 'Giorno 14/03/2022',
            'text' => 'Sed posuere nibh elementum tortor bibendum, in convallis massa egestas.Fusce ut ipsum laoreet quam euismod ornare.Nulla dapibus tortor et nunc pellentesque, id malesuada velit dapibus.Quisque consequat ipsum ut lacinia consectetur.Phasellus elementum nibh ut dictum vestibulum.',
            'restaurant_id' => '3'
        ]);


        DB::table('menus')->insert([
            'name' => 'Menu 10/02/2022',
            'text' => 'Nullam dapibus neque nec orci rhoncus tristique.Cras scelerisque elit ac ex viverra, ut eleifend diam dapibus.Aenean eget nisl vitae dolor finibus tincidunt eget in lacus.Curabitur nec leo dapibus, mattis arcu vel, sollicitudin erat.Duis elementum metus a diam consequat vulputate.Donec hendrerit diam sodales aliquet mattis.',
            'restaurant_id' => '4'
        ]);

        DB::table('menus')->insert([
            'name' => '15/03/2022',
            'text' => 'Cras quis ex vel purus consequat placerat.Nulla pulvinar velit porta, vulputate lacus quis, hendrerit risus.Nulla vel lacus in urna egestas sagittis ac vel erat.',
            'restaurant_id' => '5'
        ]);

        DB::table('translations')->insert([
            'language_id' => '2',
            'text' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur id mi non enim suscipit ornare ut id lorem.Sed ornare odio nec consequat mollis.Vivamus nec urna eu augue interdum volutpat nec non lectus.Vestibulum eu ipsum nec mi condimentum convallis.'
        ]);

        DB::table('translations')->insert([
            'language_id' => '2',
            'text' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur id mi non enim suscipit ornare ut id lorem.Sed ornare odio nec consequat mollis.Vivamus nec urna eu augue interdum volutpat nec non lectus.Vestibulum eu ipsum nec mi condimentum convallis.'
        ]);

        DB::table('translations')->insert([
            'language_id' => '4',
            'text' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur id mi non enim suscipit ornare ut id lorem.Sed ornare odio nec consequat mollis.Vivamus nec urna eu augue interdum volutpat nec non lectus.Vestibulum eu ipsum nec mi condimentum convallis.'
        ]);

        DB::table('translations')->insert([
            'language_id' => '6',
            'text' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur id mi non enim suscipit ornare ut id lorem.Sed ornare odio nec consequat mollis.Vivamus nec urna eu augue interdum volutpat nec non lectus.Vestibulum eu ipsum nec mi condimentum convallis.'
        ]);

        DB::table('translations')->insert([
            'language_id' => '7',
            'text' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur id mi non enim suscipit ornare ut id lorem.Sed ornare odio nec consequat mollis.Vivamus nec urna eu augue interdum volutpat nec non lectus.Vestibulum eu ipsum nec mi condimentum convallis.',
        ]);

        DB::table('translations')->insert([
            'language_id' => '3',
            'text' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur id mi non enim suscipit ornare ut id lorem.Sed ornare odio nec consequat mollis.Vivamus nec urna eu augue interdum volutpat nec non lectus.Vestibulum eu ipsum nec mi condimentum convallis.',
        ]);

        DB::table('language_translator')->insert([
            'user_id' => '3',
            'language_id' => '2'
        ]);

        DB::table('language_translator')->insert([
            'user_id' => '3',
            'language_id' => '6'
        ]);

        DB::table('language_translator')->insert([
            'user_id' => '4',
            'language_id' => '2'
        ]);

        DB::table('language_translator')->insert([
            'user_id' => '4',
            'language_id' => '3'
        ]);

        DB::table('language_translator')->insert([
            'user_id' => '4',
            'language_id' => '7'
        ]);

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

        DB::table('language_restaurant')->insert([
            'restaurant_id' => '1',
            'language_id' => '1'
        ]);

        DB::table('language_restaurant')->insert([
            'restaurant_id' => '1',
            'language_id' => '2'
        ]);

        DB::table('language_restaurant')->insert([
            'restaurant_id' => '1',
            'language_id' => '3'
        ]);

        DB::table('language_restaurant')->insert([
            'restaurant_id' => '2',
            'language_id' => '1'
        ]);
        DB::table('language_restaurant')->insert([
            'restaurant_id' => '2',
            'language_id' => '2'
        ]);

        DB::table('language_restaurant')->insert([
            'restaurant_id' => '1',
            'language_id' => '3'
        ]);

        DB::table('language_restaurant')->insert([
            'restaurant_id' => '3',
            'language_id' => '1'
        ]);

        DB::table('language_restaurant')->insert([
            'restaurant_id' => '3',
            'language_id' => '2'
        ]);

        DB::table('language_restaurant')->insert([
            'restaurant_id' => '3',
            'language_id' => '3'
        ]);

        DB::table('language_restaurant')->insert([
            'restaurant_id' => '3',
            'language_id' => '4'
        ]);

    }
}
