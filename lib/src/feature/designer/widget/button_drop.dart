import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonDrop extends StatefulWidget {
  const ButtonDrop({super.key});

  @override
  State<ButtonDrop> createState() => _ButtonDropState();
}

class _ButtonDropState extends State<ButtonDrop> {
  ///?
  List<String> listDrop = <String>[''];
  final _model = SimpleCalcWidgetModel();

  DatabaseReference ref = FirebaseDatabase.instance.ref();
  final List<String> _weekDays = <String>[]; // Список для хранения дней недели

  String dropdownValue = "";

  int bottle = -1;
  List<String> textCart = ["ИСИП_3"];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchDays();
  }

  Map<String, int> _parseDateRange(String dateRange) {
    final parts = dateRange.split('_');
    final days = parts[0].split('-');
    final month = int.parse(parts[1]);

    return {
      'startDay': int.parse(days[0]),
      'endDay': int.parse(days[1]),
      'month': month,
    };
  }

  List<String> sorti(List<String> sortu) {
    sortu.sort((a, b) {
      // Разбиваем строки на компоненты
      final aParts = _parseDateRange(a);
      final bParts = _parseDateRange(b);

      // Сравниваем по месяцу в обратном порядке
      if (aParts['month'] != bParts['month']) {
        return bParts['month']!.compareTo(aParts['month']!);
      }

      // Если месяцы одинаковы, сравниваем по началу диапазона в обратном порядке
      if (aParts['startDay'] != bParts['startDay']) {
        return bParts['startDay']!.compareTo(aParts['startDay']!);
      }

      // Если начало диапазона одинаково, сравниваем по концу диапазона в обратном порядке
      return bParts['endDay']!.compareTo(aParts['endDay']!);
    });

    return sortu;
  }

  Future _initCounter() async {
    var bottleP = await SharedPreferences.getInstance();
    setState(() => bottle = bottleP.getInt("student") ?? -1);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() => textCart = prefs.getStringList("student_ke") ?? []);
  }

  Future<void> _fetchDays() async {
    try {
      await _initCounter();

      final snapshot = await ref.child('schedule/${textCart[bottle]}').get();
      if (snapshot.exists) {
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        final weekDays = data.keys.toList(); // Сохраняем дни недели
        setState(() {
          _loading = false;
          listDrop = sorti(weekDays);
          dropdownValue = listDrop.first;
        });
      }
    } catch (e) {
      print('Error fetching days: $e');
    }
  }

  ///?
  @override
  Widget build(BuildContext context) {
    return _loading
        ? const Center(child: CircularProgressIndicator())
        : listDrop != null
        ? DropdownButton(
          dropdownColor: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(30),
          value: dropdownValue,
          icon: null,
          alignment: Alignment.topRight,
          underline: const Text(""),
          style: Theme.of(context).textTheme.displayLarge,
          iconSize: 0,
          onChanged: (value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          items:
              listDrop.map<DropdownMenuItem<String>>((String value) {
                SimpleCalcWidgetProvider.of(context)?.dataA = dropdownValue;
                SimpleCalcWidgetProvider.of(context)?.madgic();
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        value.replaceFirst('_', "."),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                );
              }).toList(),
        )
        : const Text("5 сек");
  }
}

class SimpleCalcWidgetModel extends ChangeNotifier {
  String dataA = "a";
  int? monthWeek = 1;
  int? deyWeekA = 1;
  int? deyWeekB = 1;

  Map<String, int> _parseDateRange(String dateRange) {
    final parts = dateRange.split('_');
    final days = parts[0].split('-');
    final month = int.parse(parts[1]);

    return {
      'startDay': int.parse(days[0]),
      'endDay': int.parse(days[1]),
      'month': month,
    };
  }

  void madgic() async {
    final dataD = _parseDateRange(dataA);
    monthWeek = dataD['month'];
    deyWeekA = dataD['startDay'];
    deyWeekB = dataD['endDay'];

    notifyListeners();
  }
}

class SimpleCalcWidgetProvider extends InheritedWidget {
  final SimpleCalcWidgetModel model;
  const SimpleCalcWidgetProvider({
    super.key,
    required this.model,
    required super.child,
  });
  static SimpleCalcWidgetModel? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>()
        ?.model;
  }

  @override
  bool updateShouldNotify(SimpleCalcWidgetProvider oldWidget) {
    return model != oldWidget.model;
  }
}
