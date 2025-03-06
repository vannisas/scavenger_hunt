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
      MaterialPageRoute(builder: (context) => const SelectionScreen()),
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

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

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
              child: _buildButton(context, const RoboticsLabPage()),
            ),
            Positioned(
              top: 245,
              right: 473,
              child: _buildButton(context, const CapstoneGalleryPage()),
            ),
            Positioned(
              top: 293,
              right: 447,
              child: _buildButton(context, const ChevronCenterPage()),
            ),
            Positioned(
              top: 58,
              right: 550,
              child: _buildButton(context, const CivilEngLabPage()),
            ),
            Positioned(
              bottom: 159,
              right: 448,
              child: _buildButton(context, const CambreAtriumPage()),
            ),
            Positioned(
              bottom: 137,
              right: 658,
              child: _buildButton(context, const OperationLabPage()),
            ),
            Positioned(
              bottom: 144,
              left: 519,
              child: _buildButton(context, const BASFLabPage()),
            ),
                Positioned(
              top: 143,
              left: 531,
              child: _buildButton(context, const MechanicalEngLabPage()),
            ),
                Positioned(
              top: 272,
              left: 412,
              child: _buildButton(context, const CommonsPage()),
            ),
          ],
        ),
      ),
    );
  }

// functions to create navigation button
  Widget _buildButton(BuildContext context, Widget destinationPage) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        minimumSize: const Size(40, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.transparent),
        ),
      ),
      child: const SizedBox.shrink(),
    );
  }
}

class RoboticsLabPage extends StatelessWidget {
  const RoboticsLabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Robotics Lab')),
    );
  }
}

class CapstoneGalleryPage extends StatelessWidget {
  const CapstoneGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Capstone Gallery')),
    );
  }
}

class ChevronCenterPage extends StatelessWidget {
  const ChevronCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chevron Center')),
    );
  }
}

class CivilEngLabPage extends StatelessWidget {
  const CivilEngLabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Civil Engineering Lab')),
    );
  }
}

class CambreAtriumPage extends StatelessWidget {
  const CambreAtriumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cambre Atrium & Donor Wall')),
    );
  }
}

class OperationLabPage extends StatelessWidget {
  const OperationLabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DOW Chemical Unit Operations Lab')),
    );
  }
}

class BASFLabPage extends StatelessWidget {
  const BASFLabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BASF Sustainable Living Lab')),
    );
  }
}

class MechanicalEngLabPage extends StatelessWidget {
  const MechanicalEngLabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mechanical Egineering Labs')),
    );
  }
}

class CommonsPage extends StatelessWidget {
  const CommonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The Commons')),
    );
  }
}