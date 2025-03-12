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
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'images/purple.jpg',  
              fit: BoxFit.cover,    
            ),
            Container(
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Patrick Taylor Hall Scavenger Hunt', 
                    style: TextStyle(
                      fontSize: 32, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.white, 
                      letterSpacing: 2, 
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40), 
                  ElevatedButton(
                    onPressed: () => _navigateAndDisplaySelection(context),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.deepPurple, 
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), 
                      ),
                    ),
                    child: const Text(
                      "Start", 
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Robotics Lab'),
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
                'images/Robotics.jpg',  
                width: 700.0,  
                height: 500.0, 
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 36),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'The College of Engineering offers a minor in robotics and provides a lab space to support this program. Some of the equipment housed in this lab include a hydraulic robotic arm; robotic vehicles, such as spiders and crawlers; and a mini humanoid robot named “Darwin.”',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capstone Gallery'),
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
                'images/Capstone.jpg',  
                width: 700.0,  
                height: 500.0, 
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 36),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'Welcome to Patrick F. Taylor Hall, home to the LSU College of Engineering. Named after 1959 petroleum engineering graduate, Patrick F. Taylor, '
                    'it is the largest academic building in the state of Louisiana and one of the largest free-standing College of Engineering buildings in the United States. '
                    'As a result of our recent 114-million renovation and expansion, this building is now more than 400,000 square feet and provides students and faculty with state-of-the-art classrooms and labs. '
                    'It also serves as the central hub for the College of Engineering’s eight academic departments, which educate thousands of undergraduate and graduate students each year.',
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


class ChevronCenterPage extends StatelessWidget {
  const ChevronCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chevron Center'),
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
                'images/Chevron.jpg',  
                width: 700.0,  
                height: 500.0, 
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 36),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'The Chevron Center for Engineering Education is one of three studios that support a university-wide program called Communication Across the Curriculum, '
                    'which was started in 2005 by a chemical engineering alum. The program focuses on improving four areas of communication: written, spoken, visual, and technological, '
                    'while deepening student learning of course content. This space has 3D printers, large format printers, and many electronic devices that students may rent to complete class projects. '
                    'Students who take the required number of communication-intensive courses and complete a senior portfolio can graduate as a Distinguished Communicator. The College of Engineering is proud '
                    'to graduate the most Distinguished Communicators each year, thanks in large part to this space and the professional staff who run it.',
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


class CivilEngLabPage extends StatelessWidget {
  const CivilEngLabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Civil Engineering Lab'),
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
                'images/Civil.jpg', 
                width: 700.0,  
                height: 500.0, 
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 36),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'In this section of Patrick F. Taylor Hall, you will find most of our civil engineering student labs. Here, our students test concrete for strength and damage, '
                    'test and create asphalt, test the chemical composition and strength of soils, and study the strength of metal and timber.',
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


class CambreAtriumPage extends StatelessWidget {
  const CambreAtriumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambre Atrium & Donor Wall'),
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
                'images/Cambre.jpg',  
                width: 700.0,  
                height: 500.0, 
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 36),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'The Cambre Atrium is one of three main common spaces in Patrick F. Taylor Hall. It connects what was the existing old building to a newly built, three-story lab annex. '
                    'A number of chemical engineering labs run the length of the Cambre Atrium on one side, and classrooms line the other, ranging in size from about 30 seats up to 150 seats. '
                    'The largest classroom space in the building is the RoyOMartin Auditorium, which holds up to 250 students. Across from the doors to the RoyOMartin Auditorium, you’ll find the Donor Wall, '
                    'which recognizes the names of donors and industry partners who, along with funds from the state of Louisiana, helped make the renovation of Patrick F. Taylor Hall possible.',
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


class OperationLabPage extends StatelessWidget {
  const OperationLabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DOW Chemical Unit Operations Lab'),
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
                'images/Operation.jpg',  
                width: 700.0,  
                height: 500.0, 
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 36),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'The Dow Chemical Unit Operations Laboratory is a learning lab housed within the Cain Department of Chemical Engineering. '
                    'It contains various pieces of equipment that are designed to complete specific “unit operations.” A unit operation is a single step in a chemical process, such as separation, crystallization, oxidation, etc. '
                    'For instance, the first machine on the left is an Ethylene Oxidation Reactor, which, as the name suggests, oxidizes ethylene into ethylene oxide, a common compound found in laundry detergents.',
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

class BASFLabPage extends StatelessWidget {
  const BASFLabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BASF Sustainable Living Lab'),
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
                'images/BASF.jpg',  
                width: 700.0,  
                height: 500.0, 
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 36),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'The BASF Sustainable Living Laboratory was funded by a 1 million donation from BASF. The flooring, paint, and ceiling in this lab are all made from BASF products. '
                    'The lab space is dedicated to research investigating sustainable solutions to meet global challenges. The current researcher-in-residence, Dr. Jimmy Lawrence, studies and develops new functional polymers and nanoscale composites for healthcare, energy, environmental, and other industrial applications.',
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

class MechanicalEngLabPage extends StatelessWidget {
  const MechanicalEngLabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mechanical Engineering Labs'),
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
                'images/Mechanical.jpg',  
                width: 700.0,  
                height: 500.0, 
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 36),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'This section of Patrick F. Taylor Hall is home to many student-focused lab spaces for mechanical and industrial engineering, '
                    'including the human factors, thermal systems, materials, and instrumentation labs. Within these labs, you will find equipment '
                    'like a wind tunnel, tensile strength testers, and 3D-motion analysis systems.',
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


class CommonsPage extends StatelessWidget {
  const CommonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Commons'),
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
                'images/Commons.jpg',  
                width: 700.0,  
                height: 500.0, 
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 36), 
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'This atrium space is aptly named “The Commons” and serves as the main gathering space for everyone in Patrick F. Taylor Hall. '
                    'Students frequent this space between classes, not only because of the Panera Bread, but also because of the nearby Dow Student Leadership Incubator, '
                    'which serves as a meeting and storage space for the more than 40 student organizations that are part of our college.',
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

