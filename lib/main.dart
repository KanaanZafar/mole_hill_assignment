import 'extensions/string_extension.dart';
import 'package:flutter/material.dart';

void main() {

  // Test case 8, expected answer 74, my answer = 86
  // String testCase = "oooooo+--+oooooo\no+--+o|oo|o+--+o\no|oo+-+oo+-+oo|o\no++oooooooooo++o\noo+-+o+--+o+-+oo\noooo|o|oo|o|oooo\no+--+o+--+o+--+o\n++oooooooooooo++\n|oooooooooooooo|\n+--------------+\noooooooooooooooo\no+-+oo+--+oo+-+o\n++o|oo|oo|oo|o++\n|oo+--+oo+--+oo|\n|oooooooooooooo|\n+--------------+";

//Test case 7, expected answer = 20, my answer = 25
// String testCase = "+--------------+\n|   o      oo  |\n| +----------+o|\n| |..........| |\n| |.+------+o|o|\n| |.|      |.| |\n| |o| +--+o|.| |\n| |.| |oo|o|.| |\n| |.| +--+ |.| |\n| |.|  oo  |.| |\n| |.|oooooo|.| |\n| |.+------+o|o|\n|o|..........| |\n|o+----------+ |\n|      o   o   |\n+--------------+";

//Test case 6, my answer = expected answer
// String testCase = "+--------------+\n|    o       o |\n+----------+  ++\n..........++ ++.\n....o....++ ++..\n........++ ++...\n.......++ ++....\n.oo...++o++...o.\n.....++ ++......\n....++ ++.......\n...++ ++....oo..\n..++ ++....o....\n.++ ++..........\n++o +----------+\n|       o      |\n+--------------+";

//Test case 5, expected answer = 13, my answer = 15
// String testCase = ".....o..........\n.+-------+..o.o.\n.|       |.oo...\n.|    o  |ooooo.\n.|       |oo....\n.|oo+-+oo+--+oo.\n.|  |.|     |o..\n.|  |.|     +-+.\n.|oo|o|       |.\n.|  |.|       |.\n.|  |.|ooo   o|.\n.|  |.|       |.\n.|  |.|  oo   |.\n.|  |.|       |.\n.+--+o+-------+.\n...............o";

//Test case 4, expected answer = 9, my answer = 10
// String testCase = "+--+....o..o....\n| o|............\n|  |......o.....\n|o +---+........\n|      |....+--+\n|  o   |....|oo|\n|      |....|oo|\n+------+..o.+--+\n................\n.....oo.........\n................\n+--------------+\n|          o   |\n|          o   |\n|              |\n+--------------+";

//Test case 3, my answer = expected answer
  // String testCase = "................\n................\n.oo.+------+oooo\n.oo.|  o   |.oo.\noooo|oooooo|....\n....+--+ o |.oo.\n.......| o |....\n....oo.|o ++.oo.\n....oo.+--+o.oo.\n................\n......ooo.......\n................\n................\n................\n................\n................";

  //Test case 2, my answer = expected answer
// String  testCase = "................\n................\n...+-------+.o..\n.o.|  o o  |..o.\n...|       |....\n...| o  +--+.oo.\n...|    |.......\n...+----+.......\n................\n........oo......\n................\n...o............\n................\n...........o....\n................\n................";

 //Test Case 1, my answer = expected answer
  String testCase =
      "................\n................\n..+----------+..\n..|          |..\n..|   o      |..\n..|      o   |..\n..|          |..\n..+----------+..\n................\n............o...\n.....o..........\n................\n.........o......\n................\n................\n................";
  List<String> testCasesLines = testCase.split("\n");
  List<String> fences = ["|", "+", "-"];
  String mole = "o";
  int totalMoles = 0;

  for (int i = 0; i < testCasesLines.length; i++) {
    String line = testCasesLines[i];
    List<String> charactersList = line.stringToList();
    int indexOfFirstFence =
        charactersList.indexWhere((element) => fences.contains(element));
    int indexOfLastFence =
        charactersList.lastIndexWhere((element) => fences.contains(element));
    int fencesCount = 0;
    int molesInLine = 0;

    for (int j = 0; j < line.length; j++) {
      String char = line[j];
      bool isFence = fences.contains(char);
      if (isFence) {
        fencesCount = fencesCount + 1;
      }

      bool isMole = char == mole;
      if (isMole) {
        // if (fencesCount.isOdd) {
        //   molesInLine = molesInLine + 1;
        // }

        bool isInBetweenFences = j > indexOfFirstFence && j < indexOfLastFence;
        if (isInBetweenFences) {
          molesInLine = molesInLine + 1;
        }
      }
    }
    totalMoles = totalMoles + molesInLine;
  }

  // Write an answer using print()
  // To debug: stderr.writeln('Debug messages...');

  print('$totalMoles');

  runApp(const MyApp());
}

String readLineSync() {
  String? s;
  return s == null ? '' : s;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
