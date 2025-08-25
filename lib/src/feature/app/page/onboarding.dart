import 'package:flutter/material.dart';
import 'package:kingsman_app/src/feature/app/page/app.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _controller = PageController();
  int _pageIndex = 0;

  final _pages = [
    _OnboardPage(
      imagePath: "asset/image/Groupss.png",
      title: 'Открывай новое',
      subtitle:
          'Подборки, рекомендации и умный поиск — всё, чтобы быстрее находить нужное.',
    ),
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Данные',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(255, 19, 19, 19),
                fontSize: 24,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            child: TextField(
              cursorColor: Color(0xFF88BD3E),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                //  : Color(0xFF88BD3E),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 100, 100, 96),
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Color(0xFF88BD3E)),
                ),
                fillColor: Color.fromARGB(255, 255, 255, 255),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Color(0xFF88BD3E)),
                ),
                labelStyle: TextStyle(
                  color: const Color.fromARGB(255, 37, 37, 37),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
                labelText: 'Рост',
              ),
            ),
          ),
          Text(
            'Обхват:',
            style: TextStyle(
              color: const Color(0xFF5E5E5E),
              fontSize: 24,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            child: TextField(
              cursorColor: Color(0xFF88BD3E),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                //  : Color(0xFF88BD3E),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 100, 100, 96),
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Color(0xFF88BD3E)),
                ),
                fillColor: Color.fromARGB(255, 255, 255, 255),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Color(0xFF88BD3E)),
                ),
                labelStyle: TextStyle(
                  color: const Color.fromARGB(255, 37, 37, 37),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
                labelText: 'талия',
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            child: TextField(
              cursorColor: Color(0xFF88BD3E),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                //  : Color(0xFF88BD3E),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 100, 100, 96),
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Color(0xFF88BD3E)),
                ),
                fillColor: Color.fromARGB(255, 255, 255, 255),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Color(0xFF88BD3E)),
                ),
                labelStyle: TextStyle(
                  color: const Color.fromARGB(255, 37, 37, 37),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
                labelText: 'бедра',
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            child: TextField(
              cursorColor: Color(0xFF88BD3E),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                //  : Color(0xFF88BD3E),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 100, 100, 96),
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Color(0xFF88BD3E)),
                ),
                fillColor: Color.fromARGB(255, 255, 255, 255),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Color(0xFF88BD3E)),
                ),
                labelStyle: TextStyle(
                  color: const Color.fromARGB(255, 37, 37, 37),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
                labelText: 'грудь',
              ),
            ),
          ),
          Text(
            'Обувь:',
            style: TextStyle(
              color: const Color(0xFF5E5E5E),
              fontSize: 24,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            child: TextField(
              cursorColor: Color(0xFF88BD3E),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                //  : Color(0xFF88BD3E),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 100, 100, 96),
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Color(0xFF88BD3E)),
                ),
                fillColor: Color.fromARGB(255, 255, 255, 255),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Color(0xFF88BD3E)),
                ),
                labelStyle: TextStyle(
                  color: const Color.fromARGB(255, 37, 37, 37),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
                labelText: 'размер',
              ),
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goHome() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const App()));
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _pageIndex == _pages.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Кнопка "Пропустить" сверху справа
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _goHome,
                child: const Text(
                  'Пропустить',
                  style: TextStyle(
                    color: Color(0xFF353535),
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            // Слайды
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => _pageIndex = i),
                itemBuilder: (_, i) => _pages[i],
              ),
            ),

            const SizedBox(height: 12),

            // Индикаторы страниц
            _Dots(count: _pages.length, index: _pageIndex),

            const SizedBox(height: 16),

            // Кнопка "Далее"/"Начать"
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: SizedBox(
                width: double.infinity,

                child: FilledButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFF1E254A),
                  ),
                  onPressed: () {
                    if (isLast) {
                      _goHome();
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 280),
                        curve: Curves.easeOut,
                      );
                    }
                  },
                  child: Text(isLast ? 'Готово' : 'Далее'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardPage extends StatelessWidget {
  const _OnboardPage({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  final String imagePath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: Column(
        children: [
          const Spacer(),
          // иллюстрация (можно заменить на Image.asset(...) для своих картинок)
          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colorScheme.primaryContainer.withOpacity(0.4),
            ),
            child: Image.asset(imagePath, height: 300),
          ),
          const SizedBox(height: 32),
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({required this.count, required this.index});

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count, (i) {
          final active = i == index;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: active ? 22 : 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color:
                  active
                      ? Colors.black
                      : Theme.of(context).colorScheme.outlineVariant,
            ),
          );
        }),
      ),
    );
  }
}
