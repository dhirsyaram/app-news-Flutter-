import 'package:flutter/material.dart';
import 'package:wave_widget/wave_widget.dart';

class LoginWaves extends StatelessWidget {
  const LoginWaves({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 3.1416,
      child: WavesWidget(
        size: Size(MediaQuery.of(context).size.width, 400),
        amplitude: 40.0,
        frequency: 1.2,
        initialPhase: 0,
        waveLayers: const [
          WaveLayer.gradient(
            duration: 10000,
            heightFactor: 0.7,
            direction: -0.6,
            phaseOffset: 90,
            gradient: LinearGradient(
              colors: [Color(0x651E40AF), Color(0x851565C0)],
            ),
            waveShape: WaveShape.deepWaterGerstner(
              steepness: 0.35,
              depth: 1.8,
              windSpeed: 13.0,
            ),
          ),
          // Mid-surface layer - medium speed, rightward
          WaveLayer.gradient(
            duration: 7000,
            heightFactor: 0.65,
            direction: 0.9,
            phaseOffset: 180,
            gradient: LinearGradient(
              colors: [Color(0x701976D2), Color(0x901E3A8A)],
            ),
            waveShape: WaveShape.deepWaterGerstner(
              steepness: 0.4,
              depth: 1.3,
              windSpeed: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}
