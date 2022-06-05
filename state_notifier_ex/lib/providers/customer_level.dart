import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_ex/providers/bg_color.dart';
import 'package:state_notifier_ex/providers/counter.dart';

enum Level {
  bronze,
  silver,
  gold,
}

class CustomerLevel extends StateNotifier<Level> with LocatorMixin {
  CustomerLevel() : super(Level.bronze);
  void test() {
    print(123555);
  }

  @override
  void update(Locator watch) {
    final currentCounter = watch<CounterState>().counter;

    if (currentCounter >= 100) {
      state = Level.gold;
    } else if (currentCounter > 50 && currentCounter < 100) {
      state = Level.silver;
    } else {
      state = Level.bronze;
    }
    print(watch<CounterState>().props);

    print(watch<BgColorState>().props);

    super.update(watch);
  }
}
