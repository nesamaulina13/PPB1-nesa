void main() {
  final nilai = [80, 75, 0, 90, 85];
  for (var item in nilai) {
    if (item == 0) {
      continue;
    }

    print("Nilai Mahasiswa: ${item * 2}");
  }
  
  print("Program selesai");
}
