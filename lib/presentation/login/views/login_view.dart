import 'package:app_news_flutter/presentation/login/widgets/login_waves.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.35,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: const [
                    Text("RAGDANews", style: TextStyle(fontSize: 24)),
                    SizedBox(height: 16),
                    Text("Please log into your account", style: TextStyle(fontSize: 24)),
                    SizedBox(height: 16),
                    TextField(decoration: InputDecoration(labelText: "Email")),
                    SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(labelText: "Password"),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(onPressed: null, child: Text("Login")),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            height: MediaQuery.of(context).size.height * 0.4,
            right: 0,
            left: 0,
            child: SizedBox(height: 80, child: LoginWaves()),
          ),
        ],
      ),
    );
  }
}
