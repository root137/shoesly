enum Routes {
  productList('/product_list', 'productList');

  final String path;
  final String name;

  const Routes(
    this.path,
    this.name,
  );
}
