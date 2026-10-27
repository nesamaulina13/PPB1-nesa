enum Hari { senin, selasa, rabu, kamis, jumat }

void main() {
  print(Hari.values);
  print(Hari.values.length);
  print(Hari.values[2]);
  print(Hari.values[2].name);

  print("=" * 50);
  for (var hari in Hari.values) {
    print(hari.name);
  }
}
