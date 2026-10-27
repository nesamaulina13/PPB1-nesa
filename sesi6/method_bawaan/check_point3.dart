void main() {
  String nama = ' nesa maulina ';
  String rapi = nama.trim();

  print('[$nama]');
  print('[$rapi]');
  print(rapi.toUpperCase());
  print('NESA MAULINA'.toLowerCase());
  print(rapi.contains('maulina'));
  print(''.isEmpty);
  print(rapi.isNotEmpty);
}