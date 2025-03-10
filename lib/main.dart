import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: HomeScreen()));
}

// main homescreen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // entrance choice popup
  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(20), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), 
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20), 
                child: Image.asset(
                  'images/patrickentrances.png', 
                  fit: BoxFit.contain, 
                  width: MediaQuery.of(context).size.width * 0.7, 
                  height: MediaQuery.of(context).size.height * 0.587, 
                ),
              ),
              Positioned(
                bottom: 0, 
                left: 0,
                child: _buildButton(
                  context,
                  const Firstfloor(),
                  width: 545.0,
                  height: 1000.0, 
                ),
              ),
              Positioned(
                bottom: 0, 
                right: 0,
                child: _buildButton(
                  context,
                  Firstfloor(isRightButton: true), 
                  width: 545.0, 
                  height: 1000.0, 
                ),
              ),
            ],
          ),
        );
      },
    );
  }

// start homepage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateAndDisplaySelection(context),
              child: const Text("Start"),
            ),
          ],
        ),
      ),
    );
  }
}

// first floor
class Firstfloor extends StatelessWidget {
  final bool isRightButton;

  const Firstfloor({super.key, this.isRightButton = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                isRightButton ? 'images/patrickmap2.png' : 'images/patrickmap.png', 
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 208,
              right: 426,
              child: _buildButton(context, const RoboticsLabPage(), isHomeScreenButton: false),
            ),
            Positioned(
              top: 245,
              right: 473,
              child: _buildButton(context, const CapstoneGalleryPage(), isHomeScreenButton: false),
            ),
            Positioned(
              top: 293,
              right: 447,
              child: _buildButton(context, const ChevronCenterPage(), isHomeScreenButton: false),
            ),
            Positioned(
              top: 58,
              right: 550,
              child: _buildButton(context, const CivilEngLabPage(), isHomeScreenButton: false),
            ),
            Positioned(
              bottom: 159,
              right: 448,
              child: _buildButton(context, const CambreAtriumPage(), isHomeScreenButton: false),
            ),
            Positioned(
              bottom: 137,
              right: 658,
              child: _buildButton(context, const OperationLabPage(), isHomeScreenButton: false),
            ),
            Positioned(
              bottom: 144,
              left: 519,
              child: _buildButton(context, const BASFLabPage(), isHomeScreenButton: false),
            ),
            Positioned(
              top: 143,
              left: 531,
              child: _buildButton(context, const MechanicalEngLabPage(), isHomeScreenButton: false),
            ),
            Positioned(
              top: 272,
              left: 412,
              child: _buildButton(context, const CommonsPage(), isHomeScreenButton: false),
            ),
            Positioned(
              top: 239,
              right: 731,
              child: _buildButton(context, const Secondfloor(), isHomeScreenButton: false),
            ),
            Positioned(
              bottom: 129,
              right: 738,
              child: _buildButton(context, const Secondfloor(), isHomeScreenButton: false),
            ),
            Positioned(
              top: 290,
              right: 523,
              child: _buildButton(context, const Secondfloor(), isHomeScreenButton: false, width: 175.0, height: 37.0),
            ),
            Positioned(
              top: 234,
              right: 523,
              child: _buildButton(context, const Secondfloor(), isHomeScreenButton: false, width: 175.0, height: 37.0),
            ),
          ],
        ),
      ),
    );
  }
}

// second floor
class Secondfloor extends StatelessWidget {
  const Secondfloor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'images/patrickmap2floor.png',
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 163,
              right: 729,
              child: _buildButton(context, const BIMLab(), isHomeScreenButton: false),
            ),
            Positioned(
              bottom: 229,
              left: 668,
              child: _buildButton(context, const PROTOLab(), isHomeScreenButton: false),
            ),
            Positioned(
              bottom: 335,
              right: 600,
              child: _buildButton(context, const DrivingLab(), isHomeScreenButton: false),
            ),
            Positioned(
              top: 276,
              right: 452,
              child: _buildButton(context, const BrookeshireSuite(), isHomeScreenButton: false),
            ),
            Positioned(
              bottom: 61,
              left: 565,
              child: _buildButton(context, const AnnexLab(), isHomeScreenButton: false),
            ),
            Positioned(
              top: 242,
              right: 683,
              child: _buildButton(context, const Firstfloor(), isHomeScreenButton: false),
            ),
            Positioned(
              bottom: 121,
              right: 717,
              child: _buildButton(context, const Firstfloor(), isHomeScreenButton: false),
            ),
            Positioned(
              top: 280,
              right: 549,
              child: _buildButton(context, const Firstfloor(), isHomeScreenButton: false, width: 120.0, height: 35.0),
            ),
            Positioned(
              top: 227,
              right: 549,
              child: _buildButton(context, const Firstfloor(), isHomeScreenButton: false, width: 120.0, height: 35.0),
            ),
          ],
        ),
      ),
    );
  }
}

// button style
Widget _buildButton(BuildContext context, Widget destinationPage, {double width = 40.0, double height = 40.0, bool isHomeScreenButton = false}) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destinationPage),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent, 
      shadowColor: Colors.transparent, 
      minimumSize: Size(width, height),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.transparent), 
      ),
    ),
    child: const SizedBox.shrink(),
  );
}

// pages

// first floor pages
class RoboticsLabPage extends StatelessWidget {
  const RoboticsLabPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Robotics Lab'),
        backgroundColor: const Color.fromARGB(255, 131, 174, 194), 
        centerTitle: true, 
        elevation: 0, 
        titleTextStyle: TextStyle(
          fontSize: 28, 
          fontWeight: FontWeight.bold, 
          color: Colors.white, 
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 131, 174, 194), 
        child: Padding(
          padding: const EdgeInsets.all(85.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/robotics-lab.jpg',  
                width: 700.0,  
                height: 500.0, 
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 36), 
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'The College of Engineering offers a minor in robotics and provides a lab space to support this program. '
                    'Some of the equipment housed in this lab include a hydraulic robotic arm; robotic vehicles, such as spiders and crawlers; and a mini humanoid robot named “Darwin.” ',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CapstoneGalleryPage extends StatelessWidget {
  const CapstoneGalleryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Capstone Gallery')));
  }
}

class ChevronCenterPage extends StatelessWidget {
  const ChevronCenterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Chevron Center')));
  }
}

class CivilEngLabPage extends StatelessWidget {
  const CivilEngLabPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Civil Engineering Lab')));
  }
}

class CambreAtriumPage extends StatelessWidget {
  const CambreAtriumPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Cambre Atrium & Donor Wall')));
  }
}

class OperationLabPage extends StatelessWidget {
  const OperationLabPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('DOW Chemical Unit Operations Lab')));
  }
}

class BASFLabPage extends StatelessWidget {
  const BASFLabPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('BASF Sustainable Living Lab')));
  }
}

class MechanicalEngLabPage extends StatelessWidget {
  const MechanicalEngLabPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Mechanical Engineering Labs')));
  }
}

class CommonsPage extends StatelessWidget {
  const CommonsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('The Commons')));
  }
}


// second floor pages
class BIMLab extends StatelessWidget {
  const BIMLab({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BIM Lab'),
        backgroundColor: const Color.fromARGB(255, 131, 174, 194), 
        centerTitle: true, 
        elevation: 0, 
        titleTextStyle: TextStyle(
          fontSize: 28, 
          fontWeight: FontWeight.bold, 
          color: Colors.white, 
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 131, 174, 194), 
        child: Padding(
          padding: const EdgeInsets.all(85.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/BIMlab.jpg',  
                width: 700.0,  
                height: 500.0, 
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 36), 
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'The MMR Building Information Modeling Laboratory is utilized by construction management students and was specially designed and constructed by our faculty. '
                    'The lab space consists of 44 4K displays that allow for three-dimensional and computer-generated views of building plans. This allows students and faculty to virtually visit building sites to make assessments, alter plans, and consider concerns like safety and maintenance. '
                    'In addition to this unique lab space, the Bert S. Turner Department of Construction Management has several labs and classrooms on the third floor, including an estimating and scheduling lab, a room with several CATS equipment simulators, and an advanced materials lab.',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class PROTOLab extends StatelessWidget {
  const PROTOLab({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROTO Lab'),
        backgroundColor: const Color.fromARGB(255, 131, 174, 194), 
        centerTitle: true, 
        elevation: 0, 
        titleTextStyle: TextStyle(
          fontSize: 28, 
          fontWeight: FontWeight.bold, 
          color: Colors.white,
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 131, 174, 194),
        child: Padding(
          padding: const EdgeInsets.all(85.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/Proto.jpg',  
                width: 700.0, 
                height: 500.0, 
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 36), 
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'The Mark and Carolyn Guidry Electrical Engineering Laboratory Duplex houses a microprocessor interfacing lab and a proto lab. '
                    'This space is used by students to fabricate circuit boards and create device prototypes. It is designed as a chemistry lab with fume hoods to allow students to safely handle chemicals required for circuitry and is fully outfitted with soldering stations, cutting machines, and 3D printers. '
                    'Additionally, the lighting and windows are designed to filter out UV light, which would interfere with the process of layering circuit boards. This lab duplex was made possible by College of Engineering alumni Mark and Carolyn Guidry, whose unique story is provided on the nearby purple placard.',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class DrivingLab extends StatelessWidget {
  const DrivingLab({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Civil Engineering Driving Simulator Lab'),
        backgroundColor: const Color.fromARGB(255, 131, 174, 194), 
        centerTitle: true, 
        elevation: 0, 
        titleTextStyle: TextStyle(
          fontSize: 28, 
          fontWeight: FontWeight.bold, 
          color: Colors.white,
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 131, 174, 194), 
        child: Padding(
          padding: const EdgeInsets.all(85.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/Drivinglab.jpg',  
                width: 700.0,  
                height: 500.0, 
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 36), 
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'The Civil Engineering Driving Simulator Laboratory allows students and faculty to research driving behaviors, environments, and traffic. Equipped with multiple screens, projectors, and blackout curtains, this lab gives our researchers the ability to test drive on new roadways and study drivers’ reactions to unexpected obstacles and events. '
                    'Recent research projects include the outcomes of distracted driving, the effects of various weather conditions, and how drivers might interact with a semi-autonomous driving system.',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class BrookeshireSuite extends StatelessWidget {
  const BrookeshireSuite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brookeshire Student Services Suite'),
        backgroundColor: const Color.fromARGB(255, 131, 174, 194),
        centerTitle: true, 
        elevation: 0, 
        titleTextStyle: TextStyle(
          fontSize: 28, 
          fontWeight: FontWeight.bold, 
          color: Colors.white, 
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 131, 174, 194), 
        child: Padding(
          padding: const EdgeInsets.all(85.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/Brookeshire.jpg', 
                width: 700.0,  
                height: 500.0, 
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 36), 
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'The Dr. William A. Brookshire Student Services Suite is a “go-to” first stop for most students who have questions or need help with the administrative and academic demands that come with being a college student. '
                    'The Office of Student Services provides many resources, as well as academic advisors, all of whom are licensed professional counselors, to help with things like changing majors, adding a minor, and verifying how course credits have transferred from other institutions. '
                    'This suite also houses other professional staff, including an engineering career coach, recruiting and outreach staff.',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.justify, 
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class AnnexLab extends StatelessWidget {
  const AnnexLab({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Annex/Drilling Fluids Lab'),
        backgroundColor: const Color.fromARGB(255, 131, 174, 194), 
        centerTitle: true, 
        elevation: 0, 
        titleTextStyle: TextStyle(
          fontSize: 28, 
          fontWeight: FontWeight.bold,
          color: Colors.white, 
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 131, 174, 194), 
        child: Padding(
          padding: const EdgeInsets.all(85.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/Annex.jpg',  
                width: 700.0,  
                height: 500.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 36),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'This particular petroleum engineering space is the Drilling Fluids Laboratory. Drilling fluids are the mixtures of water, clay, minerals and chemicals used by petroleum engineers to maintain pressure within a well, clean and lubricate drill bits and bore holes, and transport cuttings and debris to the surface. '
                    'Since each well is unique, petroleum engineers must tailor the chemical and physical properties of drilling fluids to each well’s geology in order to control pressures and maintain safety. Petroleum engineers use many different methods and types of equipment to measure and adjust drilling fluids including mud balances, filter presses, and viscometers. '
                    'This lab provides a space for students to gain hands-on experience with this type of equipment so they are well-prepared for work in the field.',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.justify, 
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


