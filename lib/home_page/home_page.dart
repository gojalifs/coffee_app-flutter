import 'package:flutter/material.dart';
import 'package:ngops/common/function.dart';
import 'package:ngops/detail_page/detail_page.dart';
import 'package:ngops/model/menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ngops - Ngopi Murah'),
      ),
      body: GridView.builder(
        itemCount: _beverages.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          var beverage = _beverages[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(menuModel: beverage),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.asset(
                        beverage.assetsImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      beverage.menuName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      Utils.toRupiah(beverage.price),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rate_rounded,
                          color: Colors.amber,
                          size: 18,
                        ),
                        Text(
                          '${beverage.rating}',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

var _beverages = [
  MenuModel(
    assetsImage: 'assets/images/caramelmacchiato.png',
    menuName: 'Caramel Macchiato',
    price: 57000,
    description:
        'Espresso combined with vanilla-flavoured syrup, milk and caramel sauce over ice. Chilled for a classic summer’s day.'
        'To our signature espresso we add a creamy mix of vanilla syrup and'
        'cold milk poured over ice; it’s then topped with our proprietary buttery caramel sauce. Sweet! ',
    rating: 4.5,
    stock: 10,
  ),
  MenuModel(
    assetsImage: 'assets/images/caffeamericano.png',
    menuName: 'Caffe Americano',
    price: 34000,
    description: 'HOT: Rich, full-bodied espresso with hot water.',
    rating: 4,
    stock: 9,
  ),
  MenuModel(
    assetsImage: 'assets/images/cappuccino.png',
    menuName: 'Cappuccino',
    price: 44000,
    description:
        'Espresso with steamed milk, topped with a deep layer of foam.',
    rating: 4.5,
    stock: 15,
  ),
  MenuModel(
    assetsImage: 'assets/images/caffe_latte.png',
    menuName: 'Caffe Latte',
    price: 44000,
    description:
        'Rich, full-bodied espresso in steamed milk, lightly topped with foam.'
        'A caffè latte is simply a shot or two of bold, tasty espresso with fresh, sweet steamed milk over it.',
    rating: 5,
    stock: 13,
  ),
  MenuModel(
    assetsImage: 'assets/images/cafe_mocha.png',
    menuName: 'Cafe Mocha',
    price: 53000,
    description:
        'Espresso with bittersweet mocha sauce and steamed milk, topped with sweetened whipped cream. Delightful.',
    rating: 4,
    stock: 7,
  ),
  MenuModel(
    assetsImage: 'assets/images/espressomacchiato.png',
    menuName: 'Espresso Macchiato',
    price: 40000,
    description:
        'Sometimes a touch is just enough. And so it is with the slight dab'
        ' of foam we set atop our signature espresso in this classic European-style beverage.',
    rating: 4.5,
    stock: 5,
  ),
  MenuModel(
    assetsImage: 'assets/images/asian_dolce_latte.png',
    menuName: 'Asian Dolce Latte',
    price: 53000,
    description: 'Double-shots of the premium,'
        ' dark-roasted Starbucks Espresso Roast, combine with the uniquely developed dolce sauce.',
    rating: 4,
    stock: 1,
  ),
  MenuModel(
    assetsImage: 'assets/images/espresso_frappuccino.png',
    menuName: 'Espresso Frappuccino',
    price: 48000,
    description: 'Coffee is combined with a shot of espresso and milk, '
        'then blended with ice to give you a nice little jolt and lots of sipping joy.',
    rating: 4.5,
    stock: 4,
  ),
  MenuModel(
    assetsImage: 'assets/images/caramel_frappuccino.png',
    menuName: "Caramel Frappuccino",
    price: 48000,
    description:
        'Buttery caramel syrup meets coffee, milk and ice for a rendezvous '
        'in the blender. Then whipped cream and caramel sauce layer the love on top.',
    rating: 4.5,
    stock: 3,
  ),
  MenuModel(
    assetsImage: 'assets/images/caramel_java_chip_frappuccino.png',
    menuName: 'Caramel Java Chip Frappuccino',
    price: 48000,
    description: 'Java Chip Frappuccino® with a swirl of caramel sauce on top.',
    rating: 4,
    stock: 7,
  ),
  MenuModel(
    assetsImage: 'assets/images/mocha_frappuccino.png',
    menuName: 'Mocha Frappuccino',
    price: 48000,
    description:
        'Mocha sauce, Frappuccino® roast coffee, milk and ice all come '
        'together for a mocha flavor that\'ll leave you wanting more.',
    rating: 4.5,
    stock: 9,
  ),
  MenuModel(
    assetsImage: 'assets/images/coffee_frappuccino.png',
    menuName: 'Coffee Frappuccino',
    price: 39000,
    description:
        'nyong\'s® coffee is blended with nonfat milk and ice for a sip on the light side.',
    rating: 5,
    stock: 6,
  ),
];
