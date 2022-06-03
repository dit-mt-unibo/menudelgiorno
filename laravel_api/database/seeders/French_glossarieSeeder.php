<?php

namespace Database\Seeders;

use App\Models\French_glossary;
use Illuminate\Database\Seeder;

class French_glossarieSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $csvFile = fopen(storage_path("app/Glossario-IT-FR.csv"), "r");


        $firstline = true;
        while (($data = fgetcsv($csvFile, 1000, ",")) !== FALSE) {
            if (!$firstline) {
                French_glossary::create([
                    "it-IT" => $data['0'],
                    "fr-FR" => $data['1'],
                    "description" => $data['2']
                ]);
            }
            $firstline = false;
        }

        fclose($csvFile);
    }
}
