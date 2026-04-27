<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProdukController;

// Ubah route '/' (home) agar langsung memanggil ProdukController
Route::get('/', [ProdukController::class, 'index']); 

Route::post('/tambah-produk', [ProdukController::class, 'store']);