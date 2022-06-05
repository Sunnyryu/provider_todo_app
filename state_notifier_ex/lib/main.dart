import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier_ex/providers/bg_color.dart';
import 'package:state_notifier_ex/providers/counter.dart';
import 'package:state_notifier_ex/providers/customer_level.dart';
import 'package:state_notifier_ex/providers/test.dart';
import 'package:state_notifier_ex/providers/test2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // 여기서도 상관관계에 따라 provider들의 순서가 중요할거같습니다. 지금 bgColor를 counter에서 사용하다보니 반대로 하면
        // 당연히 달라집니다.
        StateNotifierProvider<BgColor, BgColorState>(
          create: (context) => BgColor(),
        ),
        StateNotifierProvider<TestTwo, TestStateTwo>(
          create: (context) => TestTwo(),
        ),
        StateNotifierProvider<Counter, CounterState>(
          create: (context) => Counter(),
        ),

        StateNotifierProvider<CustomerLevel, Level>(
          create: (context) => CustomerLevel(),
        ),
        StateNotifierProvider<Test, TestState>(
          create: (context) => Test(),
        ),
      ],
      child: MaterialApp(
        title: 'StateNotifier',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(99999);
    final colorState = context.watch<BgColorState>();

    final counterState = context.watch<CounterState>();

    final levelState = context.watch<Level>();
    final testState = context.watch<TestState>();
    final testTwoState = context.watch<TestStateTwo>();

    return Scaffold(
      backgroundColor: levelState == Level.bronze
          ? Colors.white
          : levelState == Level.silver
              ? Colors.grey
              : Colors.yellow,
      appBar: AppBar(
        backgroundColor: colorState.color,
        title: const Text('StateNotifier'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${counterState.counter}',
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              testState.test,
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'color Type : ${testTwoState.colorType}',
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
        // flutter 자체에서 정해진 headline2
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: () {
            context.read<Counter>().increment();
            // print(66);
            // context.read<CustomerLevel>().test();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        const SizedBox(width: 10.0),
        FloatingActionButton(
          onPressed: () {
            context.read<BgColor>().changeColor();
          },
          tooltip: 'change Color',
          child: const Icon(Icons.color_lens_outlined),
        ),
      ]),
    );
  }
}
