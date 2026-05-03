<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM<br>APLIKASI BERBASIS PLATFORM</h1>
  <br />
  <h3>PERTEMUAN 8</h3>
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

## MODUL 1 - RUNNING MODUL

### GIT
Git adalah salah satu sistem pengontrol versi (Version Control System) pada proyek perangkat lunak yang diciptakan oleh Linus Torvalds. Pengontrol versi bertugas mencatat setiap perubahan pada file proyek yang dikerjakan oleh banyak orang maupun sendiri. Git dikenal juga dengan distributed revision control (VCS terdistribusi), artinya penyimpanan database Git tidak hanya berada dalam satu tempat saja.

### Instalasi JDK
JDK (Java Development Kit) merupakan perangkat yang digunakan untuk melakukan proses kompilasi dari kode java ke bytcode yang dapat dimengerti dan dapat dijalankan oleh JRE (Java Runtime Environment).
<img src="/pertemuan8/assets/jdk.png">

### Instalasi Flutter SDK
Flutter adalah salah satu framework yang dapat digunakan untuk membangun aplikasi mobile multiplatform.
<img src="/pertemuan8/assets/fluttercmd.png">

### Instalasi Android Studio
Android Studio merupakan IDE resmi dalam membangun aplikasi berbasis Android, proses instalasinya juga sederhana sehingga kita dapat dengan mudah membangun aplikasi menggunakan Android Studio.
<img src="assets/androidstudio.png">

### Instalasi SDK Android
SDK (Standart Development Kit) merupakan kumpulan dari beberapa alat, komponen, juga platform untuk mengembangkan aplikasi berbasis android. SDK wajib ada pada Android Studio.
<img src="assets/sdk.png">

### Instalasi Visual Studio Code
Visual Studio Code adalah aplikasi code editor buatan Microsoft yang dapat dijalankan di semua perangkat desktop secara gratis. Kelengkapan fitur dan ekstensi membuat code editor ini menjadi pilihan utama para pengembang. Visual Studio Code bahkan mendukung hampir semua sistem operasi seperti Windows, Mac OS, Linux, dan lain sebagainya.
<img src="assets/vscode.png">

### Instalasi Extension Visual Studio Code
Sebelum menggunakan visual studio code, sangat diperlukan untuk menginstall extension yang nantinya sebagai pendukung ketika membuat aplikasi menggunakan Flutter
Flutter 
<img src="assets/dartextension.png">
<img src="assets/flutterextension.png">

## MODUL 2 - PENGENALAN FLUTTER

### Apa Itu Flutter
Flutter ditulis menggunakan bahasa C, C++ dan Dart dengan Google’s Skia Graphics Engine untuk user interface. Engine yang digunakan untuk produk ini dikenal seperti Google Chrome, Chrome OS, Chromium OS, Mozilla Firefox, Mozilla Thunderbird, Android, Firefox OS dan sekarang Flutter. Flutter berjalan menggunakan Dart Virtual Machine (VM) di sistem operasi Windows, Linux, dan macOS. Dart VM menggunakan kompilasi kode just-in-time (JIT) yang menyediakan fitur hot-reload untuk menghemat waktu pengembangan. Flutter API menggabungkan beberapa widget sesuai dengan kebutuhan pada aplikasi. Konsep widget tree pada dasarnya adalah implementasi widget yang di dalamnya terdapat widget lain yang mewakili komponen antarmuka. Widget bisa stateless atau stateful dan perbedaan dari keduanya sesuai dengan status widget itu sendiri. Hal tersebut berguna untuk membantu mengelola status aplikasi.

### Arsitektur Flutter
Selain dari konsep inti yang dibahas pada sub bab sebelumnya, Flutter mempunyai arsitektur dasar yang nantinya dapat di terapkan pada aplikasi dan mengelola statusnya dengan mudah. Arsitektur yang digunakan pada Flutter disebut Business Logic Component (BLOC). Pada dasarnya, hall ini melalui pendekatan ketika terjadinya suatu event dan menghandle perubahan state pada aplikasi. BLOC merupakan pendekatan yang baik untuk memisahkan logika bisnis dari antarmuka. Ide intinya yang digunakan pada arsitektur BLOC adalah simplicity, scalability, dan testability, dan semua tujuan ini pasti dicapai dalam arsitektur BLOC.

### Helloo World Pada Flutter
Pada pengenalan Flutter kali ini, kita akan membuat Hello World sebagai permulaan ketika menggunakan Flutter.
Contoh kode hello world pada flutter yang ditulis dengan nama kode main.dart
```dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Root aplikasi
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello World",
      home: const MyHomePage(
        title: "Flutter Hello World Page",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text(
          'Hello World',
        ),
      ),
    );
  }
}
```

## MODUL 3 - PENGENALAN DART

### Pengenalan Dart
Untuk belajar flutter, tidak perlu terlalu fasih untuk mempelajari bahasa dart. Terdapat fundamental yang perlu dipelajari seperti variable, statement control, looping, array, fungsi, dsb. Karakteristik bahasa dart mirip dengan bahasa C ataupun Java. Wajib menggunakan titik koma diakhir codingan

### Variable
Untuk penggunaan variable di dart, terdapat beberapa cara, yaitu dengan var, type annotation dan multiple variable.
```dart
var variableName;
var name = "Nizal";
String? nama;
String namaLengkap = "M Nizal";
int a, b, c;
int x = 1, y = 2, z = 3;
```
Variable primitive yang tersedia di dart : integer, double, string, boolean

### Statement Control
Terdapat beberapa cara untuk mendeklarasikan statement control, yaitu if, if else, if else if, switch case.

1. IF Statement
```dart
int nilai = 75;
  if (nilai > 70) {
    print("Lulus (IF)");
  }
```
2. IF ELSE Statement
```dart
  if (nilai >= 60) {
    print("Lulus (IF ELSE)");
  } else {
    print("Tidak Lulus (IF ELSE)");
  }
```
3. IF ELSE IF Statement
```dart
  if (nilai >= 85) {
    print("Grade A");
  } else if (nilai >= 75) {
    print("Grade B");
  } else if (nilai >= 65) {
    print("Grade C");
  } else {
    print("Grade D");
  }
```
4. SWITCH CASE Statement
```dart
  int pilihan = 2;
  switch (pilihan) {
    case 1:
      print("Menu 1 dipilih");
      break;
    case 2:
      print("Menu 2 dipilih");
      break;
    default:
      print("Menu tidak tersedia");
      break;
  }
```

### Looping
Secara umum, terdapat dua cara untuk melakukan looping di dart, yaitu menggunakan for loop dan while loop

1. For Loops <br>
Gunakan for loop saat kondisinya tau persis seberapa banyak looping akan dilakukan, contohnya melakukan perulangan sebanyak 10 kali dengan iterasi sebanyak 1 tingkat atau 1 kali.
```dart
  print("Perulangan FOR:");
  for (int i = 1; i <= 5; i++) {
    print("Angka ke-$i");
  }
```
2. While Loops <br>
Gunakan while loop saat kondisinya tidak tahu kapan perulangan akan berhenti, contohnya sediakan input angka hingga user menginput tanda "-".
```dart
  print("\nPerulangan WHILE:");
  int j = 1;
  while (j <= 5) {
    print("Angka ke-$j");
    j++;
  }
```

### List
Secara umum, kumpulan banyak data dalam satu variable disibut array. Tetapi beberapa bahasa pemrograman menyebutnya dengan list, termasuk bahasa dart ini. List memiliki 2 tipe, yaitu Fixed Length List dan Growable List
1. Fixed Length List <br>
Dari namanya bisa diketahui bahwa tipe list ini memiliki panjang index yang tetap dan tidak dapat bertambah banyak.
```dart
  List<int> newList = List.filled(3, 0);
  newList[0] = 12;
  newList[1] = 13;
  newList[2] = 11;
  print("Fixed List: $newList");
```
2. Growable List <br>
Gunakan growable list apabila memiliki banyak object yang tidak menentu atau banyaknya object yang terus bertambah.
```dart
  List<int> dynamicList = [];
  dynamicList.add(12);
  dynamicList.add(13);
  dynamicList.add(11);
  print("Dynamic List: $dynamicList");
```

### Fungsi
Pada bahasa pemrograman yang mendukung Object Oriented Programming, fungsi atau prosedur memilki peranan yang sangat penting. Untuk menghasilkan kualitas kode yang sangat baik, programmer bisa menggunakan beberapa prinsip pemrograman yang umum digunakan seperti SOLID, KISS, YAGNI, dsb. Semua prinsip tersebut menjunjung tinggi separation of concern yang artinya setiap kodingan memiliki tanggung jawabnya sendiri dan mengurangi sebanyak mungkin boilerplate code

1. Mendefinisikan Fungsi
```dart
// mendefinisikan fungsi
int factorial(int number) {
  if (number <= 0) {
    return 1;
  } else {
    return number * factorial(number - 1);
  }
}
```
2. Memanggil Fungsi
```dart
// memanggil fungsi
void main() {
  print(factorial(6));
}
```
3. Mengembalikan Nilai <br>
Tambahkan return apabila anda mendefinisikan sebuah fungsi, contohnya ada pada codingan dibawah yang bisa mengembalikan nilai faktorial dari angka yang sudah ditentukan.
```dart
// mengembalikan nilai
int factorialReturn(int number) {
  if (number <= 0) {
    return 1;
  } else {
    return number * factorialReturn(number - 1);
  }
}
```
4. Menambahkan Parameter <br>
Fungsi memiliki scope yang terbatas, tentunya fungsi butuh input dari luar agar program didalamnya bisa memproses tugasnya.
```dart
// menambahkan parameter
int factorialWithParameter(int number) {
  if (number <= 0) {
    return 1;
  } else {
    return number * factorialWithParameter(number - 1);
  }
}
```