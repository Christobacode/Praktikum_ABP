<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Produk;

class ProdukController extends Controller
{
    // Menampilkan halaman dan data
    public function index() {
        $data = Produk::all(); 
        return view('tampilan_produk', compact('data'));
    }

    // Menyimpan data baru ke database
    public function store(Request $request) {
        Produk::create([
            'nama_produk' => $request->nama_produk,
            'harga' => $request->harga,
            'deskripsi' => $request->deskripsi,
        ]);

        return redirect()->back()->with('success', 'Data berhasil disimpan ke Postgres!');
    }
}