import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class RealtimeDatabasePage extends StatefulWidget {
  const RealtimeDatabasePage({super.key});

  @override
  State<RealtimeDatabasePage> createState() => _RealtimeDatabasePageState();
}

//NGAMBIL DATA DARI FIREBASE REALTIME DATABASE, DARI TABLE "RealtimeDatabase"
final databaseRef = FirebaseDatabase.instance
    .ref('RealtimeDatabase/'); // Renamed to avoid conflict

final dataProduct = FirebaseDatabase.instance.ref('product/');

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
        //Read Data Firebase ----------------------------------------------------------------------------------
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: databaseRef,
              itemBuilder: (context, snapshot, animation, index) {
                final data = snapshot.value as Map<dynamic, dynamic>?;
                print('data ---------------------- $data');
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    leading: CircleAvatar(
                      child: Text(
                        (index + 1).toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    //TAMPILIN DATA NAMA DAN ADRESS DARI FIREBASE -----------------------------------
                    title: Text(
                      snapshot.child('name').value.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      snapshot.child('address').value.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    trailing: PopupMenuButton(
                      icon: const Icon(Icons.more_vert),
                      itemBuilder: (context) => [
                        // UPDATE DATA FIREBASE -----------------------------------------------------
                        PopupMenuItem(
                          value: 1,
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(
                                  context); // terminate after updating data

                              //Ngambil data nama dari Firebase, dan dikirim ke Variable _nameController - -------------------------------------------------------------
                              _nameController.text =
                                  snapshot.child("name").value.toString();
                              _addressController.text =
                                  snapshot.child("address").value.toString();
                              // End Ambil Data --------------------------------------------------------------

                              // ini buat form pas update data
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return myDialogBo(
                                    context: context,
                                    name: 'Update Items',
                                    address: 'Update',
                                    onPressed: () async {
                                      // Update data ke Firebase ---------------------------------------------
                                      try {
                                        final id = snapshot.key;

                                        print(
                                            'ID : ----------------------------- $id');

                                        await databaseRef.child(id!).update({
                                          'name':
                                              _nameController.text.toString(),
                                          'address': _addressController.text
                                              .toString(),
                                        });
                                        Navigator.pop(context);
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content:
                                                  Text('Update Failed: $e')),
                                        );
                                      }

                                      // Tutup dialog
                                    },
                                  );
                                },
                              );
                            },
                            leading: const Icon(Icons.edit),
                            title: const Text('Update'),
                          ),
                        ),

                        //DELETE FUNCTION FIREBASE -------------------------------------------------------
                        PopupMenuItem(
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              //Delete Function -------------------------------------------------------------
                              final id = snapshot.key;
                              databaseRef.child(id!).remove();
                            },
                            leading: const Icon(Icons.delete),
                            title: const Text('Delete'),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Clear text setiap kali membuka dialog
          _nameController.clear();
          _addressController.clear();

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return myDialogBo(
                context: context,
                name: 'Create Items',
                address: 'Add',
                onPressed: () {
                  // Validasi input
                  if (_nameController.text.isEmpty ||
                      _addressController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill all fields')),
                    );
                    return;
                  }

                  // Simpan data ke Firebase Realtime Database
                  final id = DateTime.now().millisecondsSinceEpoch.toString();
                  databaseRef.child(id).set({
                    'name': _nameController.text,
                    'address': _addressController.text,
                    'id': id,
                  });

                  // Tutup dialog
                  Navigator.pop(context);
                },
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

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
