void main() {
  int nilai = 75;
  if (nilai > 70) {
    print("Lulus (IF)");
  }

  if (nilai >= 60) {
    print("Lulus (IF ELSE)");
  } else {
    print("Tidak Lulus (IF ELSE)");
  }

  if (nilai >= 85) {
    print("Grade A");
  } else if (nilai >= 75) {
    print("Grade B");
  } else if (nilai >= 65) {
    print("Grade C");
  } else {
    print("Grade D");
  }

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
}