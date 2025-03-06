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

// roblotics lab page
class RoboticsLabPage extends StatelessWidget {
  const RoboticsLabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Robotics Lab')),
    );
  }
}

// capstone gallery page
class CapstoneGalleryPage extends StatelessWidget {
  const CapstoneGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Capstone Gallery')),
    );
  }
}

// cheveron center page
class ChevronCenterPage extends StatelessWidget {
  const ChevronCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chevron Center')),
    );
  }
}
