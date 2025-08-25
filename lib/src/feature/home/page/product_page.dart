import 'package:flutter/material.dart';
import 'package:kingsman_app/src/feature/extension/clothing_item.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.index});

  final int index;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String selectedSize = "M";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📌 Фото товара
            Center(
              child: Image.asset(testProducts[widget.index].image, height: 250),
            ),
            const SizedBox(height: 16),

            // 📌 Название и цена
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  testProducts[widget.index].name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF1E254A),
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  testProducts[widget.index].price,
                  style: TextStyle(
                    color: Color(0xFF1E254A),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            // 📌 Артикул
            const Text(
              "Арт: 75383116 09",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 6),

            // 📌 Рейтинг
            Row(
              children: [
                ...List.generate(5, (index) {
                  return Icon(
                    index < 4 ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 20,
                  );
                }),
                const SizedBox(width: 6),
                Text(
                  testProducts[widget.index].rating.toString(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 📌 Размеры
            const Text(
              "Размер",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),

            Wrap(
              spacing: 12,
              children:
                  ["S", "M", "L", "XL", "XXL"].map((size) {
                    final bool isSelected = size == selectedSize;
                    return ChoiceChip(
                      label: Text(size),
                      selected: isSelected,
                      onSelected: (_) {
                        setState(() => selectedSize = size);
                      },
                      selectedColor: Color(0xFF1E254A),
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black26),
                    );
                  }).toList(),
            ),

            const SizedBox(height: 20),

            // 📌 Описание
            Text(
              testProducts[widget.index].description,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Читать дальше",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(0xFF1E254A),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 📌 Кнопка "Добавить в корзину"
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1E254A),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Добавить в корзину",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
