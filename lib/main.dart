import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: HomeScreen()));
}

// main home screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Firstfloor()),
    );
    print(result);
  }

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
  const Firstfloor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // map image
            Positioned.fill(
              child: Image.asset(
                'images/patrickmap.png',
                fit: BoxFit.contain,
              ),
            ),
            // buttons for different locations
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

//pages
class RoboticsLabPage extends StatelessWidget {
  const RoboticsLabPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Robotics Lab')));
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

class BIMLab extends StatelessWidget {
  const BIMLab({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('BIM Lab')));
  }
}

class PROTOLab extends StatelessWidget {
  const PROTOLab({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('PROTO Lab')));
  }
}

class DrivingLab extends StatelessWidget {
  const DrivingLab({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Driving Lab')));
  }
}

class BrookeshireSuite extends StatelessWidget {
  const BrookeshireSuite({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Brookeshire Student Services Suite')));
  }
}

class AnnexLab extends StatelessWidget {
  const AnnexLab({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Annex/Drilling Fluids Lab')));
  }
}
