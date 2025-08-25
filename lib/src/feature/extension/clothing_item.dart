class ClothingItem {
  final String name; // название
  final String price; // цена
  final double rating; // рейтинг
  final String description; // описание
  final String catigori; // описание
  final String image;
  bool isFavorite; // в избранном или нет

  ClothingItem({
    required this.name,
    required this.price,
    required this.rating,
    required this.description,
    required this.catigori,
    required this.image,
    this.isFavorite = false, // по умолчанию не в избранном
  });

  // метод для переключения избранного
  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  @override
  String toString() {
    return 'ClothingItem(name: $name, price: $price, rating: $rating, isFavorite: $isFavorite)';
  }
}

class ConstrItem {
  late final String name; // название
  final String price; // цена
  final double rating; // рейтинг
  final String image;
  final List<ClothingItem> product;
  final int i;

  ConstrItem({
    required this.price,
    required this.i,
    required this.rating,
    required this.image,
    required this.name,
    required this.product,
  });
}

final List<ConstrItem> testObra = [
  ConstrItem(
    price: '20 000 р',
    rating: 4.2,
    image: 'asset/image/imagj.png',
    name: 'Образ полукласстика by User',
    product: [
      ClothingItem(
        name: "Рубашка белая классическая",
        price: "2999 р",
        rating: 4.7,
        description:
            "Классическая белая рубашка из хлопка для офиса и деловых встреч.",
        catigori: 'рубашки',
        image: 'asset/image/ra.jpg',
      ),
      ClothingItem(
        name: "Классические брюки черные",
        price: "4599 р",
        rating: 4.8,
        description: "Элегантные черные брюки для делового стиля.",
        catigori: 'брюки',
        image: 'asset/image/da.jpg',
      ),
      ClothingItem(
        name: "Кроссовки спортивные",
        price: "5999 р",
        rating: 4.8,
        description: "Легкие и удобные кроссовки для спорта и прогулок.",
        catigori: 'обувь',
        image: 'asset/image/ka.jpg',
      ),
    ],
    i: 4,
  ),
];

final List<ClothingItem> confProducts = [];

final List<ClothingItem> testProducts = [
  // 👕 Рубашки
  ClothingItem(
    name: "Рубашка белая классическая",
    price: "2999 р",
    rating: 4.7,
    description:
        "Классическая белая рубашка из хлопка для офиса и деловых встреч.",
    catigori: 'рубашки',
    image: 'asset/image/ra.jpg',
  ),
  ClothingItem(
    name: "Рубашка в клетку",
    price: "2499 р",
    rating: 4.5,
    description:
        "Стильная рубашка в клетку, идеально подходит для повседневного стиля.",
    catigori: 'рубашки',
    image: 'asset/image/rb.jpg',
  ),
  ClothingItem(
    name: "Джинсовая рубашка",
    price: "3199 р",
    rating: 4.6,
    description: "Модная джинсовая рубашка для неформальных встреч.",
    catigori: 'Рубашки',
    image: 'asset/image/rd.jpg',
  ),

  // 👖 Брюки
  ClothingItem(
    name: "Классические брюки черные",
    price: "4599 р",
    rating: 4.8,
    description: "Элегантные черные брюки для делового стиля.",
    catigori: 'брюки',
    image: 'asset/image/da.jpg',
  ),
  ClothingItem(
    name: "Джинсы прямого кроя",
    price: "3799 р",
    rating: 4.6,
    description: "Удобные джинсы прямого кроя для повседневной носки.",
    catigori: 'брюки',
    image: 'asset/image/db.jpg',
  ),

  // 👕 Футболки
  ClothingItem(
    name: "Футболка белая",
    price: "1499 р",
    rating: 4.4,
    description: "Базовая белая футболка из мягкого хлопка.",
    catigori: 'футболки',
    image: 'asset/image/fa.jpg',
  ),
  ClothingItem(
    name: "Футболка с принтом",
    price: "1799 р",
    rating: 4.5,
    description: "Футболка с оригинальным принтом для молодежного стиля.",
    catigori: 'футболки',
    image: 'asset/image/fb.jpg',
  ),
  ClothingItem(
    name: "Футболка черная",
    price: "1499 р",
    rating: 4.6,
    description: "Базовая черная футболка, сочетается с любым образом.",
    catigori: 'футболки',
    image: 'asset/image/fd.jpg',
  ),

  // 👟 Обувь
  ClothingItem(
    name: "Кроссовки спортивные",
    price: "5999 р",
    rating: 4.8,
    description: "Легкие и удобные кроссовки для спорта и прогулок.",
    catigori: 'обувь',
    image: 'asset/image/ka.jpg',
  ),
  ClothingItem(
    name: "Туфли кожаные",
    price: "7499 р",
    rating: 4.9,
    description: "Классические кожаные туфли для делового стиля.",
    catigori: 'обувь',
    image: 'asset/image/kb.jpg',
  ),
];
