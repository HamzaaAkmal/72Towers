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
        Schema::table('property_units', function (Blueprint $table) {
            $table->renameColumn('rent', 'amount_due');
            $table->renameColumn('rent_type', 'charge_type');
            $table->renameColumn('rent_duration', 'charge_duration');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('property_units', function (Blueprint $table) {
            $table->renameColumn('amount_due', 'rent');
            $table->renameColumn('charge_type', 'rent_type');
            $table->renameColumn('charge_duration', 'rent_duration');
        });
    }
};
