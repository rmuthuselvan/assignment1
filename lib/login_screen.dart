import 'package:flutter/material.dart';
import 'main_page.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) {
    if (_emailController.text == 'test@stanch.io' &&
        _passwordController.text == 'Test@123') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful!')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid credentials!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Promilo',
          style: TextStyle(
            color: Colors.black, 
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80),
                  Text(
                    'Hi, Welcome Back!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 22, 2, 125),
                    ),
                  ),
                  SizedBox(height: 40),
                  _buildEmailField(),
                  SizedBox(height: 10),
                  _buildPasswordField(),
                  _buildRememberAndForgotPasswordRow(),
                  SizedBox(height: 20),
                  _buildSubmitButton(context),
                  SizedBox(height: 20),
                  _buildOrDivider(),
                  _buildSocialMediaIcons(),
                  SizedBox(height: 20),
                  _buildFooterLinks(),
                ],
              ),
            ),
          ),
          _buildTermsAndConditions(),
        ],
      ),
    );
  }
  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Please Sign in to continue',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 81, 52, 225),
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter Email or Mob No.',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Sign In With OTP',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 16, 5, 172),
              ),
            ),
          ),
        ),
      ],
    );
  }



  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 81, 52, 225),
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter Password',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRememberAndForgotPasswordRow() {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (bool? value) {}),
        Text('Remember Me'),
        Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'Forget Password',
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 16, 5, 172),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () => _login(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, 
          ),
          child: Text(
            'Submit',
            style: TextStyle(
              color: Colors.white, 
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrDivider() {
    return Column(
      children: [
        Text('or', style: TextStyle(color: Colors.grey)),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSocialMediaIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon('assets/google.png'),
        SizedBox(width: 8),
        _buildSocialIcon('assets/linkedin.png'),
        SizedBox(width: 8),
        _buildSocialIcon('assets/facebook.png'),
        SizedBox(width: 8),
        _buildSocialIcon('assets/instagram.png'),
        SizedBox(width: 8),
        _buildSocialIcon('assets/whatsapp.png'),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: 45,
        height: 45,
        child: IconButton(
          icon: Image.asset(assetPath),
          onPressed: () {
            
          },
        ),
      ),
    );
  }



  Widget _buildFooterLinks() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Business User? '),
            Text('Don’t have an account? '),
          ],
        ),
        SizedBox(height: 8), 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {}, 
              child: Text('Login Here'),
            ),
            TextButton(
              onPressed: () {}, 
              child: Text('Sign Up'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTermsAndConditions() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'By continuing, you agree to ',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          GestureDetector(
            onTap: () {
            
            },
            child: Text(
              'Promilo’s Terms of Use & Privacy Policy.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
