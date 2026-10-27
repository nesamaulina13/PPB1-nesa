void mahasiswa({
  String nama = "Tanpa Nama",
  String status = "Aktif",
}) {
  print("Nama: $nama");
  print("Status: $status");
}

void main() {
  mahasiswa(nama: "Nesa");
  mahasiswa(nama: "Mikasa", status: "Cuti");
}