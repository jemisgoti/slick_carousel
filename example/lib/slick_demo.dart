import 'package:flutter/material.dart';
import 'package:slick_carousel/features/slick/controllers/slick_controller.dart';
import 'package:slick_carousel/features/slick/presentation/pages/slick_view.dart';

class SlickDemo extends StatefulWidget {
  const SlickDemo({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<SlickDemo> createState() => _SlickDemoState();
}

class _SlickDemoState extends State<SlickDemo> {
  SlickController slickController = SlickController();

  @override
  void dispose() {
    slickController.dispose();

    super.dispose();
  }

  List<String> newsType = [
    'All',
    'Entertainment',
    'Jobs',
    "Political",
    'Social',
    'Sports',
    'Geography',
    'GeoPolitics',
    'Enviroment',
    "Wild Life",
    "Farming",
    "Global Warming",
    "Fake Hunting",
    "Science",
    "Hostory",
    "Finance"
  ];

  bool infiniteScroll = false;
  bool fixedWidth = false;
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
              'Your slick slider demo is here',
            ),
            SizedBox(
              height: 45,
              child: SlickView.builder(
                slickController: slickController,
                itemCount: newsType.length,
                viewportFraction: 0.5,
                infiniteScroll: infiniteScroll,
                fixedWidth: fixedWidth,
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          color: index == 0
                              ? Colors.black
                              : Colors.grey.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(6)),
                      child: Center(
                          child: Text(
                        newsType[index],
                        style: TextStyle(
                            color: index == 0 ? Colors.white : Colors.black),
                      )),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Wrap(
              runSpacing: 16,
              spacing: 16,
              children: [
                ElevatedButton(
                    onPressed: () {
                      slickController.previous();
                    },
                    child: const Text("Previous")),
                ElevatedButton(
                    onPressed: () {
                      slickController.next();
                    },
                    child: const Text("Next"))
              ],
            ),
            SwitchListTile.adaptive(
                title: const Text("Infinite Scroll"),
                value: infiniteScroll,
                onChanged: (value) {
                  setState(() {
                    infiniteScroll = value;
                  });
                }),
            SwitchListTile.adaptive(
                title: const Text("Fixed Width"),
                value: fixedWidth,
                onChanged: (value) {
                  setState(() {
                    fixedWidth = value;
                  });
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
