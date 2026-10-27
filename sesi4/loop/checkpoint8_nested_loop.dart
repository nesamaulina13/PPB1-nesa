void main() {
  final mahasiswa = <String, List<int>>{
    'Andi': [80, 85, 90],
    'Budi': [75, 70, 80],
    'Citra': [90, 95, 88],
  };

  // list: []
  // set: {}
  // map: key:value
  
  for (var data in mahasiswa.entries) {
    print("Mahasiswa: ${data.key}");
    for (var nilai in data.value){
      print("Nilai: $nilai");
    }
  }
}