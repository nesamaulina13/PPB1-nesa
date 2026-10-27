void main() {
  List<String> nama = ['Nesa', 'Mike', 'Will', 'Lucas', 'Dustin'];

  nama.add('Steve');
  nama.remove('Will');
  nama.sort((a, b) => a.compareTo(b));

  print(nama);
  print('Jumlah: ${nama.length}');
}
