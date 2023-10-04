


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Favorate.dart';
import 'Provider/Provider.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final p = Provider.of<Providerr>(context);

    List<String> img = [
      "assets/vecteezy_red-t-shirt_21095975_662.png",
      "assets/1.jpg",
      "assets/2.jpg",
      "assets/3.jpg",
      "assets/4.jpg",
      "assets/5.jpg",
    ];
    List<String> price = [
      "29.66",
      "63.25",
      "25.63",
      "29.66",
      "63.25",
      "25.63",
    ];
    List<String> name = [
      "Red T-Shirt 1",
      "Red T-Shirt 2",
      "Red T-Shirt 3",
      "Red T-Shirt 4",
      "Red T-Shirt 5",
      "Red T-Shirt 6",
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Favorite()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.favorite,
                color: Colors.black54,
                size: 40,
              ),
            ),
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.black54,
            size: 40,
          ),
          Icon(
            Icons.more_vert_rounded,
            color: Colors.black,
            size: 40,
          )
        ],
        title: Text(
          'Shop App',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: img.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.2),
          ),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      spreadRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        p.toggleFavorite(
                          img[index],
                          price[index],
                          name[index],
                        );
                      },
                      icon: p.symbol(name[index])
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : Icon(Icons.favorite_border_outlined),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(img[index]),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        price[index],
                        style: TextStyle(fontSize: 20, color: Colors.orange),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        name[index],
                        style: TextStyle(fontSize: 15, letterSpacing: 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: double.maxFinite,
                        height: 1,
                        color: Colors.black12,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_basket_rounded, color: Colors.orange),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            'Add to cart',
                            style: TextStyle(fontSize: 15, color: Colors.orange),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
