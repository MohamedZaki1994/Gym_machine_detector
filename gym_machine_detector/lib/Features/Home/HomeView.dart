import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'HomeBloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  File? imageFile;
  late final HomeBloc bloc;
  final picker = ImagePicker();
  TextEditingController urlController = TextEditingController();
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                TextField(
                  controller: urlController,
                  decoration: const InputDecoration(hintText: 'url'),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await pickImage();
                    },
                    child: const Text('upload a photo with a machine')),
                ElevatedButton(
                    onPressed: () async {
                      await getImageFromCamera();
                    },
                    child: const Text('take a photo')),
                imageFile != null
                    ? Image.file(
                        imageFile!,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                      )
                    : const Text('no image'),
                ElevatedButton(
                    onPressed: imageFile == null
                        ? null
                        : () async {
                            bloc.add(PredictEvent(
                                file: imageFile!,
                                urlString: urlController.text));
                          },
                    child: const Text('predict')),
                Text('${bloc.machineClass}')
              ],
            );
          },
        ),
      ),
    );
  }

  Future pickImage() async {
    try {
      var imageXFile = await picker.pickImage(source: ImageSource.gallery);
      if (imageXFile == null) return;

      setState(() {
        imageFile = File(imageXFile.path);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future getImageFromCamera() async {
    var imagexFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (imagexFile != null) {
        imageFile = File(imagexFile.path);
      }
    });
  }
}
