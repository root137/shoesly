enum Routes {
  productListPage('/product_list', 'productList'),

  productDetailPage('/product_detail', 'productDetail'),
  reviewPage('/review', 'review'),
  cartPage('/cart', 'cart'),
  orderPage('/order', 'order'),
  filterPage('/filter_page', 'filterPage'),
  ;

  final String path;
  final String name;

  const Routes(
    this.path,
    this.name,
  );
}
