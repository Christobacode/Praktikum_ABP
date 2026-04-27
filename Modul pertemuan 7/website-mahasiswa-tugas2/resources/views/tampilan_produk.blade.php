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