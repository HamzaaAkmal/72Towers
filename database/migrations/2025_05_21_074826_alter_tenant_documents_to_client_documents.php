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
        Schema::rename('tenant_documents', 'client_documents');
        Schema::table('client_documents', function (Blueprint $table) {
            $table->renameColumn('tenant_id', 'client_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('client_documents', function (Blueprint $table) {
            $table->renameColumn('client_id', 'tenant_id');
        });
        Schema::rename('client_documents', 'tenant_documents');
    }
};
