import 'dart:async';
import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';

class BatteryScreen extends StatefulWidget {
  const BatteryScreen({super.key});

  @override
  State<BatteryScreen> createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<BatteryScreen> {
  final Battery _battery = Battery();
  int _batteryLevel = 100;
  BatteryState? _batteryState;
  StreamSubscription<BatteryState>? _batteryStateSubscription;

  @override
  void initState() {
    super.initState();
    _initBattery();
    _batteryStateSubscription = _battery.onBatteryStateChanged.listen((
      BatteryState state,
    ) {
      if (mounted) {
        setState(() {
          _batteryState = state;
        });
        _initBattery(); // refresh level on state change
      }
    });
  }

  Future<void> _initBattery() async {
    final int batteryLevel = await _battery.batteryLevel;
    if (mounted) {
      setState(() {
        _batteryLevel = batteryLevel;
      });
    }
  }

  @override
  void dispose() {
    _batteryStateSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Broadcast'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _batteryState == BatteryState.charging
                  ? Icons.battery_charging_full
                  : Icons.battery_full,
              size: 100,
              color: _batteryLevel > 20 ? Colors.green : Colors.red,
            ),
            const SizedBox(height: 20),
            Text(
              'Battery Level: $_batteryLevel%',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            if (_batteryState != null)
              Text(
                'State: ${_batteryState.toString().split('.').last}',
                style: const TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
