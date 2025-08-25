import 'package:flutter/material.dart';
import 'package:kingsman_app/src/feature/app/page/app.dart';
import 'package:kingsman_app/src/feature/designer/page/configurator_page.dart';
import 'package:kingsman_app/src/feature/designer/page/designer_product.dart';
import 'package:kingsman_app/src/feature/designer/page/prod_page.dart';
import 'package:kingsman_app/src/feature/extension/clothing_item.dart';

class ConstruktDPage extends StatefulWidget {
  const ConstruktDPage({super.key, required this.a});
  final ClothingItem a;

  @override
  State<ConstruktDPage> createState() => _ConstruktDPageState();
}

class _ConstruktDPageState extends State<ConstruktDPage> {
  ConstrItem l = ConstrItem(
    price: '23 000р',
    i: 0,
    rating: 0,
    image: 'asset/image/GroupD.png',
    name: 'Мой стиль',
    product: [],
  );
  bool tt = false;
  @override
  void initState() {
    if (widget.a.catigori != 'null') {
      confProducts.add(widget.a);
    }
    super.initState();
    tt = confProducts.length == selectedWords.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
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
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => App()));
                  testObra.add(l);
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
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Image.asset("asset/image/image.png", height: 24),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Создание образа',
              style: TextStyle(
                color: const Color(0xFF1E254A),
                fontSize: 24,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                height: 1.08,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  l.name = value;
                },
                decoration: const InputDecoration(
                  hintText: "Введите название",
                  border: OutlineInputBorder(),
                ),
                //onChanged: updateSearch,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Опишите его",
                  border: OutlineInputBorder(),
                ),
                //onChanged: updateSearch,
              ),
            ),
            const SizedBox(height: 20),
            Icnat(
              icon: "asset/image/Vector-26.png",
              text: 'Верхняя одежда',
              tip: 'рубашка',
              index: 0,
            ),
            const SizedBox(height: 6),
            Icnat(
              icon: "asset/image/Pants.png",
              text: 'Низ',
              tip: 'брюки',
              index: 3,
            ),
            const SizedBox(height: 6),
            Icnat(
              icon: "asset/image/Vector.png",
              text: 'Обувь',
              tip: 'Обувь',
              index: 2,
            ),
            //  Icnat(icon:Icon(Icons.abc) , text: 'Аксесуары', tip: 'рубашка',),

            // список выбранных слов
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selectedWords.length,
                itemBuilder: (context, index) {
                  final word = selectedWords[index];

                  if (confProducts.length > index) {
                    return DesComponent(
                      name: confProducts[index].name,
                      star: confProducts[index].rating,
                      prais: confProducts[index].price,
                      image: confProducts[index].image,
                    );
                  }
                  return null;
                  // else {
                  //   return SizedBox(
                  //     height: 46,
                  //     width: 46,
                  //     child: ListTile(
                  //       title: Text(
                  //         word,
                  //         style: TextStyle(
                  //           color: const Color(0xFF333333),
                  //           fontSize: 20,
                  //           fontFamily: 'Montserrat',
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       ),
                  //       trailing: IconButton(
                  //         icon: const Icon(Icons.add_rounded),
                  //         onPressed: () {
                  //           Navigator.of(context).push(
                  //             MaterialPageRoute(
                  //               builder:
                  //                   (context) =>
                  //                       ProdPage(tip: selectedWords[index]),
                  //             ),
                  //           );
                  //         },
                  //       ),
                  //     ),
                  //   );
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Icnat extends StatefulWidget {
  const Icnat({
    super.key,
    required this.icon,
    required this.text,
    required this.tip,
    required this.index,
  });
  final String icon;
  final String text;
  final String tip;
  final int index;
  @override
  State<Icnat> createState() => _IcnatState();
}

class _IcnatState extends State<Icnat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: const Color(0xFFDAD1D6)),
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) => ProdPage(tip: selectedWords[widget.index]),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Row(
                        children: [
                          Image.asset(widget.icon, width: 18),
                          SizedBox(width: 5),
                          Text(
                            widget.text,
                            style: TextStyle(
                              color: const Color(0xFF1E254A),
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              height: 1.44,
                            ),
                          ),
                        ],
                      ),

                      Text(
                        'Выбрать',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: const Color(0xFF1E254A),
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: selectedWords.length,
                  //     itemBuilder: (context, index) {
                  //       final word = selectedWords[index];
                  //       String s = "рубашка";
                  //       if (index == 3) {
                  //         s = "брюки";
                  //       } else if (index == 0) {
                  //         s = "рубашки";
                  //       } else {
                  //         s = "обувь";
                  //       }

                  //       if (confProducts.length > index) {
                  //         print(confProducts[index].catigori);
                  //         print(s);
                  //         if (confProducts[index].catigori == s) {
                  //           return DesComponent(
                  //             name: confProducts[index].name,
                  //             star: confProducts[index].rating,
                  //             prais: confProducts[index].price,
                  //             image: confProducts[index].image,
                  //           );
                  //         }
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
