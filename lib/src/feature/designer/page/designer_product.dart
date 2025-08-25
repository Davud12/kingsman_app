import 'package:flutter/material.dart';
import 'package:kingsman_app/src/feature/app/page/app.dart';
import 'package:kingsman_app/src/feature/extension/clothing_item.dart';

class DesignerProduct extends StatelessWidget {
  const DesignerProduct({super.key, required this.product});

  final List<ClothingItem> product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Полу класика',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
        child: ListView.builder(
          itemCount: product.length,
          itemBuilder:
              (BuildContext context, int index) => DesComponent(
                name: product[index].name,
                star: product[index].rating,
                prais: product[index].price,
                image: product[index].image,
              ),
        ),
      ),
    );
  }
}

class DesComponent extends StatelessWidget {
  const DesComponent({
    super.key,
    required this.name,
    required this.star,
    required this.prais,
    required this.image,
  });

  final String name;
  final String image;
  final double star;
  final String prais;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     SizedBox(
        //       width: 210,
        //       child: Text(
        //         name,
        //         style: TextStyle(
        //           color: const Color(0xFF1E254A),
        //           fontSize: 20,
        //           fontFamily: 'Montserrat',
        //           fontWeight: FontWeight.w700,
        //         ),
        //       ),
        //     ),
        //     Row(
        //       children: [
        //         ...List.generate(5, (index) {
        //           return Icon(
        //             index < star ? Icons.star : Icons.star_border,
        //             color: Colors.amber,
        //             size: 18,
        //           );
        //         }),
        //         const SizedBox(width: 6),
        //         Text(
        //           4.toString(),
        //           style: TextStyle(
        //             fontFamily: 'Montserrat',
        //             fontWeight: FontWeight.w500,
        //             color: Colors.black87,
        //           ),
        //         ),
        //       ],
        //     ),
        //     SizedBox(height: 20),
        //     Text(
        //       prais,
        //       textAlign: TextAlign.center,
        //       style: TextStyle(
        //         color: const Color(0xFF060606),
        //         fontSize: 14,
        //         fontFamily: 'Montserrat',
        //         fontWeight: FontWeight.w600,
        //       ),
        //     ),
        //   ],
        // ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(image, height: 90, width: 90, fit: BoxFit.cover),
            Text(
              prais,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF060606),
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
