import 'package:flutter/material.dart';

class HabitatsPage extends StatefulWidget {
  const HabitatsPage({super.key});

  @override
  _HabitatsPageState createState() => _HabitatsPageState();
}

class _HabitatsPageState extends State<HabitatsPage> {
  List<String> habitats = [
    'Home',
    'Office',
    'Classroom',
    'Gym'
  ]; // Default habitats

  // Helper function to show dialog for adding/editing habitats
  Future<void> _showHabitatDialog({String? currentName, int? index}) async {
    TextEditingController controller =
        TextEditingController(text: currentName ?? '');

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(currentName == null ? 'Add Habitat' : 'Edit Habitat'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter habitat name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without saving
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String newName = controller.text;
                if (newName.isNotEmpty) {
                  setState(() {
                    if (currentName == null) {
                      habitats.add(newName); // Add new habitat
                    } else {
                      habitats[index!] = newName; // Edit existing habitat
                    }
                  });
                }
                Navigator.of(context).pop(); // Close the dialog after saving
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Function to handle long press actions on habitats
  Future<void> _showHabitatOptionsDialog(int index) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Manage Habitat'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit'),
                onTap: () {
                  Navigator.of(context).pop();
                  _showHabitatDialog(
                      currentName: habitats[index],
                      index: index); // Edit habitat
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete'),
                onTap: () {
                  setState(() {
                    habitats.removeAt(index); // Delete habitat
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habitats'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Display 2 habitats per row
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: habitats.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () {
                _showHabitatOptionsDialog(index); // Show options on long press
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.lightGreenAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    habitats[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showHabitatDialog(); // Open dialog to add a new habitat
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
