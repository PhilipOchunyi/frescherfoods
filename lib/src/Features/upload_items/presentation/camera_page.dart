import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  // text fiedl controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _disorderController = TextEditingController();
  final TextEditingController _dateOfExpireController = TextEditingController();

  // collection name must be same as firebase collection name

  final CollectionReference _items =
      FirebaseFirestore.instance.collection("Upload_Items");

  String imageUrl = '';

  Future<void> _create() async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text("Create your Items"),
                ),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: 'Food', hintText: 'eg Milk'),
                ),
                TextField(
                  controller: _disorderController,
                  decoration: const InputDecoration(
                      labelText: 'Disorder Type', hintText: 'eg Lactos free'),
                ),
                TextField(
                  controller: _dateOfExpireController,
                  decoration: const InputDecoration(
                      labelText: 'Expiry Date', hintText: '10.07.2023'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () async {
                          // add the package image_picker
                          final file = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (file == null) return;

                          String fileName =
                              DateTime.now().microsecondsSinceEpoch.toString();

                          // Get the reference to storage root
                          // We create the image folder first and insider folder we upload the image
                          Reference referenceRoot =
                              FirebaseStorage.instance.ref();
                          Reference referenceDireImages =
                              referenceRoot.child('images');

                          // we have creata reference for the image to be stored
                          Reference referenceImageaToUpload =
                              referenceDireImages.child(fileName);

                          // For errors handled and/or success
                          try {
                            await referenceImageaToUpload
                                .putFile(File(file.path));

                            // We have successfully upload the image now
                            // make this upload image link in firebase database

                            imageUrl =
                                await referenceImageaToUpload.getDownloadURL();
                          } catch (error) {
                            //some error
                          }
                        },
                        icon: const Icon(Icons.camera_alt)),
                    GestureDetector(
                      onTap: () async {
                        final file = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (file == null) return;

                        String fileName =
                            DateTime.now().microsecondsSinceEpoch.toString();

                        // Get the reference to storage root
                        // We create the image folder first and insider folder we upload the image
                        Reference referenceRoot =
                            FirebaseStorage.instance.ref();
                        Reference referenceDireImages =
                            referenceRoot.child('images');

                        // we have creata reference for the image to be stored
                        Reference referenceImageaToUpload =
                            referenceDireImages.child(fileName);

                        // For errors handled and/or success
                        try {
                          await referenceImageaToUpload
                              .putFile(File(file.path));

                          // We have successfully upload the image now
                          // make this upload image link in firebase database

                          imageUrl =
                              await referenceImageaToUpload.getDownloadURL();
                        } catch (error) {
                          //some error
                        }
                      },
                      child: const Text("Gallery"),
                    )
                  ],
                )),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (imageUrl.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Please select and upload image")));
                        return;
                      }
                      final String name = _nameController.text;
                      final String disorder = _disorderController.text;
                      final String dateOfExpire = _dateOfExpireController.text;
                      if (name != "") {
                        await _items.add({
                          // Add items in you firebase firestore
                          "name": name,
                          "disorder": disorder,
                          "dateOfExpire": dateOfExpire,
                          "image": imageUrl,
                        });
                        _nameController.text = "";
                        _disorderController.text = "";
                        _dateOfExpireController.text = "";
                      }
                      Navigator.of(context).pop();
                    },
                    child: const Text('Create'),
                  ),
                )
              ],
            ),
          );
        });
  }

  // int index = 0;
  // Future<void> delete(itemId) async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection("Upload_Items")
  //         .doc(itemId.toString())
  //         .delete();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  late Stream<QuerySnapshot> _stream;
  @override
  void initState() {
    super.initState();
    _stream = FirebaseFirestore.instance.collection('Upload_Items').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add item disorder, if any, \n and it's expiry date",
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Some error occured${snapshot.error}"),
              );
            }
            // Now , Cheeck if datea arrived?
            if (snapshot.hasData) {
              QuerySnapshot querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot> document = querySnapshot.docs;

              // We need to Convert your documnets to Maps to display
              List<Map> items = document.map((e) => e.data() as Map).toList();

              //At Last, Display the list of items
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  // color: Colors.blueGrey, indent: 20.0, endIndent: 20.0)
                  const SizedBox(height: 0);

                  Map thisItems = items[index];
                  return ListTile(
                    title: Text(
                      "${thisItems['name']}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    subtitle: Text("${thisItems['disorder']}"),

                    //subtitle: Text("${thisItems['dateOkExpire']}"),
                    leading: CircleAvatar(
                      radius: 27,
                      child: thisItems.containsKey('image')
                          ? ClipOval(
                              child: Image.network(
                                "${thisItems['image']}",
                                fit: BoxFit.cover,
                                height: 70,
                                width: 70,
                              ),
                            )
                          : const CircleAvatar(),
                    ),
                    trailing: Text("${thisItems['dateOfExpire']}"),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          _create();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
