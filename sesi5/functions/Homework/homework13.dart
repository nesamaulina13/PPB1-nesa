void main() {
  var angka = [1, 2, 3, 4];

  var hasil = angka.map((nilai) {
    return nilai * 2;
  }).toList();

  print(hasil);
}