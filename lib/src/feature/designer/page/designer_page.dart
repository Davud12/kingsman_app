import 'package:flutter/material.dart';
import 'package:kingsman_app/src/feature/designer/page/construkt_d_page.dart';
import 'package:kingsman_app/src/feature/designer/page/designer_product.dart';
import 'package:kingsman_app/src/feature/extension/clothing_item.dart';

class DesignerPage extends StatefulWidget {
  const DesignerPage({super.key});

  @override
  State<DesignerPage> createState() => _DesignerPageState();
}

class _DesignerPageState extends State<DesignerPage> {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

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
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 64,
              // padding: const EdgeInsets.symmetric(horizontal: 86, vertical: 19),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.06, -0.49),
                  end: Alignment(0.18, 2.44),
                  colors: [const Color(0xFF1E254A), const Color(0xFF4758B0)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (context) => ConstruktDPage(
                              a: ClothingItem(
                                name: "",
                                price: "",
                                rating: 4.7,
                                description: "",
                                catigori: 'null',
                                image: '',
                              ),
                            ),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      'Создать свой образ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        height: 1.30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
              child: ListView.builder(
                itemCount: testObra.length,
                itemBuilder:
                    (context, index) => FavouritesCartWidges(
                      imagePath: testObra[index].image,
                      title: testObra[index].name,
                      stars: testObra[index].rating,
                      money: testObra[index].price,
                      favor: false,
                      product: testObra[index].product,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavouritesCartWidges extends StatelessWidget {
  const FavouritesCartWidges({
    super.key,
    required this.imagePath,
    required this.title,
    required this.stars,
    required this.money,
    required this.favor,
    required this.product,
  });
  final List<ClothingItem> product;
  final String imagePath;
  final String title;
  final double stars;
  final String money;
  final bool favor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190,
      height: 290,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DesignerProduct(product: product),
              ),
            );
          },
          child: Row(
            //    crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.asset(
                      imagePath,
                      height: 290,
                      //width: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(Icons.favorite_border, color: Colors.black87),
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
                        money,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: SizedBox(
                      width: 160,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: const Color(0xFF1E254A),
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),

                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),

                  // рейтинг
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 6,
                    ),
                    child: Row(
                      children: [
                        ...List.generate(5, (index) {
                          return Icon(
                            index < stars ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                            size: 18,
                          );
                        }),
                        const SizedBox(width: 6),
                        Text(
                          stars.toString(),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    child: Text(
                      'Образ был подобран lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ornare risus dui, et vulputate magna convallis in. Aenean lobortis hendrerit odio eu viverra. Sed dui. ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 34,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(color: const Color(0xFF1E254A)),
                    child: Center(
                      child: Text(
                        'Добавить в корзину',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
