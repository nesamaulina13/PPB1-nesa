void main() {
  List<String> krs = ['Basis Data', 'Statistika'];
  print(krs);
  //tambah
  krs.add('PPB 1');
  print(krs);

  //remove
  krs.remove('Statistika');
  print(krs);

  // containst
  print(krs.contains('Basis Data'));
  //length
  print(krs.length);

  krs.clear();
  print(krs);
  print(krs.isEmpty);
}