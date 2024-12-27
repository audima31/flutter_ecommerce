import 'package:flutter/material.dart';

class RealtimeDatabasePage extends StatefulWidget {
  const RealtimeDatabasePage({super.key});

  @override
  State<RealtimeDatabasePage> createState() => _RealtimeDatabasePageState();
}

class _RealtimeDatabasePageState extends State<RealtimeDatabasePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Realtime Database'),
      ),
      body: Column(
        children: const [
          // Display data here in the future
          Text('Data'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return myDialogBo(
                  context: context,
                  name: 'Create Items',
                  address: 'Add',
                  onPressed: () {
                    // Logic to save data
                    Navigator.pop(context);
                  },
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // Common dialog box
  Dialog myDialogBo({
    required BuildContext context,
    required String name,
    required String address,
    required VoidCallback onPressed,
  }) {
    return Dialog(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close, color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Enter the name',
                hintText: 'e.g., John',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Enter the address',
                hintText: 'e.g., Jakarta 12345',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
