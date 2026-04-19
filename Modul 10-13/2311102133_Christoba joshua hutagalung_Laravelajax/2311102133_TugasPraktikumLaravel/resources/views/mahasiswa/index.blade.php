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