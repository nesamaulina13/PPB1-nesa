void main() {
  List<String> daftarNama = ['Nesa', 'Harry', 'Hermione', 'Ron'];
  String kataKunci = 'NE';

  for (var nama in daftarNama) {
    if (nama.toLowerCase().contains(kataKunci.toLowerCase())) {
      print(nama);
    }
  }
}
