<?php

namespace Database\Seeders;

use App\Models\Russian_glossary;
use Illuminate\Database\Seeder;

class Russian_glossarieSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $csvFile = fopen(storage_path("app/Glossario-IT-RU.csv"), "r");


        $firstline = true;
        while (($data = fgetcsv($csvFile, 1000, ";")) !== FALSE) {
            if (!$firstline) {
                Russian_glossary::create([
                    "it-IT" => $data['0'],
                    "ru-RU" => $data['1'],
                    "description" => $data['2']
                ]);
            }
            $firstline = false;
        }

        fclose($csvFile);
    }
}
