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
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InstructionsScreen()),
                  );
                },
                child: const Text('Instructions'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InstructionsScreen extends StatelessWidget {
  const InstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructions'),
      ),
      body: Center(
        child: Text('Here are the instructions for the app!'),
      ),
    );
  }
}


class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
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

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  MapPageState createState() => MapPageState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(70, 29, 124, 1),
        title: Image.asset('images/gold_lsu_logo.png', height: 120, width: 240),
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
        ]
    ),
  );
}

class MapPageState extends State<MapPage> {
  bool isImageSwitched = false; 
  void toggleImage() {
    setState(() {
      isImageSwitched = !isImageSwitched; 
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.exit_to_app),
        tooltip: 'Start Screen',
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
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0), 
                    child: Column(
                      mainAxisSize: MainAxisSize.min, 
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Instructions', 
                          style: TextStyle(
                            fontSize: 18.0, 
                            fontWeight: FontWeight.bold, 
                          ),
                        ),
                        const SizedBox(height: 16.0), 
                        const Text(
                          'You will notice a map with numbers on it. Your goal is to locate the rooms marked on the map! Look for the three-dash icon on the right. Some rooms are locked, and your objective is to unlock them. You will also see a stair icon that lets you switch between floors. A hint will be provided when you click on a room.',
                          textAlign: TextAlign.left, 
                          style: TextStyle(fontSize: 16.0), 
                        ),
                        const SizedBox(height: 16.0), 
                        Align(
                          alignment: Alignment.centerRight, 
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context); 
                            },
                            child: const Text('OK'),
                          ),
                        ),
                      ],
                    ),
                  ),
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
      endDrawer: RoomDrawer(toggleImage: toggleImage), 
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
                isImageSwitched
                    ? 'images/patrickmap2.png' 
                    : 'images/patrickmap.png', 
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
class RoomDrawer extends StatefulWidget {
  final Function toggleImage; 

  const RoomDrawer({super.key, required this.toggleImage});

  @override
  RoomDrawerState createState() => RoomDrawerState();
}

class RoomDrawerState extends State<RoomDrawer> {
  late ScrollController _scrollController;
  bool _isAtTop = true;
  bool _isAtBottom = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      setState(() {
        _isAtTop = _scrollController.offset <= _scrollController.position.minScrollExtent;
        _isAtBottom = _scrollController.offset >= _scrollController.position.maxScrollExtent;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController, 
            slivers: [
              SliverPersistentHeader(
                delegate: _HeaderDelegate(toggleImage: widget.toggleImage), 
                pinned: true, 
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  ListTile(
                title: const Text('1. Capstone Gallery'),
                trailing: const Icon(Icons.lock_open),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RoomPage(
                        roomName: 'Capstone Gallery',
                        roomImage: 'images/Capstone.jpg',
                        roomFact: 'Welcome to Patrick F. Taylor Hall, home to the LSU College of Engineering. Named after 1959 petroleum engineering graduate, Patrick F. Taylor, it is the largest academic building in the state of Louisiana and one of the largest free-standing College of Engineering buildings in the United States. As a result of our recent 114-million renovation and expansion, this building is now more than 400,000 square feet and provides students and faculty with state-of-the-art classrooms and labs. It also serves as the central hub for the College of Engineering’s eight academic departments, which educate thousands of undergraduate and graduate students each year.',
                      ),
                    ),
                  );
                },
              ),
              const Divider(), 
              ListTile(
                title: const Text('2. Cambre Atrium & Donor Wall'),
                trailing: const Icon(Icons.lock_open),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RoomPage(
                        roomName: 'Cambre Atrium & Donor Wall',
                        roomFact: 'Cambre Atrium is a key common space in Patrick F. Taylor Hall, connecting the old building with a new three-story lab annex. It features chemical engineering labs on one side and classrooms on the other, with sizes ranging from 30 to 150 seats. The largest classroom, the RoyOMartin Auditorium, holds up to 250 students. Near the auditorium doors is the Donor Wall, recognizing donors and industry partners who helped fund the building renovation.',
                        roomImage: 'images/Cambre.jpg',
                      ),
                    ),
                  );
                },
              ),
              const Divider(), 
              ListTile(
                title: const Text('3. Unit Operations Lab'),
                trailing: const Icon(Icons.lock),
                onTap: () {
                  _showLockedDialog(context, 'Unit Operations Lab');
                },
              ),
              const Divider(), 
              ListTile(
                title: const Text('4. Sustainable Living Lab'),
                trailing: const Icon(Icons.lock),
                onTap: () {
                  _showLockedDialog(context, 'Sustainable Living Lab');
                },
              ),
              const Divider(), 
              ListTile(
                title: const Text('5. The Commons'),
                trailing: const Icon(Icons.lock),
                onTap: () {
                  _showLockedDialog(context, 'The Commons');
                },
              ),
              const Divider(), 
              ListTile(
                title: const Text('6. Human Factors Lab'),
                trailing: const Icon(Icons.lock),
                onTap: () {
                  _showLockedDialog(context, 'Human Factors Lab');
                },
              ),
              const Divider(), 
              ListTile(
                title: const Text('7. Strength and Materials Lab'),
                trailing: const Icon(Icons.lock),
                onTap: () {
                  _showLockedDialog(context, 'Strength and Materials Lab');
                },
              ),
              const Divider(), 
              ListTile(
                title: const Text('8. Robotics Lab'),
                trailing: const Icon(Icons.lock),
                onTap: () {
                  _showLockedDialog(context, 'Robotics Lab');
                },
              ),
              const Divider(), 
              ListTile(
                title: const Text('9. Center for Enginerring Education'),
                trailing: const Icon(Icons.lock),
                onTap: () {
                  _showLockedDialog(context, 'Center for Enginerring Education');
                },
              ),
              const Divider(), 
              ListTile(
                title: const Text('10. BIM Lab'),
                trailing: const Icon(Icons.lock),
                onTap: () {
                  _showLockedDialog(context, 'BIM Lab');
                },
              ),
              const Divider(), 
              ListTile(
                title: const Text('11. Proto Lab'),
                trailing: const Icon(Icons.lock),
                onTap: () {
                  _showLockedDialog(context, 'Proto Lab');
                },
              ),
              const Divider(), 
              ListTile(
                title: const Text('12. Annex/Drilling Fluids Lab'),
                trailing: const Icon(Icons.lock),
                onTap: () {
                  _showLockedDialog(context, 'Annex/Drilling Fluids Lab');
                },
              ),
              const Divider(), 
              ListTile(
                title: const Text('13. Civil Engineering Driving Simulator Lab'),
                trailing: const Icon(Icons.lock),
                onTap: () {
                  _showLockedDialog(context, 'Civil Engineering Driving Simulator Lab');
                },
              ),
              const Divider(), 
              ListTile(
                title: const Text('14. Brookshire Student Services Suite'),
                trailing: const Icon(Icons.lock),
                onTap: () {
                  _showLockedDialog(context, 'Brookshire Student Services Suite');
                },
              ),
                ]),
              ),
            ],
          ),
          
          Positioned(
            top: 80.0, 
            left: 0,
            right: 0,
            child: Visibility(
              visible: !_isAtTop, 
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_drop_up,
                  color: Colors.grey,
                  size: 40.0,
                ),
              ),
            ),
          ),
          
          Positioned(
            bottom: 0.0, 
            left: 0,
            right: 0,
            child: Visibility(
              visible: !_isAtBottom, 
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_drop_down, 
                  color: Colors.grey,
                  size: 40.0,
                ),
              ),
            ),
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
    'Unit Operations Lab': '1114',
    'Sustainable Living Lab': '1154',
    'The Commons': '1278',
    'Human Factors Lab': '1354',
    'Strength and Materials Lab': '1323',
    'Robotics Lab': '1300',
    'Center for Enginerring Education': '1269',
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
                      roomFact: roomName == 'Unit Operations Lab'
                          ? 'This room is located within the Cain Department of Chemical Engineering, providing students with hands-on experience using industry-grade equipment for various chemical process steps, known as unit operations. Key equipment includes an Ethylene Oxidation Reactor, which converts ethylene into ethylene oxide, and a distillation column, which separates components like water and glycols. Much of the equipment is industry-donated, offering students real-world practice. The distillation unit mimics those used in commercial pharmaceutical and specialty chemical facilities. Students interact with the equipment in their junior year and learn to operate it from a control room as seniors.'
                          : roomName == 'Sustainable Living Lab'
                              ? 'Sustainable Living Laboratory was funded by a 1 million donation from BASF. The flooring, paint, and ceiling in this lab are all made from BASF products. The lab space is dedicated to research investigating sustainable solutions to meet global challenges. The current researcher-in-residence, Dr. Jimmy Lawrence, studies and develops new functional polymers and nanoscale composites for healthcare, energy, environmental, and other industrial applications.'
                              : roomName == 'The Commons'
                                  ? 'This atrium space is aptly named “The Commons” and serves as the main gathering space for everyone in Patrick F. Taylor Hall. Students frequent this space between classes, not only because of the Panera Bread, but also because of the nearby Dow Student Leadership Incubator, which serves as a meeting and storage space for the more than 40 student organizations that are part of our college.'
                                  : roomName == 'Human Factors Lab'
                                      ? 'This section of Patrick F. Taylor Hall is home to many student-focused lab spaces for mechanical and industrial engineering, including the human factors, thermal systems, materials, and instrumentation labs. Within these labs, you will find equipment like a wind tunnel, tensile strength testers, and 3D-motion analysis systems.'
                                      : roomName == 'Strength and Materials Lab'
                                          ? 'In this section of Patrick F. Taylor Hall, you will find most of our civil engineering student labs. Here, our students test concrete for strength and damage, test and create asphalt, test the chemical composition and strength of soils, and study the strength of metal and timber.'
                                          : roomName == 'Robotics Lab'
                                              ? 'The College of Engineering offers a minor in robotics and provides a lab space to support this program. Some of the equipment housed in this lab include a hydraulic robotic arm; robotic vehicles, such as spiders and crawlers; and a mini humanoid robot named “Darwin.”'
                                              : roomName == 'Center for Enginerring Education'
                                                  ? 'This is one of three studios that support a university-wide program called Communication Across the Curriculum, which was started in 2005 by a chemical engineering alum. The program focuses on improving four areas of communication: written, spoken, visual, and technological, while deepening student learning of course content. This space has 3D printers, large format printers, and many electronic devices that students may rent to complete class projects. Students who take the required number of communication-intensive courses and complete a senior portfolio can graduate as a Distinguished Communicator.'
                                                  : roomName == 'BIM Lab'
                                                      ? 'The MMR Building Information Modeling Laboratory is used by construction management students and was designed by faculty. It features 44 4K displays that enable three-dimensional, computer-generated views of building plans, allowing students and faculty to virtually explore building sites, assess plans, and address issues like safety and maintenance. The Bert S. Turner Department of Construction Management also has several other labs and classrooms on the third floor, including an estimating and scheduling lab, a CATS equipment simulator room, and an advanced materials lab.'
                                                      : roomName == 'Proto Lab'
                                                          ? 'The Mark and Carolyn Guidry Electrical Engineering Laboratory Duplex features a microprocessor interfacing lab and a proto lab, providing students with the tools to fabricate circuit boards and create device prototypes. Designed as a chemistry lab, it includes fume hoods for safe chemical handling, soldering stations, cutting machines, and 3D printers. The space also has lighting and windows that filter out UV light to protect the circuit board layering process.'
                                                          : roomName == 'Annex/Drilling Fluids Lab'
                                                              ? 'This hallway runs the length of the Chemical Engineering Annex – the portion of Patrick F. Taylor Hall that was built “from the ground up” as part of the recent renovation and expansion. The annex contains numerous chemical engineering laboratories, as well as laboratories for construction management, civil engineering, environmental engineering, and petroleum engineering spread throughout its three floors.\n\nThe Drilling Fluids Laboratory is a petroleum engineering space where students learn to work with drilling fluids—mixtures of water, clay, minerals, and chemicals used to manage well pressure, clean drill bits, and transport debris. Since each well has unique geological conditions, petroleum engineers must customize drilling fluids to maintain safety. The lab offers hands-on experience with equipment like mud balances, filter presses, and viscometers, preparing students for fieldwork.'
                                                              : roomName == 'Civil Engineering Driving Simulator Lab'
                                                                  ? 'The Civil Engineering Driving Simulator Laboratory allows students and faculty to research driving behaviors, environments, and traffic. Equipped with multiple screens, projectors, and blackout curtains, this lab gives our researchers the ability to test drive on new roadways and study drivers’ reactions to unexpected obstacles and events. Recent research projects include the outcomes of distracted driving, the effects of various weather conditions, and how drivers might interact with a semi-autonomous driving system.'
                                                                  : roomName == 'Brookshire Student Services Suite'
                                                                      ? 'The Dr. William A. Brookshire Student Services Suite is a “go-to” first stop for most students who have questions or need help with the administrative and academic demands that come with being a college student. The Office of Student Services provides many resources, as well as academic advisors, all of whom are licensed professional counselors, to help with things like changing majors, adding a minor, and verifying how course credits have transferred from other institutions. This suite also houses other professional staff, including an engineering career coach, recruiting and outreach staff.'
                                                                      : '',
                      roomImage: roomName == 'Unit Operations Lab'
                          ? 'images/Operations.jpg'
                          : roomName == 'Sustainable Living Lab'
                              ? 'images/BASF.jpg'
                              : roomName == 'The Commons'
                                  ? 'images/Commons.jpg'
                                  : roomName == 'Human Factors Lab'
                                      ? 'images/Mechanical.jpg'
                                      : roomName == 'Strength and Materials Lab'
                                          ? 'images/Civil.jpg'
                                          : roomName == 'Robotics Lab'
                                              ? 'images/Robotics.jpg'
                                              : roomName == 'Center for Enginerring Education'
                                                  ? 'images/Chevron.jpg'
                                                  : roomName == 'BIM Lab'
                                                      ? 'images/BIMlab.jpg'
                                                      : roomName == 'Proto Lab'
                                                          ? 'images/Proto.jpg'
                                                          : roomName == 'Annex/Drilling Fluids Lab'
                                                              ? 'images/Annex.jpg'
                                                              : roomName == 'Civil Engineering Driving Simulator Lab'
                                                                  ? 'images/Drivinglab.jpg'
                                                                  : roomName == 'Brookshire Student Services Suite'
                                                                      ? 'images/Brookeshire.jpg'
                                                                      : '',
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


class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Function toggleImage; 

  _HeaderDelegate({required this.toggleImage});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20.0),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'ROOMS',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.stairs), 
            tooltip: 'Swtich Floors',
            onPressed: () => toggleImage(), 
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 80.0;
  @override
  double get minExtent => 80.0;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}


// room page
class RoomPage extends StatelessWidget {
  final String roomName;
  final String roomFact;
  final String roomImage;

  const RoomPage({
    super.key,
    required this.roomName,
    required this.roomFact,
    required this.roomImage,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              roomImage, 
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                roomFact, 
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
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
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app ),
          tooltip: 'Start Screen',
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
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, 
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [
                        const Text(
                          'Instructions',
                          style: TextStyle(
                            fontSize: 18.0, 
                            fontWeight: FontWeight.bold, 
                          ),
                        ),
                        const SizedBox(height: 16.0), 
                        const Text(
                      'You will be asked several questions related to the rooms you just explored. Each question will test your knowledge of the facts you learned. Get ready to test your memory!',
                          textAlign: TextAlign.left, 
                          style: TextStyle(fontSize: 16.0), 
                        ),
                        const SizedBox(height: 16.0), 
                        Align(
                          alignment: Alignment.centerRight, 
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context); 
                            },
                            child: const Text('OK'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome to the Quiz! \n\nIn this quiz, you will be asked several questions related to the rooms you just explored. Each question will test your knowledge of the facts you learned. Get ready to test your memory and knowledge!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20), 
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ActualQuizPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Let\'s Begin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActualQuizPage extends StatefulWidget {
  const ActualQuizPage({super.key});

  @override
  ActualQuizPageState createState() => ActualQuizPageState();
}

class ActualQuizPageState extends State<ActualQuizPage> {
  Map<int, String?> selectedAnswers = {};

  int score = 0;

  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> quizData = [
    {
      'question': 'What key equipment is used in the Unit Operations Lab to separate components like water and glycols?',
      'options': ['Distillation Column', 'Ethylene Oxidation Reactor', 'Hydraulic Robotic Arm', 'Wind Tunnel'],
      'answer': 'Distillation Column',
      'image': 'images/Operations.jpg',
    },
    {
      'question': 'Which company donated 1 million dollars to fund the Sustainable Living Laboratory?',
      'options': ['BASF', 'Dow Chemical', 'Chevron', '3M'],
      'answer': 'BASF',
      'image': 'images/BASF.jpg',
    },
    {
      'question': 'What is a popular feature of The Commons that attracts students?',
      'options': ['Panera Bread', 'Large Screen Displays', 'Robotics Lab Equipment', '3D Printers'],
      'answer': 'Panera Bread',
      'image': 'images/Commons.jpg',
    },
    {
      'question': 'What piece of equipment can be found in the Human Factors Lab that helps study mechanical engineering?',
      'options': ['Wind Tunnel', 'Tensile Strength Testers', 'Hydraulic Robotic Arm', '3D Motion Analysis System'],
      'answer': 'Wind Tunnel',
      'image': 'images/Mechanical.jpg',
    },
    {
      'question': 'In the Strength and Materials Lab, what material is tested for strength and damage?',
      'options': ['Asphalt', 'Concrete', 'Soils', 'Steel'],
      'answer': 'Concrete',
      'image': 'images/Civil.jpg',
    },
    {
      'question': 'Which robot is housed in the Robotics Lab?',
      'options': ['Darwin', 'Edison', 'Miniature Turing', 'R2-D2'],
      'answer': 'Darwin',
      'image': 'images/Robotics.jpg',
    },
    {
      'question': 'What program is supported by the Center for Engineering Education to improve communication skills?',
      'options': ['Communication Across the Curriculum', 'Communication Masters Program', 'Technological Communication Initiative', 'Engineering Speech Clinic'],
      'answer': 'Communication Across the Curriculum',
      'image': 'images/Chevron.jpg',
    },
    {
      'question': 'How many 4K displays are available for use in the BIM Lab for construction management students?',
      'options': ['10', '44', '25', '20'],
      'answer': '44',
      'image': 'images/BIMlab.jpg',
    },
    {
      'question': 'What is one of the tools available in the Proto Lab for creating device prototypes?',
      'options': ['3D Printers', 'Laser Cutter', 'Mold Injection Machines', 'CNC Machines'],
      'answer': '3D Printers',
      'image': 'images/Proto.jpg',
    },
    {
      'question': 'In the Drilling Fluids Lab, students work with drilling fluids used to manage well pressure. Which of the following is an important piece of equipment in the lab?',
      'options': ['Mud Balances', 'Concrete Mixers', 'Soil Testers', 'Robotic Arms'],
      'answer': 'Mud Balances',
      'image': 'images/Annex.jpg',
    },
    {
      'question': 'What type of research is conducted in the Civil Engineering Driving Simulator Lab?',
      'options': ['Traffic behavior and driver reactions', 'Vehicle performance testing', 'Roadway construction simulations', 'Climate change impact on driving'],
      'answer': 'Traffic behavior and driver reactions',
      'image': 'images/Drivinglab.jpg',
    },
    {
      'question': 'Which office is located in the Brookshire Student Services Suite?',
      'options': ['Career Services', 'Engineering Advisors', 'Registrar', 'Health Services'],
      'answer': 'Career Services',
      'image': 'images/Brookeshire.jpg',
    },
  ];

  void _onOptionSelected(int questionIndex, String? selectedOption) {
    setState(() {
      selectedAnswers[questionIndex] = selectedOption;
    });
  }

  void _submitQuiz() {
    int tempScore = 0;

    for (int i = 0; i < quizData.length; i++) {
      if (selectedAnswers[i] == quizData[i]['answer']) {
        tempScore++;
      }
    }

    setState(() {
      score = tempScore; 
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quiz Complete'),
          content: Text('Your score is: $score / ${quizData.length}'),
          actions: <Widget>[
            TextButton(
              child: const Text('Try Again'),
              onPressed: () {
                setState(() {
                  selectedAnswers.clear();
                  score = 0; 
                });

                _scrollController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );

                Navigator.of(context).pop();  
              },
            ),
            TextButton(
              child: const Text('Exit'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Content'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController, 
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(quizData.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(quizData[index]['image']),
                        SizedBox(height: 16),
                        Text(
                          quizData[index]['question'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        ...quizData[index]['options'].map<Widget>((option) {
                          return RadioListTile<String>(
                            title: Text(option),
                            value: option,
                            groupValue: selectedAnswers[index], 
                            onChanged: (String? value) {
                              _onOptionSelected(index, value); 
                            },
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
              );
            }),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                onPressed: _submitQuiz,
                child: const Text('Submit Quiz'),
              ),
            ),
          ],
        ),
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
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app ),
          tooltip: 'Start Screen',

          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        backgroundColor: Color.fromRGBO(70, 29, 124, 1),
        title: Image.asset('images/gold_lsu_logo.png', height: 120, width: 240),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to LSU's Patrick F. Taylor Hall scavenger hunt!"),
            SizedBox(height: 15),
            Text("Follow the map and explore the rooms to learn"),
            Text("about LSU's engineering building and test your"),
            Text("knowledge with a quiz."),
            SizedBox(height: 30),
            Image.asset('images/Patrick-Taylor-Hall-1.jpeg'),
            SizedBox(height: 20),
            Text("Good luck!"),
          ],
        ),
      ),
    );
  }
}