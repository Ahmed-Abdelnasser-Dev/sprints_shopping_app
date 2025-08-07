import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../models/product.dart';
import '../l10n/locale_keys.dart';
import '../theme/app_theme.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;

  CartScreen({required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final total =
        widget.cartItems.fold<double>(0.0, (sum, item) => sum + (item.price));

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.cart_title.tr()),
        actions: [
          if (widget.cartItems.isNotEmpty)
            IconButton(
              icon: Icon(Icons.delete, color: AppTheme.error),
              onPressed: () => _clearCart(),
            ),
        ],
      ),
      body: widget.cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart,
                      size: 64, color: AppTheme.secondary),
                  SizedBox(height: 16),
                  Text(
                    LocaleKeys.cart_empty.tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return Dismissible(
                        key: Key(item.id),
                        background: Container(color: AppTheme.error),
                        onDismissed: (direction) {
                          setState(() {
                            widget.cartItems.removeAt(index);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  '${item.name} ${LocaleKeys.removed_from_cart.tr()}'),
                              backgroundColor: AppTheme.surface,
                            ),
                          );
                        },
                        child: ListTile(
                          leading: Image.network(item.imageUrl, width: 50),
                          title: Text(item.name,
                              style: Theme.of(context).textTheme.bodyLarge),
                          subtitle: Text(
                            '\$${item.price.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.remove_circle_outline,
                                color: AppTheme.error),
                            onPressed: () {
                              setState(() {
                                widget.cartItems.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: AppTheme.secondary)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.total.tr(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppTheme.accent,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () => _checkout(),
                    child: Text(LocaleKeys.checkout.tr()),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void _clearCart() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.clear_cart.tr()),
        content: Text(LocaleKeys.clear_cart_confirmation.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(LocaleKeys.cancel.tr()),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                widget.cartItems.clear();
              });
              Navigator.pop(context);
            },
            child: Text(LocaleKeys.clear.tr(),
                style: TextStyle(color: AppTheme.error)),
          ),
        ],
      ),
    );
  }

  void _checkout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.order_confirmation.tr()),
        content: Text(LocaleKeys.thank_you_message.tr()),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                widget.cartItems.clear();
              });
              Navigator.pop(context);
            },
            child: Text(LocaleKeys.ok.tr()),
          ),
        ],
      ),
    );
  }
}
