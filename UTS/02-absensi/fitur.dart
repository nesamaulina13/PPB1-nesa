import 'data.dart';
import 'input.dart';

// ============================================================
// Fungsi bantu
// ============================================================

/// Mencari mahasiswa berdasarkan NIM. Mengembalikan null jika tidak ada.
Map<String, dynamic>? cariByNim(String nim) {
  for (final mhs in daftarMahasiswa) {
    if (mhs['nim'] == nim) return mhs;
  }
  return null;
}

/// Mencetak satu baris data mahasiswa.
void cetakMahasiswa(Map<String, dynamic> mhs) {
  print('${mhs['nim']} | ${mhs['nama']}');
}

/// Meminta pengguna memilih status kehadiran.
StatusHadir bacaStatus(String label) {
  final pilihan = bacaInt(
    '$label (1=hadir, 2=izin, 3=sakit, 4=alpa)',
    min: 1,
    max: 4,
  );
  return switch (pilihan) {
    1 => StatusHadir.hadir,
    2 => StatusHadir.izin,
    3 => StatusHadir.sakit,
    _ => StatusHadir.alpa,
  };
}

// ============================================================
// Fitur yang sudah jadi
// ============================================================

/// Menu 1: menampilkan semua mahasiswa.
void tampilkanDaftar() {
  print('\n=== Daftar Mahasiswa ===');
  if (daftarMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa.');
    return;
  }
  for (final mhs in daftarMahasiswa) {
    cetakMahasiswa(mhs);
  }
}

/// Menu 2: mencatat absensi untuk pertemuan berikutnya.
void catatAbsensi() {
  final nomor = absensi.length + 1;
  print('\n=== Catat Absensi Pertemuan $nomor ===');
  final Map<String, StatusHadir> data = {};
  for (final mhs in daftarMahasiswa) {
    data[mhs['nim'] as String] = bacaStatus('Status ${mhs['nama']}');
  }
  absensi[nomor] = data;
  print('Absensi pertemuan $nomor tersimpan.');
}

/// Menu 3: menampilkan absensi pada satu pertemuan.
void tampilkanAbsensiPertemuan() {
  print('\n=== Absensi per Pertemuan ===');
  if (absensi.isEmpty) {
    print('Belum ada absensi.');
    return;
  }
  final nomor = bacaInt('Nomor pertemuan', min: 1, max: absensi.length);
  final data = absensi[nomor]!;
  print('Pertemuan $nomor:');
  for (final mhs in daftarMahasiswa) {
    final status = data[mhs['nim']];
    print('${mhs['nim']} | ${mhs['nama']} | ${status?.name ?? '-'}');
  }
}

// ============================================================
// Fitur pilihan (pilih minimal 3, lihat README.md)
// ============================================================

/// Menu 4 [Mudah]: menambah mahasiswa baru.
void tambahMahasiswa() {
  print('\n=== Tambah Mahasiswa ===');

  final nim = bacaTeks('NIM');

  if (cariByNim(nim) != null) {
    print('NIM $nim sudah terdaftar.');
    return;
  }

  final nama = bacaTeks('Nama');

  daftarMahasiswa.add({'nim': nim, 'nama': nama});

  print('Mahasiswa $nama berhasil ditambahkan.');
}

/// Menu 5 [Mudah]: mencari mahasiswa berdasarkan sebagian nama.
void cariMahasiswa() {
  print('\n=== Cari Mahasiswa ===');

  final kataKunci = bacaTeks('Nama').toLowerCase();
  var ditemukan = false;

  for (final mhs in daftarMahasiswa) {
    final nama = (mhs['nama'] as String).toLowerCase();

    if (nama.contains(kataKunci)) {
      cetakMahasiswa(mhs);
      ditemukan = true;
    }
  }

  if (!ditemukan) {
    print('Mahasiswa tidak ditemukan.');
  }
}

/// Menu 6 [Sedang]: mengubah status absensi seorang mahasiswa.
void ubahStatus() {
  print('\n=== Ubah Status Absensi ===');

  if (absensi.isEmpty) {
    print('Belum ada data absensi.');
    return;
  }

  final nomor = bacaInt('Nomor pertemuan', min: 1, max: absensi.length);

  final nim = bacaTeks('NIM');
  final mhs = cariByNim(nim);

  if (mhs == null) {
    print('Mahasiswa dengan NIM $nim tidak ditemukan.');
    return;
  }

  final status = bacaStatus('Status baru');

  absensi[nomor]![nim] = status;

  print(
    'Status ${mhs['nama']} pada pertemuan $nomor '
    'diubah menjadi ${status.name}.',
  );
}

/// Menu 7 [Sedang]: menampilkan jumlah setiap status per mahasiswa.
void tampilkanRekap() {
  print('\n=== Rekap Absensi (${absensi.length} pertemuan) ===');

  for (final mhs in daftarMahasiswa) {
    final nim = mhs['nim'] as String;

    var hadir = 0;
    var izin = 0;
    var sakit = 0;
    var alpa = 0;

    for (final data in absensi.values) {
      switch (data[nim]) {
        case StatusHadir.hadir:
          hadir++;
        case StatusHadir.izin:
          izin++;
        case StatusHadir.sakit:
          sakit++;
        case StatusHadir.alpa:
          alpa++;
        case null:
          break;
      }
    }

    print(
      "${mhs['nama']} | hadir $hadir | izin $izin "
      "| sakit $sakit | alpa $alpa",
    );
  }
}

/// Menu 8 [Sulit]: menampilkan persentase kehadiran setiap mahasiswa.
void tampilkanPersentase() {
  print('\n=== Persentase Kehadiran ===');

  final totalPertemuan = absensi.length;

  if (totalPertemuan == 0) {
    print('Belum ada data absensi.');
    return;
  }

  for (final mhs in daftarMahasiswa) {
    final nim = mhs['nim'] as String;
    var jumlahHadir = 0;

    for (final data in absensi.values) {
      if (data[nim] == StatusHadir.hadir) {
        jumlahHadir++;
      }
    }

    final persentase = jumlahHadir / totalPertemuan * 100;

    print(
      "${mhs['nama']} | $jumlahHadir/$totalPertemuan pertemuan "
      "| ${persentase.toStringAsFixed(1)}%",
    );
  }
}

/// Menu 9 [Sulit]: menampilkan mahasiswa dengan kehadiran di bawah batas.
void tampilkanDiBawahBatas() {
  print('\n=== Kehadiran di Bawah ${batasKehadiran.toStringAsFixed(0)}% ===');

  final totalPertemuan = absensi.length;

  if (totalPertemuan == 0) {
    print('Belum ada data absensi.');
    return;
  }

  var ditemukan = false;

  for (final mhs in daftarMahasiswa) {
    final nim = mhs['nim'] as String;
    var jumlahHadir = 0;

    for (final data in absensi.values) {
      if (data[nim] == StatusHadir.hadir) {
        jumlahHadir++;
      }
    }

    final persentase = jumlahHadir / totalPertemuan * 100;

    if (persentase < batasKehadiran) {
      print("${mhs['nama']} | ${persentase.toStringAsFixed(1)}%");
      ditemukan = true;
    }
  }

  if (!ditemukan) {
    print('Tidak ada mahasiswa di bawah batas kehadiran.');
  }
}
