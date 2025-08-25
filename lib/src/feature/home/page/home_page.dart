import 'package:flutter/material.dart';
import 'package:kingsman_app/src/feature/designer/page/construkt_d_page.dart';
import 'package:kingsman_app/src/feature/extension/clothing_item.dart';
import 'package:kingsman_app/src/feature/home/page/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = "";
  List<ClothingItem> filteredProducts = testProducts;

  void updateSearch(String value) {
    setState(() {
      query = value;
      filteredProducts =
          testProducts
              .where(
                (item) =>
                    item.name.toLowerCase().contains(query.toLowerCase()) ||
                    item.description.toLowerCase().contains(
                      query.toLowerCase(),
                    ),
              )
              .toList();
    });
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
                      favor: filteredProducts[index].isFavorite,
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

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.stars,
    required this.money,
    required this.favor,
    required this.iindex,
    required this.i,
    required this.catigori,
  });
  final int iindex;
  final String imagePath;
  final String title;
  final double stars;
  final String money;
  final String catigori;
  final bool favor;
  final bool i;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,

      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (widget.i) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => ConstruktDPage(
                        a: ClothingItem(
                          name: widget.title,
                          price: widget.money,
                          rating: widget.stars,
                          description: "",
                          catigori: widget.catigori,
                          image: widget.imagePath,
                        ),
                      ),
                ),
              );
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductPage(index: widget.iindex),
                ),
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // верхняя часть с картинкой и иконкой "избранное"
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.asset(
                      widget.imagePath,
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          testProducts[widget.iindex].isFavorite =
                              !testProducts[widget.iindex].isFavorite;
                          setState(() {});
                        },
                        child: Icon(
                          Icons.favorite_border,
                          color:
                              testProducts[widget.iindex].isFavorite
                                  ? const Color.fromARGB(255, 226, 70, 70)
                                  : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(color: Color(0xFF1E254A)),
                      child: Text(
                        widget.money,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              // название товара
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E254A),
                    fontFamily: 'Montserrat',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              const SizedBox(height: 4),

              // рейтинг
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Row(
                  children: [
                    ...List.generate(5, (index) {
                      return Icon(
                        index < widget.stars ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 18,
                      );
                    }),
                    const SizedBox(width: 6),
                    Text(
                      widget.stars.toString(),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
