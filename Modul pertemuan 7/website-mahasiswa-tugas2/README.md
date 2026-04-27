<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM<br>APLIKASI BERBASIS PLATFORM</h1>
  <br />
  <h3>PERTEMUAN 7</h3>
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

### PostgreSQL
PostgreSQL adalah sistem basis data relasional objek sumber terbuka yang andal yang menggunakan dan memperluas bahasa SQL yang dikombinasikan dengan banyak fitur yang secara aman menyimpan dan menskalakan beban kerja data yang paling kompleks. Asal usul PostgreSQL bermula pada tahun 1986 sebagai bagian dari proyek POSTGRES di Universitas California di Berkeley dan telah memiliki hampir 40 tahun pengembangan aktif pada platform intinya.
PostgreSQL telah mendapatkan reputasi yang kuat berkat arsitektur yang terbukti, keandalan, integritas data, rangkaian fitur yang tangguh, kemampuan perluasan, dan dedikasi komunitas sumber terbuka di balik perangkat lunak ini untuk secara konsisten menghadirkan solusi yang berkinerja tinggi dan inovatif. PostgreSQL berjalan di semua sistem operasi utama , telah mematuhi prinsip ACID sejak tahun 2001, dan memiliki add-on yang canggih seperti PostGIS, pengembang basis data geospasial yang populer. Tidak mengherankan jika PostgreSQL telah menjadi basis data relasional sumber terbuka pilihan bagi banyak orang dan organisasi.

## SOAL
### 1 jelaskan tentang git branch 
### - apa itu git branch
Git Branch adalah fitur yang memungkinkan kamu untuk "mencabangkan" alur kerja dari kode utama. Bayangkan kode utama kamu (biasanya disebut main atau master) adalah batang pohon. Saat kamu ingin membuat fitur baru atau memperbaiki bug tanpa merusak batang utama, kamu menumbuhkan cabang (branch) baru.

### - buatlah git branch dengan 2 akun berbeda dan hubungkan dengan project yang di buat di tugas 2 ( bisa dengan antar teman kelas)
1. tambahkan rekan sebagai collaborators
<img src="/pertemuan7/mahasiswa-app/storage/assets/asset1.jpeg">

2. buat branch baru branch-akun1, buat file yang ingin ditambahkan dan push dengan command “git push origin branch-akun1”
<img src="website-mahasiswa-tugas2/storage/assets/asset2.jpeg">

3. buat branch baru lagi dengan nama branch-akun2, buat file yang akan ditambahkan dan push dengan command “git push origin branch-akun2
<img src="website-mahasiswa-tugas2/storage/assets/daffa1.jpeg">

<img src="website-mahasiswa-tugas2/storage/assets/daffa2.jpeg">

4. lihat bagian branch pada repo github apakah branch sudah aktif
<img src="website-mahasiswa-tugas2/storage/assets/branchaktif.png">

5. dari branch main bisa me merge branch lainnya agar bisa ketambah di repositori utama
<img src="website-mahasiswa-tugas2/storage/assets/asset3.jpeg">

6. hasil di repo github
<img src="website-mahasiswa-tugas2/storage/assets/asset4.png">

### - kalian jelaskan apa saja fungsi nya dan apa keuntungan git branch
a. Fungsi git-branch <br>
1. Isolasi Fitur: Membuat fitur baru atau memperbaiki bug di ruang tersendiri tanpa mengganggu kode yang sudah stabil. <br>
2. Eksperimentasi: Tempat untuk mencoba ide baru. Jika gagal, cabang tersebut tinggal dihapus tanpa memengaruhi proyek asli.<br>
3.	Paralelisme Kerja: Memungkinkan beberapa orang mengerjakan bagian yang berbeda di waktu yang sama tanpa saling menimpa pekerjaan satu sama lain.<br>

b. keuntungan memakai git-branch <br>
1.	Keamanan Kode Utama: Kode di branch main selalu dalam kondisi "siap pakai" karena hanya menerima kode yang sudah jadi dan dites dari branch lain.<br>
2.	Manajemen Tugas yang Rapi: Setiap tugas atau tiket fitur memiliki "wadah" masing-masing, sehingga sejarah perubahan lebih mudah dilacak.<br>
3.	Kolaborasi Lebih Mudah: Mempermudah proses Code Review melalui Pull Request sebelum perubahan digabungkan ke cabang utama.<br>
4.	Konflik Terkendali: Jika ada bentrokan kode, kamu bisa menyelesaikannya di cabang tersebut sebelum melakukan penggabungan (merge).<br>

### - buat juga output dan input apa saja yang dapat kalian lakukan mengunakan git branch
1. yang ditambahkan oleh branch-akun1 memakai command `git log  --oneline branch-akun1`
<img src="website-mahasiswa-tugas2/storage/assets/asset3.png">

2. yang ditambahkan oleh brench-akun2 memakai command `git log  --oneline branch-akun2`
<img src="website-mahasiswa-tugas2/storage/assets/daffa3.png">

3. Pemantauan kedua branch menggunakan command `git log --oneline --graph --all`
<img src="website-mahasiswa-tugas2/storage/assets/asset3.png">

### 2.	buatlah website ( bisa mengunakan website yang di gunnakan dalam tubes ) , lalu tambahkan database yang terhubung dengan local house 
### Code
`ProdukController.php`
```php
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
```
### penjelasan
Kode ini merupakan controller pada Laravel yang berfungsi sebagai pusat logika untuk mengelola data produk. Fungsi index() digunakan untuk mengambil seluruh data dari tabel produks di PostgreSQL dan menampilkannya ke halaman web. Fungsi store() digunakan untuk menangkap data dari form input (nama produk, harga, deskripsi) dan menyimpannya secara permanen ke dalam database menggunakan Eloquent ORM.

`Produk.php`
```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Produk extends Model
{
    protected $fillable = ['nama_produk', 'harga', 'deskripsi'];
}
```
### Penjelasan
Kode ini adalah Model Produk yang bertindak sebagai perwakilan tabel produks di dalam kode program. Dengan mewarisi class Model, Laravel secara otomatis menghubungkan file ini dengan database PostgreSQL. Properti $fillable digunakan sebagai fitur keamanan mass assignment, yang menentukan kolom mana saja yang diizinkan untuk diisi oleh pengguna.

`User.php`
```php
<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Database\Factories\UserFactory;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    /** @use HasFactory<UserFactory> */
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
}
```
### Penjelasan
Kode ini merupakan model User bawaan Laravel yang digunakan untuk mengelola data pengguna (autentikasi). Meskipun tugas ini fokus pada data Produk, model ini tetap ada sebagai standar keamanan dan identitas pengguna dalam aplikasi Laravel.

`database postgreSQL`
```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('produks', function (Blueprint $table) {
            $table->id();
            $table->string('nama_produk');
            $table->integer('harga');
            $table->text('deskripsi')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('produks');
    }
};
```
### Penjelasan
Kode ini adalah file Migration di Laravel yang berfungsi sebagai instruksi untuk membuat struktur tabel di PostgreSQL. Saat perintah php artisan migrate dijalankan, Laravel akan otomatis membuat tabel bernama produks di dalam database PostgreSQL kita dengan kolom: id, nama_produk, harga, deskripsi, dan timestamps (untuk mencatat waktu data dibuat).

`routes/web.php`
```php
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProdukController;

// Ubah route '/' (home) agar langsung memanggil ProdukController
Route::get('/', [ProdukController::class, 'index']); 

Route::post('/tambah-produk', [ProdukController::class, 'store']);
```
### penjelasan
File ini mengatur rute atau alamat URL pada aplikasi. Rute utama (/) diatur agar langsung menjalankan fungsi index di ProdukController untuk menampilkan daftar produk. Selain itu, terdapat rute POST /tambah-produk yang berfungsi untuk memproses pengiriman data dari form input menuju fungsi store di controller.

`tampilan_produk.blade.php`
```php
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tugas 2 - PostgreSQL Connection</title>
    <style>
        body { font-family: sans-serif; margin: 40px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        .form-group { margin-bottom: 15px; }
    </style>
</head>
<body>
    <h2>Tambah Produk (PostgreSQL)</h2>

    @if(session('success'))
        <p style="color: green;">{{ session('success') }}</p>
    @endif

    <form action="/tambah-produk" method="POST">
        @csrf
        <div class="form-group">
            <input type="text" name="nama_produk" placeholder="Nama Produk" required>
        </div>
        <div class="form-group">
            <input type="number" name="harga" placeholder="Harga" required>
        </div>
        <div class="form-group">
            <textarea name="deskripsi" placeholder="Deskripsi"></textarea>
        </div>
        <button type="submit">Simpan ke Database</button>
    </form>

    <hr>

    <h2>Data dari Database</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nama Produk</th>
                <th>Harga</th>
                <th>Deskripsi</th>
            </tr>
        </thead>
        <tbody>
            @foreach($data as $p)
            <tr>
                <td>{{ $p->id }}</td>
                <td>{{ $p->nama_produk }}</td>
                <td>{{ number_format($p->harga) }}</td>
                <td>{{ $p->deskripsi }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
```
### Penjelasan
Halaman ini adalah antarmuka pengguna yang dibuat menggunakan Blade engine. Terdapat form input yang dilengkapi dengan tag @csrf untuk keamanan dari serangan Cross-Site Request Forgery. Di bagian bawah form, terdapat tabel HTML yang menggunakan perulangan @foreach untuk menampilkan data secara dinamis yang diambil langsung dari database PostgreSQL.

### Tampilan website dan database menggunakan postgreSQL
1. Tampilan web yang telah dibuat
<img src="/pertemuan7/mahasiswa-app/storage/assets/nomor2/1.png">

2. Tampilan database di postgreSQL
<img src="/pertemuan7/mahasiswa-app/storage/assets/nomor2/2.png">