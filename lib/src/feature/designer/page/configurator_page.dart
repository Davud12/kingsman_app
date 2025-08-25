import 'package:flutter/material.dart';
import 'package:kingsman_app/src/feature/designer/page/construkt_d_page.dart';
import 'package:kingsman_app/src/feature/extension/clothing_item.dart';

class WordListPage extends StatefulWidget {
  const WordListPage({super.key});

  @override
  State<WordListPage> createState() => _WordListPageState();
}

List<String> availableWords = ["рубашки", "футболки", "обувь", "брюки"];
final List<String> selectedWords = ["рубашки", "футболки", "обувь", "брюки"];

class _WordListPageState extends State<WordListPage> {
  // список доступных слов в меню

  // список выбранных слов

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
        backgroundColor: const Color.fromARGB(255, 11, 14, 39), // цвет кнопки
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // скругления
        ),
        child: const Icon(
          Icons.arrow_forward_rounded,
          size: 28,
          color: Colors.white,
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
            // выпадающее меню
            DropdownButton<String>(
              hint: const Text(
                'Добавить компонент',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              value: null, // чтобы всегда было пусто после выбора
              isExpanded: true,
              items:
                  availableWords.map((word) {
                    return DropdownMenuItem(value: word, child: Text(word));
                  }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedWords.add(value);
                    availableWords.remove(value); // убираем из меню
                  });
                }
              },
            ),
            const SizedBox(height: 20),

            // список выбранных слов
            Expanded(
              child: ListView.builder(
                itemCount: selectedWords.length,
                itemBuilder: (context, index) {
                  final word = selectedWords[index];
                  return SizedBox(
                    height: 46,
                    child: ListTile(
                      title: Text(
                        word,
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_rounded),
                        onPressed: () {
                          setState(() {
                            availableWords.add(word); // возвращаем в меню
                            selectedWords.removeAt(index); // убираем из списка
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
