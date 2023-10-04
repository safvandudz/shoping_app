

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/Provider.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<Providerr>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        actions: [
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                  size: 40,
                )
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: p.img.length,
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
                          p.img[index],
                          p.price[index],
                          p.name[index],
                        );
                      },
                      icon: p.symbol(p.name[index])
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : Icon(Icons.favorite_border_outlined),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(p.img[index]),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        p.price[index],
                        style: TextStyle(fontSize: 20, color: Colors.orange),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        p.name[index],
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
