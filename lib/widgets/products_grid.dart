import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
 
  final bool showFavorite;

  ProductsGrid(this.showFavorite);

  @override
  Widget build(BuildContext context) {
    
    final productsData = Provider.of<Products>(context);
    final products = showFavorite ? productsData.favoriteItems : productsData.items;
    
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, idx) => ChangeNotifierProvider.value(
        value: products[idx],
        builder: (ctx, _) =>ProductItem(
          // products[idx].id,
          // products[idx].title,
          // products[idx].imageUrl,
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 3 / 2,
      ),
    );
  }

}
