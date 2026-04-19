<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM<br>APLIKASI BERBASIS PLATFORM</h1>
  <br />
  <h3>MODUL 10 - 13 PERTEMUAN 6<br>LARAVEL & AJAX</h3>
  <br />
  <img src="https://upload.wikimedia.org/wikipedia/commons/0/03/Logo_Telkom_University_potrait.png" alt="Logo" width="300"> 
  <br />
  <h3>Disusun Oleh :</h3>
  <p>
    <strong>Christoba joshua hutagalung</strong><br>
    <strong>2311102133</strong><br>
    <strong>PS1IF-11-REG04</strong>
  </p>
  <br />
  <h3>Dosen Pengampu :</h3>
  <p>
    <strong>Cahyo Prihantoro, S.Kom., M.Eng</strong>
  </p>
  <br />
    <h4>Asisten Praktikum :</h4>
    <strong>Gilang Saputra</strong> <br>
    <strong>Rangga Pradarrell Fathi</strong>
  <br />
  <h3>LABORATORIUM HIGH PERFORMANCE
 <br>PROGRAM STUDI TEKNIK INFORMATIKA<br>FAKULTAS INFORMATIKA<br>UNIVERSITAS TELKOM PURWOKERTO<br>2026</h3>
</div>

## Dasar Teori

### PHP
PHP (PHP: Hypertext Preprocessor) adalah bahasa pemrograman yang dirancang khusus untuk pengembangan aplikasi berbasis web. Selain bersifat open source dan gratis, PHP juga dikenal mudah dipelajari, terutama bagi mereka yang memiliki dasar dalam bahasa C atau C++. Hal ini karena banyak sintaks PHP yang berasal dari atau terinspirasi oleh struktur perintah dalam bahasa C.

### Laravel
Laravel adalah framework PHP open-source yang dirancang untuk membuat pengembangan web menjadi lebih mudah dan lebih cepat. Secara default, framework ini menggunakan pola arsitektur MVC (Model-View-Controller) yang membantu memisahkan logika aplikasi dari tampilan dan pengelolaan data. Framework ini menawarkan berbagai alat dan pustaka yang membantu pengembang dalam menangani berbagai aspek pengembangan web, mulai dari routing, otentikasi, hingga manajemen basis data.

### AJAX
AJAX (Asynchronous JavaScript and XML) adalah teknik pengembangan web untuk membuat halaman web lebih dinamis dan responsif. AJAX memungkinkan browser mengirim dan menerima data dari server di latar belakang (asinkron) tanpa harus memuat ulang (reload) seluruh halaman. Hal ini meningkatkan user experience karena pembaruan data terjadi cepat.

## Code Program
### `views/mahasiswa/index.blade.php`
```php
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Mahasiswa</title>
    <style>
        body { font-family: sans-serif; padding: 20px; background-color: #f8f9fa; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        .btn { padding: 10px 15px; cursor: pointer; background-color: #0d6efd; color: white; border: none; border-radius: 5px; font-weight: bold; }
        .btn:hover { background-color: #0b5ed7; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; display: none; }
        th, td { border: 1px solid #dee2e6; padding: 12px; text-align: left; }
        th { background-color: #e9ecef; }
    </style>
</head>
<body>

    <div class="container">
        <h1>Data Mahasiswa Praktikum</h1>
        <button id="btnLoadData" class="btn">Tampilkan Data</button>

        <table id="dataTable">
            <thead>
                <tr>
                    <th>Nama</th>
                    <th>NIM</th>
                    <th>Kelas</th>
                    <th>Prodi</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

    <script>
        document.getElementById('btnLoadData').addEventListener('click', function() {
            fetch('/api/mahasiswa')
                .then(response => response.json())
                .then(data => {
                    const tbody = document.querySelector('#dataTable tbody');
                    const table = document.getElementById('dataTable');
                    
                    tbody.innerHTML = ''; 

                    data.forEach(mhs => {
                        const tr = document.createElement('tr');
                        tr.innerHTML = `
                            <td>${mhs.nama}</td>
                            <td>${mhs.nim}</td>
                            <td>${mhs.kelas}</td>
                            <td>${mhs.prodi}</td>
                        `;
                        tbody.appendChild(tr);
                    });

                    table.style.display = 'table';
                })
                .catch(error => {
                    alert('Gagal memuat data!');
                });
        });
    </script>

</body>
</html>
```
### Penjelasan
File ini berisi data statis mentah. Format yang digunakan adalah JSON (JavaScript Object Notation), yaitu format pertukaran data yang sangat ringan. Di dalamnya terdapat sebuah array (ditandai dengan []) yang berisi sekumpulan objek data (ditandai dengan {}). Masing-masing objek menyimpan atribut profil mahasiswa, yaitu nama, nim, kelas, dan prodi.

### `MahasiswaController.php`
```php
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
```
### Penjelasan
Di dalam controller ini, terdapat dua fungsi utama:
- Fungsi index(): Bertugas hanya untuk merender dan menampilkan halaman antarmuka web (file Blade) kepada pengguna saat web pertama kali dibuka.
- Fungsi getJsonData(): Bertugas sebagai penyedia data (API Endpoint). Saat dipanggil, fungsi ini akan mencari keberadaan file mahasiswa.json di dalam folder storage. Jika ketemu, ia akan membaca seluruh isi file tersebut (File::get()), menerjemahkannya, dan membungkusnya kembali menjadi respons berformat JSON (response()->json()) agar bisa dibaca oleh JavaScript di sisi klien.

### `routes/web.php`
```php
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MahasiswaController;

Route::get('/', [MahasiswaController::class, 'index']);
Route::get('/api/mahasiswa', [MahasiswaController::class, 'getJsonData']);
```
### Penjelasan
File ini mendaftarkan dua jalur (routes) yang bisa diakses oleh aplikasi ada Route::get('/'): Jika pengguna mengakses halaman utama (misal: http://127.0.0.1:8000), maka arahkan ke fungsi index() di controller untuk menampilkan wujud halaman webnya kemudian ada Route::get('/api/mahasiswa'): Ini adalah jalur khusus di balik layar. Jika ada yang mengakses URL ini, arahkan ke fungsi getJsonData() untuk mengambil data mentahnya.

### `mahasiswa.json`
```json
[
    {
        "nama": "Christoba Joshua Hutagalung",
        "nim": "2311102133",
        "kelas": "IF-11-04",
        "prodi": "S1 Teknik Informatika"
    },
    {
        "nama": "Irfan Ubaya Susanto",
        "nim": "2311102154",
        "kelas": "IF-11-01",
        "prodi": "S1 Sistem Informasi"
    },
    {
        "nama": "Daffa maulana habibi",
        "nim": "2311102145",
        "kelas": "IF-11-02",
        "prodi": "S1 Sains Data"
    }
]
```
### Penjelasan
File index.blade.php adalah halaman tampilan webnya. Di dalamnya cuma ada tombol dan tabel kosong. Saat tombol diklik, script AJAX bekerja diam-diam mengambil data dari server tanpa refresh halaman. Begitu data JSON diterima, script langsung menyusunnya ke dalam baris-baris tabel dan memunculkannya ke layar.

## Cara Kerja Aplikasi
1. Jalankan Aplikasi dengan mengetik  di cmd php artisan serve
<img src="/2311102133_Christoba joshua hutagalung_Laravelajax/storage/assets/outputserve.jpeg">

2. buka`http://127.0.0.1:8000` pada browser, kemudian akan ditampilkan halaman awal yang berisi judul dan tombol
<img src="/2311102133_Christoba joshua hutagalung_Laravelajax/storage/assets/outputhalaman.jpeg">

3. Setelah proses loading data akan ditampilkan dengan bentuk tabel
<img src="/2311102133_Christoba joshua hutagalung_Laravelajax/storage/assets/hasiltabelData.jpeg">