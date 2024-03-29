import 'package:flutter/material.dart';
import 'package:ngops/cart_page/cart_page.dart';
import 'package:ngops/common/function.dart';

import 'package:ngops/model/menu.dart';

class DetailPage extends StatefulWidget {
  final MenuModel menuModel;

  const DetailPage({super.key, required this.menuModel});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var cartCount = 0;
  var quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
            child: Stack(
              children: [
                const Icon(
                  Icons.shopping_cart_rounded,
                  size: 36,
                ),
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.red,
                  ),
                  child: Text(
                    '$cartCount',
                    style: const TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ],
        title: Text(widget.menuModel.menuName),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        children: [
          Image.asset(
            widget.menuModel.assetsImage,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.menuModel.menuName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(Utils.toRupiah(widget.menuModel.price)),
          Row(
            children: [
              const Icon(
                Icons.star_rate_rounded,
                color: Colors.amber,
              ),
              Text('${widget.menuModel.rating}'),
            ],
          ),
          const Divider(),
          Text(widget.menuModel.description),
          const Divider(height: 16),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (quantity > 0) {
                        quantity--;
                      }
                    });
                  },
                  icon: const Icon(Icons.remove_circle_rounded),
                ),
                Text('$quantity'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  icon: const Icon(Icons.add_circle_rounded),
                ),
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.maybeOf(context)?.hideCurrentSnackBar();
                    setState(() {
                      cartCount = quantity;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added To Cart'),
                      ),
                    );
                  },
                  child: const Text('Add To Cart'),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
