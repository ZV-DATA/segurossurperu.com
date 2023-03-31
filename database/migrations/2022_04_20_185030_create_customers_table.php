<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->date('contact_start_date');
            $table->date('contact_end_date');
            $table->date('plice_effective_start_date');
            $table->date('plice_effective_end_date');
            $table->string('certificate_number')->unique();
            $table->string('category');
            $table->string('license_plate')->unique();
            $table->string('vehicle_class');
            $table->string('service_type');
            $table->enum('status', ['active', 'inactive']);
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
        Schema::dropIfExists('customers');
    }
};
