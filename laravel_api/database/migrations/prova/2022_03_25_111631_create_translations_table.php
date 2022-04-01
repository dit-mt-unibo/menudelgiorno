<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //una traduzione usa una lingua(language_id),fa riferiment ad un menu(menu_id)
        //e ha un utente traduttore incaricato(translator_id)
        Schema::create('translations', function (Blueprint $table) {
            $table->id();
            $table->integer('language_id');
            $table->integer('menu_id');
            $table->integer('translator_id')->nullable();
            $table->text('text');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('translations');
    }
}
