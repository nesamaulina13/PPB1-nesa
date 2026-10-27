void main() {
  Map<String, int> stok = {
    'Pulpen': 50, 
    'Buku': 3, 
    'Penghapus': 25,
    'Pensil': 12,
  };
  print(stok.keys);
  print(stok.values);
  print(stok.containsKey('Pensil'));

  stok.remove('buku');
  print(stok);

  int total = 0;
  for (var jumlah in stok.values) {
  total += jumlah;
}

  print('Total stok: $total');
}