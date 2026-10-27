void main() {
  // List<String> mahasiswa = ["Andi", "Budi", "Citra"];

  // print(mahasiswa);

  var mahasiswa = ["Budi", "Ani", "Citra", "Nesa"];

  print("Jumlah mahasiswa: ${mahasiswa.length}");
  print("Semua mahasiswa: $mahasiswa");
  print("Mahasiswa pertama: ${mahasiswa[0]}");
  
  mahasiswa[1] = "Andi"; // update data
  print(mahasiswa);
}
