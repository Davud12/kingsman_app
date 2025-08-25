import 'package:flutter/material.dart';
import 'package:kingsman_app/src/feature/extension/clothing_item.dart';
import 'package:kingsman_app/src/feature/home/page/home_page.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  String query = "";
  List<ClothingItem> filteredProducts = testProducts;

  void updateSearch(String value) {
    setState(() {
      query = value;
      filteredProducts =
          testProducts.where((item) {
            if (item.isFavorite == true) {
              return (item.name.toLowerCase().contains(query.toLowerCase()) ||
                  item.description.toLowerCase().contains(query.toLowerCase()));
            } else {
              return false;
            }
          }).toList();
    });
  }

  @override
  void initState() {
    updateSearch("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("asset/image/image.png", height: 24),
                  Icon(Icons.shopping_bag_outlined),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Поиск...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: updateSearch,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Популярное',
                  style: TextStyle(
                    color: const Color(0xFF1E254A),
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Больше',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0x991E254A),
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7, // контролирует высоту/ширину ячеек
                ),
                itemCount: filteredProducts.length,
                itemBuilder:
                    (context, index) => ProductCard(
                      imagePath: filteredProducts[index].image,
                      title: filteredProducts[index].name,
                      stars: filteredProducts[index].rating,
                      money: filteredProducts[index].price,
                      favor: false,
                      iindex: index,
                      i: false,
                      catigori: filteredProducts[index].catigori,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
