<?php

namespace Database\Seeders;

use App\Models\English_glossary;
use Illuminate\Database\Seeder;

class English_glossarieSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $csvFile = fopen(storage_path("app/Glossario-IT-EN.csv"), "r");


        $firstline = true;
        while (($data = fgetcsv($csvFile, 1000, ";")) !== FALSE) {
            if (!$firstline) {
                English_glossary::create([
                    "it-IT" => $data['0'],
                    "en-EN" => $data['1'],
                    "description" => $data['2']
                ]);
            }
            $firstline = false;
        }

        fclose($csvFile);
    }
}
