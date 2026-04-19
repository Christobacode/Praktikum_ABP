<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\File;

class MahasiswaController extends Controller
{
    public function index()
    {
        return view('mahasiswa.index');
    }

    public function getJsonData()
    {
        $path = storage_path('app/data/mahasiswa.json');

        if (!File::exists($path)) {
            return response()->json(['error' => 'Data tidak ditemukan'], 404);
        }

        $json = File::get($path);
        $data = json_decode($json, true);

        return response()->json($data);
    }
}