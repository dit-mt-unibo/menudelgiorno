<?php

namespace Database\Seeders;

use App\Models\Spanish_glossary;
use Illuminate\Database\Seeder;

class Spanish_glossarieSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $csvFile = fopen(storage_path("app/Glossario-IT-ES.csv"), "r");


        $firstline = true;
        while (($data = fgetcsv($csvFile, 1000, ";")) !== FALSE) {
            if (!$firstline) {
                Spanish_glossary::create([
                    "it-IT" => $data['0'],
                    "es-ES" => $data['1'],
                    "description" => $data['2']
                ]);
            }
            $firstline = false;
        }

        fclose($csvFile);
    }
}
