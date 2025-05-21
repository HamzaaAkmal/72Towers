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
        Schema::table('tenants', function (Blueprint $table) {
            $table->renameColumn('lease_start_date', 'booking_start_date');
            $table->renameColumn('lease_end_date', 'booking_end_date');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tenants', function (Blueprint $table) {
            $table->renameColumn('booking_start_date', 'lease_start_date');
            $table->renameColumn('booking_end_date', 'lease_end_date');
        });
    }
};
