void main() {
  List<Map<String, dynamic>> mahasiswa = [
    {'nama': 'Nesa', 'nilai': 90},
    {'nama': 'Enola', 'nilai': 95},
    {'nama': 'Tewkesburry', 'nilai': 85},
  ];

  mahasiswa.sort((a, b) => (b['nilai'] as int).compareTo(a['nilai'] as int));

  for (var mhs in mahasiswa) {
    print('${mhs['nama']}:${mhs['nilai']}');
  }
}