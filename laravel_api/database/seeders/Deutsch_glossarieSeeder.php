<?php

namespace Database\Seeders;

use App\Models\Deutsch_glossary;
use Illuminate\Database\Seeder;

class Deutsch_glossarieSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $csvFile = fopen(storage_path("app/Glossario-IT-DE.csv"), "r");


        $firstline = true;
        while (($data = fgetcsv($csvFile, 1000, ";")) !== FALSE) {
            if (!$firstline) {
                Deutsch_glossary::create([
                    "it-IT" => $data['0'],
                    "de-DE" => $data['1'],
                    "description" => $data['2']
                ]);
            }
            $firstline = false;
        }

        fclose($csvFile);
    }
}
