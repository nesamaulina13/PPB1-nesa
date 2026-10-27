void biodata({String nama = "", int umur = 0,}) {
  print("Nama: $nama, Umur: $umur tahun");
}

void main() {
  biodata(nama: "Nesa", umur: 20);
  biodata(umur: 19, nama: "Neca");
}