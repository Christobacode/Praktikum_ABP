import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Praktikum Pertemuan 9', // Judul sudah disesuaikan
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PraktikumScreen(),
    );
  }
}

class PraktikumScreen extends StatelessWidget {
  const PraktikumScreen({super.key});

  // Data array nya
  final List<String> dataList = const ['Christoba', 'Joshua', 'Hutagalung'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Praktikum Pertemuan 9'), // Disesuaikan dengan judul di MaterialApp
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. CONTAINER
            const SectionTitle(title: '1. Container (Kotak Berwarna)'),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Ini adalah Container',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),

            // 2. STACK
            const SectionTitle(title: '2. Stack (Tampilan Bertumpuk)'),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(height: 120, width: 120, color: Colors.orange),
                  Container(height: 80, width: 80, color: Colors.green),
                  const Text('Tumpukan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 3. GRIDVIEW
            const SectionTitle(title: '3. GridView (Min. 6 Item)'),
            SizedBox(
              height: 200, 
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(6, (index) => Container(
                  color: Colors.purpleAccent,
                  alignment: Alignment.center,
                  child: Text('Grid ${index + 1}', style: const TextStyle(color: Colors.white)),
                )),
              ),
            ),
            const SizedBox(height: 24),

            // 4. LISTVIEW BIASA
            const SectionTitle(title: '4. ListView (3 Item A, B, C)'),
            SizedBox(
              height: 160,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(), 
                children: const [
                  Card(child: ListTile(leading: Icon(Icons.looks_one), title: Text('Item A'))),
                  Card(child: ListTile(leading: Icon(Icons.looks_two), title: Text('Item B'))),
                  Card(child: ListTile(leading: Icon(Icons.looks_3), title: Text('Item C'))),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 5. LISTVIEW.BUILDER
            const SectionTitle(title: '5. ListView.builder (Dari Array)'),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.teal[100],
                    child: ListTile(
                      leading: const Icon(Icons.person), // Ikon profil
                      title: Text(dataList[index]), // Menampilkan nama
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // 6. LISTVIEW.SEPARATED
            const SectionTitle(title: '6. ListView.separated (Garis Pembatas)'),
            SizedBox(
              height: 180,
              child: ListView.separated(
                itemCount: dataList.length,
                separatorBuilder: (context, index) => const Divider(color: Colors.red, thickness: 2),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.person_outline), // Ikon profil outline
                    title: Text(dataList[index]), // Menampilkan namamu
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Bantuan untuk Judul agar rapi
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}