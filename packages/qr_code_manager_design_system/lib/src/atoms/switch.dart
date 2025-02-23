import 'package:flutter/material.dart';
import 'package:qr_code_manager_design_system/qr_code_manager_design_system.dart';

class QcmSwitch extends StatefulWidget {
  const QcmSwitch({super.key, this.value, this.onChanged});

  final bool? value;
  final ValueChanged<bool>? onChanged;

  @override
  State<QcmSwitch> createState() => _QcmSwitchState();
}

class _QcmSwitchState extends State<QcmSwitch> {
  bool _value = false;

  @override
  void initState() {
    _value = widget.value ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      thumbColor: WidgetStateProperty.all(Colors.white),
      activeColor: QcmColors.unitedNationsBlue,
      activeTrackColor: QcmColors.unitedNationsBlue,
      inactiveTrackColor: QcmColors.darkGunmeta,
      value: _value,
      onChanged: (newValue) {
        setState(() {
          _value = newValue;
          widget.onChanged?.call(newValue);
        });
      },
    );
  }
}
