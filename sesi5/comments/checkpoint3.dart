/// class product
  class Product {
  String nama;
  int harga;

  Product(this.nama, this.harga);

  /// method menampilkan product
  void tampilkanProduct() {
    print("Product: $nama");
    print("Harga: Rp$harga");
  }
}
void main() {
  var product = Product("Sate", 15000);
  product.tampilkanProduct();
}