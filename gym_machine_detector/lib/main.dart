import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_machine_detector/HomeView.dart';
import 'package:image_picker/image_picker.dart';

import 'HomeBloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gym Machine Detector',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Gym Machine Detector'),
          ),
          body: BlocProvider(
            create: (context) => HomeBloc(),
            child: const HomeView(),
          ),
        ));
  }
}

// Future<void> getLostData() async {
//   final ImagePicker picker = ImagePicker();
//   final LostDataResponse response = await picker.retrieveLostData();
//   if (response.isEmpty) {
//     return;
//   }
//   final List<XFile>? files = response.files;
//   if (files != null) {
//     _handleLostFiles(files);
//   } else {
//     _handleError(response.exception);
//   }
// }
