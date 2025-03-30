import 'package:flutter/material.dart';

void main() {
  runApp(const ScavengerHuntApp());
}

class ScavengerHuntApp extends StatelessWidget {
  const ScavengerHuntApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StartScreen()),
                  );
                },
                child: const Text('Start'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// bottom navigation bar
class StartScreen extends StatefulWidget {
  final int initialPage;

  const StartScreen({super.key, this.initialPage = 0});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromARGB(109, 158, 158, 158),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.map),
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.quiz),
            icon: Icon(Icons.quiz_outlined),
            label: 'Quiz',
          ),
        ],
      ),
      body: <Widget>[
        const HomePage(),
        const MapPage(),
        const QuizPage(),
      ][currentPageIndex],
    );
  }
}

// map page

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Instruction',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Instruction'),
                    content: const Text('Use pinch-to-zoom to explore the map.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                tooltip: 'Room Navigation',
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: RoomDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return InteractiveViewer(
            boundaryMargin: EdgeInsets.zero,
            minScale: 1.0,
            maxScale: 4.0,
            child: SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Image.asset(
                'images/patrickmap.png',
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}


// navigation drawer
class RoomDrawer extends StatelessWidget {
  const RoomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'ROOMS',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: const Text('1. Capstone Gallery'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoomPage(
                    roomName: 'Capstone Gallery',
                    roomFact: 'Facts for Capstone Gallery.',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('2. Cambre Atrium & Donor Wall'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoomPage(
                    roomName: 'Cambre Atrium & Donor Wall',
                    roomFact: 'Facts for Cambre Atrium & Donor Wall.',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('3. DOW Chemical Unit Operations Lab'),
            trailing: const Icon(Icons.lock),
            onTap: () {
              _showLockedDialog(context, 'DOW Chemical Unit Operations Lab');
            },
          ),
          ListTile(
            title: const Text('4. BASF Sustainable Living Lab'),
            trailing: const Icon(Icons.lock),
            onTap: () {
              _showLockedDialog(context, 'BASF Sustainable Living Lab');
            },
          ),
          ListTile(
            title: const Text('5. The Commons'),
            trailing: const Icon(Icons.lock),
            onTap: () {
              _showLockedDialog(context, 'The Commons');
            },
          ),
          ListTile(
            title: const Text('6. Mechanical Engineering Labs'),
            trailing: const Icon(Icons.lock),
            onTap: () {
              _showLockedDialog(context, 'Mechanical Engineering Labs');
            },
          ),
          ListTile(
            title: const Text('7. Civil Engineering Lab'),
            trailing: const Icon(Icons.lock),
            onTap: () {
              _showLockedDialog(context, 'Civil Engineering Lab');
            },
          ),
          ListTile(
            title: const Text('8. Robotics Lab'),
            trailing: const Icon(Icons.lock),
            onTap: () {
              _showLockedDialog(context, 'Robotics Lab');
            },
          ),
          ListTile(
            title: const Text('9. Chevron Center for Engineering Education'),
            trailing: const Icon(Icons.lock),
            onTap: () {
              _showLockedDialog(context, 'Chevron Center for Engineering Education');
            },
          ),
          ListTile(
            title: const Text('Second Floor'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondFloorPage(initialPage: 1), 
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Future<void> _showLockedDialog(BuildContext context, String roomName) async {
  TextEditingController controller = TextEditingController();

  // password answer
  final roomPasswords = {
    'DOW Chemical Unit Operations Lab': '1114',
    'BASF Sustainable Living Lab': '1154',
    'The Commons': '1278',
    'Mechanical Engineering Labs': '1354',
    'Civil Engineering Lab': '1323',
    'Robotics Lab': '1300',
    'Chevron Center for Engineering Education': '1269',
  };

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('LOCKED'),

        content: Stack(
          clipBehavior: Clip.none, 
          children: [
            SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(hintText: 'Enter password'),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 8.0, 
              top: 8.0, 
              child: MouseRegion(
                onEnter: (_) {
                },
                onExit: (_) {
                },
                child: Tooltip(
                  message: 'Enter the correct password for this room to unlock it.',
                  child: IconButton(
                    icon: const Icon(Icons.info_outline),
                    tooltip: 'Password: Room #',
                    onPressed: () {
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Submit'),
            onPressed: () {
              if (controller.text == roomPasswords[roomName]) {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RoomPage(
                      roomName: roomName,
                      roomFact: 'Facts about $roomName.',
                    ),
                  ),
                );
              }
            },
          ),
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class SecondFloorPage extends StatefulWidget {
  final int initialPage;

  const SecondFloorPage({super.key, this.initialPage = 0});

  @override
  State<SecondFloorPage> createState() => _SecondFloorPageState();
}

class _SecondFloorPageState extends State<SecondFloorPage> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.initialPage; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(),
      ),
      endDrawer: const SecondFloorDrawer(),
      body: <Widget>[
        const HomePage(),
        Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Back',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.info_outline),
                  tooltip: 'Instruction',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Instruction'),
                          content: const Text(''),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.menu),
                      tooltip: 'Room Navigation',
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    );
                  },
                ),
              ],
            ),
            Expanded(
              child: InteractiveViewer(
                boundaryMargin: const EdgeInsets.all(20),
                minScale: 0.5,
                maxScale: 3.0,
                child: Image.asset(
                  'images/patrickmap2floor.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
        const QuizPage(),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromARGB(109, 158, 158, 158),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.map),
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.quiz),
            icon: Icon(Icons.quiz_outlined),
            label: 'Quiz',
          ),
        ],
      ),
    );
  }
}

// second floor navigation drawer
class SecondFloorDrawer extends StatelessWidget {
  const SecondFloorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'ROOMS',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: const Text('10. BIM Lab'),
            trailing: const Icon(Icons.lock),
            onTap: () {
              _showLockedDialogSecond(context, 'BIM Lab');
            },
          ),
          ListTile(
            title: const Text('11. Proto Lab'),
            trailing: const Icon(Icons.lock),
            onTap: () {
              _showLockedDialogSecond(context, 'Proto Lab');
            },
          ),
          ListTile(
            title: const Text('12. Annex/Drilling Fluids Lab'),
            trailing: const Icon(Icons.lock),
            onTap: () {
              _showLockedDialogSecond(context, 'Annex/Drilling Fluids Lab');
            },
          ),
          ListTile(
            title: const Text('13. Civil Engineering Driving Simulator Lab'),
            trailing: const Icon(Icons.lock),
            onTap: () {
              _showLockedDialogSecond(context, 'Civil Engineering Driving Simulator Lab');
            },
          ),
          ListTile(
            title: const Text('14. Brookshire Student Services Suite'),
            trailing: const Icon(Icons.lock),
            onTap: () {
              _showLockedDialogSecond(context, 'Brookshire Student Services Suite');
            },
          ),
          ListTile(
            title: const Text('First Floor'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const StartScreen(initialPage: 1), 
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


Future<void> _showLockedDialogSecond(BuildContext context, String roomName) async {
    TextEditingController controller = TextEditingController(); 

    // password answer
    final roomPasswords = {
      'BIM Lab': '2348',
      'Proto Lab': '2272',
      'Annex/Drilling Fluids Lab': '2147',
      'Civil Engineering Driving Simulator Lab': '2215',
      'Brookshire Student Services Suite': '2228',
    };

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('LOCKED'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(hintText: 'Enter password'),
                  obscureText: true,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                if (controller.text == roomPasswords[roomName]) {
                  Navigator.of(context).pop(); 
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RoomPage(
                        roomName: roomName,
                        roomFact: 'Facts about $roomName.',
                      ),
                    ),
                  );
                }
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); 
              },
            ),
          ],
        );
      },
    );
  }


// room page
class RoomPage extends StatelessWidget {
  final String roomName;
  final String roomFact;

  const RoomPage({
    super.key,
    required this.roomName,
    required this.roomFact,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        title: Text(roomName),
      ),
      body: Center(
        child: Text(roomFact),
      ),
    );
  }
}


class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: const Center(
        child: Text('Quiz Content'),
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
