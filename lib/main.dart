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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoomPage(
                    roomName: 'DOW Chemical Unit Operations Lab',
                    roomFact: 'Facts for DOW Chemical Unit Operations Lab.',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('4. BASF Sustainable Living Lab'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoomPage(
                    roomName: 'BASF Sustainable Living Lab',
                    roomFact: 'Facts for BASF Sustainable Living Lab.',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('5. The Commons'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoomPage(
                    roomName: 'The Commons',
                    roomFact: 'Facts for The Commons.',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('6. Mechanical Engineering Labs'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoomPage(
                    roomName: 'Mechanical Engineering Labs',
                    roomFact: 'Facts for Mechanical Engineering Labs.',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('7. Civil Engineering Lab'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoomPage(
                    roomName: 'Civil Engineering Lab',
                    roomFact: 'Facts for Civil Engineering Lab.',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('8. Robotics Lab'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoomPage(
                    roomName: 'Robotics Lab',
                    roomFact: 'Facts for Robotics Lab.',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('9. Chevron Center for Engineering Education'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoomPage(
                    roomName: 'Chevron Center for Engineering Education',
                    roomFact: 'Facts for Chevron Center for Engineering Education.',
                  ),
                ),
              );
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoomPage(
                    roomName: 'BIM Lab',
                    roomFact: 'Facts about BIM Lab.',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('11. Proto Lab'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoomPage(
                    roomName: 'Proto Lab',
                    roomFact: 'Facts about Proto Lab.',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('12. Annex/Drilling Fluids Lab'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoomPage(
                    roomName: 'Annex/Drilling Fluids Lab',
                    roomFact: 'Facts about Annex/Drilling Fluids Lab.',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('13. Civil Engineering Driving Simulator Lab'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoomPage(
                    roomName: 'Civil Engineering Driving Simulator Lab',
                    roomFact: 'Facts about Civil Engineering Driving Simulator Lab.',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('14. Brookshire Student Services Suite'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoomPage(
                    roomName: 'Brookshire Student Services Suite',
                    roomFact: 'Facts about Brookshire Student Services Suite.',
                  ),
                ),
              );
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
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

// quiz page
class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),
      body: const Center(
        child: Text('Quiz Content'),
      ),
    );
  }
}

// homepage
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
