// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:gym_machine_detector/Data/HomeRepo.dart';

import '../../Models/Machines_classes.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late final HomeRepo repo;
  String machineClass = MachineClasses.undefined.name;
  HomeBloc() : super(HomeInitial()) {
    repo = HomeRepo();
    on<HomeEvent>((event, emit) {});

    on<PredictEvent>(
      (event, emit) async {
        var machineId = await repo.uploadImage(event.file, event.urlString);
        machineClass = MachineClasses.fromValue(machineId).name;
        emit(HomeWithData(machine: machineClass));
      },
    );
  }
}

class HomeEvent {}

class PredictEvent extends HomeEvent {
  File file;
  String? urlString;
  PredictEvent({required this.file, this.urlString});
}

class HomeState {}

class HomeInitial extends HomeState {}

class HomeWithData extends HomeState {
  String machine;
  HomeWithData({
    required this.machine,
  });
}
