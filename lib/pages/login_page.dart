import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    // For now, just print the username and password
    print('Username: $username');
    print('Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'lib/images/bg_flavory.png',
              fit: BoxFit.cover,
            ),
          ),
          // Main Content with Padding
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -220, // Adjust this value to position the logo as needed
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'lib/images/logo_flavory.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  // Main Square Container
                  Container(
                    width: 319,
                    height: 349, // Adjusted height to accommodate content
                    decoration: const ShapeDecoration(
                      color: Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20), // Space at the top
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Username:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'JejuMyeongjo',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8), // Space between label and input
                          TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20), // Space between fields
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Password:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'JejuMyeongjo',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8), // Space between label and input
                          TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 20), // Space between fields
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Don't have an account? Sign up",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'JejuMyeongjo',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 'Login' Container Positioned on Top
                  Positioned(
                    top: -50,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: 319,
                      decoration: const BoxDecoration(
                        color: Color(0xFFC3C5C4),
                        border: Border(
                          top: BorderSide(color: Colors.black, width: 1),
                          left: BorderSide(color: Colors.black, width: 1),
                          right: BorderSide(color: Colors.black, width: 1),
                          bottom: BorderSide(color: Colors.black, width: 1),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(23),
                          topRight: Radius.circular(23),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontFamily: 'JejuMyeongjo',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Positioned Login Button below the container
                  Positioned(
                    top: 400, // Position just below the container
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      width: 319,
                      height: 50, // Set button height
                      child: ElevatedButton(
                        onPressed: _login, // Call the login function on press
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC3C5C4), // Set button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // Round corners
                            side: const BorderSide(color: Colors.black, width: 1), // Border style
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'JejuMyeongjo',
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
