import 'package:flutter/material.dart';
import 'package:kingsman_app/src/feature/extension/clothing_item.dart';
import 'package:kingsman_app/src/feature/home/page/home_page.dart';

class ProdPage extends StatefulWidget {
  const ProdPage({super.key, required this.tip});

  final String tip;

  @override
  State<ProdPage> createState() => _ProdPageState();
}

class _ProdPageState extends State<ProdPage> {
  String query = "";
  List<ClothingItem> filteredProducts = testProducts;

  void updateSearch(String value) {
    setState(() {
      print(widget.tip);
      query = value;
      filteredProducts =
          testProducts
              .where(
                (item) =>
                    item.catigori.toLowerCase().contains(
                      widget.tip,
                    ) && // ✅ только рубашки
                    (item.name.toLowerCase().contains(query.toLowerCase()) ||
                        item.description.toLowerCase().contains(
                          query.toLowerCase(),
                        )),
              )
              .toList();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu_rounded),
                Image.asset("asset/image/image.png", height: 18),
                Icon(Icons.shopping_bag_outlined),
              ],
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
            // Container(
            //   height: 64,
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //   clipBehavior: Clip.antiAlias,
            //   decoration: ShapeDecoration(
            //     shape: RoundedRectangleBorder(
            //       side: BorderSide(width: 1, color: const Color(0xFFDAD1D6)),
            //     ),
            //   ),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Icon(Icons.search_rounded),
            //       Text("Поиск"),
            //       Container(
            //         height: 64,
            //         width: 64,
            //         color: Color(0xFF1E254A),
            //         child: Icon(Icons.assistant),
            //       ),
            //     ],
            //   ),
            // ),
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
                      i: true,
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
