import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'RoboBob App',
    home: MainApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _DriveState();
}

enum Wheel { LEFT, RIGHT }

enum Direction { UP, DOWN }

class _DriveState extends State<Buttons> {
  int _rightWheelVelocity = 0;
  int _leftWheelVelocity = 0;

  void _changeVelocity({required Wheel wheel, required Direction dir}) {
    setState(() {
      switch (wheel) {
        case Wheel.LEFT:
          _leftWheelVelocity = dir == Direction.UP
              ? _leftWheelVelocity + 10
              : _leftWheelVelocity - 10;
          break;
        case Wheel.RIGHT:
          _rightWheelVelocity = dir == Direction.UP
              ? _rightWheelVelocity + 10
              : _rightWheelVelocity - 10;
          break;
      }
    });
  }

  void _stop() {
    setState(() {
      _rightWheelVelocity = 0;
      _leftWheelVelocity = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () =>
                    _changeVelocity(wheel: Wheel.LEFT, dir: Direction.UP),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(100, 50),
                ),
                child: const Text('UP'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () =>
                    _changeVelocity(wheel: Wheel.RIGHT, dir: Direction.UP),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(100, 50),
                ),
                child: const Text('UP'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('$_leftWheelVelocity mm/s'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('$_rightWheelVelocity mm/s'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () =>
                    _changeVelocity(wheel: Wheel.LEFT, dir: Direction.DOWN),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(100, 50),
                ),
                child: const Text('DOWN'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () =>
                    _changeVelocity(wheel: Wheel.RIGHT, dir: Direction.DOWN),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(100, 50),
                ),
                child: const Text('DOWN'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _stop,
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(220, 50),
              backgroundColor: const Color.fromARGB(255, 255, 0, 0),
            ),
            child: const Text('STOP'),
          ),
        ],
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('RoboBob App'),
      ),
      body: const Buttons(),
    );
  }
}
