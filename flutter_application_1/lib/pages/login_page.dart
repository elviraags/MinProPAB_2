import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {

  final VoidCallback toggleTheme;

  const LoginPage({super.key, required this.toggleTheme});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final supabase = Supabase.instance.client;

  void login() async {

    try {

      await supabase.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );

    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Login"),
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: widget.toggleTheme,
          )
        ],
      ),

      body: Container(

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: Center(

          child: Container(

            padding: const EdgeInsets.all(20),
            width: 320,

            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  obscureText: true,
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: login,
                    child: const Text("Login"),
                  ),
                ),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterPage()),
                    );
                  },
                  child: const Text(
                    "Belum punya akun? Register",
                    style: TextStyle(color: Colors.white),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}