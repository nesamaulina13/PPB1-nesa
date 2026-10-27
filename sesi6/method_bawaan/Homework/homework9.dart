void main() {
  Set<String> hadir = {'Nesa', 'Hinata'};

  hadir.add('Kageyama');
  hadir.add('Nesa');
  print(hadir);

  hadir.remove('Hinata');
  print(hadir);

  print(hadir.contains('Hinata'));
  print(hadir.length);
}
