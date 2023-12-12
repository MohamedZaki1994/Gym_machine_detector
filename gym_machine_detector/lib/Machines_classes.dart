enum MachineClasses {
  seatedMidRow(0),
  seatedCableRow(1),
  cableLatPulldown(2),
  machineLatPulldown(3),
  chestSupportedTBarRow(4),
  landmineTBarRow(5),
  machineReverseFly(6),
  undefined(1000);

  const MachineClasses(this.value);
  final int value;

  factory MachineClasses.fromValue(int value) {
    return values.firstWhere((e) => e.value == value,
        orElse: () => MachineClasses.undefined);
  }
}

extension MachinesClassesExt on MachineClasses {
  String get name {
    switch (this) {
      case MachineClasses.seatedMidRow:
        return 'Seated mid row';
      case MachineClasses.seatedCableRow:
        return 'Seated cable row';
      case MachineClasses.cableLatPulldown:
        return 'Cable lat pulldown';
      case MachineClasses.machineLatPulldown:
        return 'Machine lat pulldown';
      case MachineClasses.chestSupportedTBarRow:
        return 'Chest supported T-bar Row';
      case MachineClasses.landmineTBarRow:
        return 'Landmine T-Bar row';
      case MachineClasses.machineReverseFly:
        return 'Machine reverse fly';
      case MachineClasses.undefined:
        return 'Undefined';
    }
  }
}
