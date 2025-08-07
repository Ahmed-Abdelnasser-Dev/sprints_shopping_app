import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../models/product.dart';
import '../widgets/featured_products.dart';
import '../widgets/hot_offers.dart';
import '../widgets/product_card.dart';
import '../l10n/locale_keys.dart';
import '../models/user.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen({required this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Wireless Headphones',
      price: 99.99,
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
      description: 'High-quality wireless headphones with noise cancellation',
    ),
    Product(
      id: '2',
      name: 'Smart Watch',
      price: 199.99,
      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
      description: 'Latest smart watch with health monitoring features',
    ),
    Product(
      id: '3',
      name: 'Bluetooth Speaker',
      price: 79.99,
      imageUrl: 'https://images.unsplash.com/photo-1572569511254-d8f925fe2cbb',
      description: 'Portable speaker with 20 hours battery life',
    ),
    Product(
      id: '4',
      name: 'Gaming Mouse',
      price: 59.99,
      imageUrl: 'https://images.unsplash.com/photo-1527814050087-3793815479db',
      description: 'Precision gaming mouse with customizable buttons',
    ),
    Product(
      id: '5',
      name: 'External SSD',
      price: 129.99,
      imageUrl: 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45',
      description: '1TB external SSD with fast transfer speeds',
    ),
  ];

  final List<Product> _hotOffers = [
    Product(
      id: '6',
      name: 'Laptop Bundle',
      price: 899.99,
      imageUrl: 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853',
      description: 'Laptop with mouse and bag included - limited time offer',
    ),
    Product(
      id: '7',
      name: 'Phone Case Pack',
      price: 29.99,
      imageUrl: 'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb',
      description: '3 premium phone cases for the price of 2',
    ),
    Product(
      id: '8',
      name: 'Camera Bundle',
      price: 599.99,
      imageUrl: 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32',
      description: 'DSLR camera with lens kit - 20% off',
    ),
    Product(
      id: '9',
      name: 'Wireless Earbuds',
      price: 79.99,
      imageUrl: 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df',
      description: 'Buy one get one free on all earbuds',
    ),
    Product(
      id: '10',
      name: 'Smart Home Kit',
      price: 199.99,
      imageUrl: 'https://images.unsplash.com/photo-1558002038-1055907df827',
      description: 'Smart bulb, plug and hub bundle',
    ),
  ];

  final List<Product> _cartItems = [];

  void _addToCart(Product product) {
    setState(() {
      _cartItems.add(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} ${LocaleKeys.added_to_cart.tr()}'),
        action: SnackBarAction(
          label: LocaleKeys.undo.tr(),
          onPressed: () {
            setState(() {
              _cartItems.remove(product);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.our_products.tr()),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(cartItems: _cartItems),
                  ),
                ),
              ),
              if (_cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.tealAccent,
                    child: Text(
                      '${_cartItems.length}',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              final currentLocale = context.locale;
              final newLocale = currentLocale.languageCode == 'ar'
                  ? Locale('en')
                  : Locale('ar');
              context.setLocale(newLocale);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeaturedProducts(
              products: _products.sublist(0, 3),
              onAddToCart: _addToCart,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                LocaleKeys.all_products.tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: _products.length,
              itemBuilder: (context, index) => ProductCard(
                product: _products[index],
                onAddToCart: _addToCart,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                LocaleKeys.hot_offers.tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            HotOffers(offers: _hotOffers, onAddToCart: _addToCart),
          ],
        ),
      ),
    );
  }
}
