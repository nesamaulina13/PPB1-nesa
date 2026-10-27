void main() {
  String teksNilai = '85';
  String teksIpk = '3.45';

  // konversi
  int nilai = int.parse(teksNilai); // int
  double ipk = double.parse(teksIpk); // double

  print(nilai + 5);
  print(ipk);
  print(nilai.toString() + ' poin');
  
  double rataRata = 256 / 3;
  print(rataRata);
  print(rataRata.toStringAsFixed(2));
}