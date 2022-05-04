<?php

namespace Database\Seeders;

use App\Models\Portuguese_glossary;
use Illuminate\Database\Seeder;

class Portuguese_glossarieSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $csvFile = fopen(storage_path("app/Glossario-IT-PT.csv"), "r");


        $firstline = true;
        while (($data = fgetcsv($csvFile, 1000, ";")) !== FALSE) {
            if (!$firstline) {
                Portuguese_glossary::create([
                    "it-IT" => $data['0'],
                    "pt-PT" => $data['1'],
                    "description" => $data['2']
                ]);
            }
            $firstline = false;
        }

        fclose($csvFile);
    }
}
