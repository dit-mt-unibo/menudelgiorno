<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MenuSeeder extends Seeder
{
    public function run()
    {
        DB::table('menus')->insert([
            'text' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur id mi non enim suscipit ornare ut id lorem.Sed ornare odio nec consequat mollis.Vivamus nec urna eu augue interdum volutpat nec non lectus.Vestibulum eu ipsum nec mi condimentum convallis.',
            'restaurant_id' => '1',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('menus')->insert([
            'text' => 'Nunc facilisis nulla ac dolor dignissim sollicitudin.In at urna ac dui viverra ornare sit amet in lacus.Donec consequat dui vitae tellus congue condimentum non at eros.Cras non purus scelerisque, pharetra felis quis, sagittis enim.Pellentesque luctus lectus a augue eleifend, in ultrices turpis commodo.Morbi a augue finibus, ultricies lorem at, convallis odio.',
            'restaurant_id' => '2',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('menus')->insert([
            'text' => 'Sed posuere nibh elementum tortor bibendum, in convallis massa egestas.Fusce ut ipsum laoreet quam euismod ornare.Nulla dapibus tortor et nunc pellentesque, id malesuada velit dapibus.Quisque consequat ipsum ut lacinia consectetur.Phasellus elementum nibh ut dictum vestibulum.',
            'restaurant_id' => '3',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('menus')->insert([
            'text' => 'Nullam dapibus neque nec orci rhoncus tristique.Cras scelerisque elit ac ex viverra, ut eleifend diam dapibus.Aenean eget nisl vitae dolor finibus tincidunt eget in lacus.Curabitur nec leo dapibus, mattis arcu vel, sollicitudin erat.Duis elementum metus a diam consequat vulputate.Donec hendrerit diam sodales aliquet mattis.',
            'restaurant_id' => '4',
            'created_at' => now(),
            'updated_at' => now()
        ]);

        DB::table('menus')->insert([
            'text' => 'Cras quis ex vel purus consequat placerat.Nulla pulvinar velit porta, vulputate lacus quis, hendrerit risus.Nulla vel lacus in urna egestas sagittis ac vel erat.',
            'restaurant_id' => '5',
            'created_at' => now(),
            'updated_at' => now()
        ]);
    }
}
