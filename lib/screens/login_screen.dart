import 'dart:async';
import 'dart:ui';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _emailValid = true;
  bool _passwordValid = true;
  bool _isPasswordVisible = true;
  String password = '';
  String email = '';
  Timer? debounce;

  @override
  void dispose() {
    debounce?.cancel();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.blueGrey,
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 48),
            minimumSize: const Size(double.infinity, 48),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFF1E6FF),
          iconColor: Colors.blueGrey,
          prefixIconColor: Colors.blueGrey,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => setState(() => Navigator.of(context).pop()),
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Blur(
              blur: 10.0,
              blurColor: Colors.black,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1607748851687-ba9a10438621?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Theme(
                      data: ThemeData(
                        textTheme: GoogleFonts.pacificoTextTheme().copyWith(
                          displayLarge: TextStyle(
                            color: Colors.grey[800],
                          ),
                          displayMedium: TextStyle(
                            color: Colors.grey[800],
                          ),
                          bodyLarge: TextStyle(
                            color: Colors.grey[800],
                          ),
                          bodyMedium: TextStyle(
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      child: Text(
                        "Dubaniin",
                        style: GoogleFonts.pacifico(
                          color: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) =>
                                setState(() => this.email = value),
                            onChanged: (String value) {
                              if (debounce?.isActive ?? false)
                                debounce?.cancel();
                              debounce = Timer(Duration(milliseconds: 500), () {
                                setState(() {
                                  _emailValid = validateEmail(value) == null;
                                  this.email = value;
                                });
                              });
                            },
                            decoration: InputDecoration(
                              errorText: _emailValid
                                  ? null
                                  : 'Please enter a valid email',
                              errorStyle: TextStyle(
                                color: Colors.red[400],
                                fontWeight: FontWeight.bold,
                              ),
                              hintText: "Your email",
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(Icons.person),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: TextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              obscureText: _isPasswordVisible,
                              onFieldSubmitted: (value) =>
                                  setState(() => this.password = value),
                              onChanged: (value) {
                                if (debounce?.isActive ?? false)
                                  debounce?.cancel();
                                debounce = Timer(
                                  Duration(milliseconds: 500),
                                  () => setState(
                                    () {
                                      _passwordValid =
                                          validatePassword(value) == null;
                                      this.password = value;
                                    },
                                  ),
                                );
                              },
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() => _isPasswordVisible =
                                        !_isPasswordVisible);
                                  },
                                  child: _isPasswordVisible
                                      ? Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Icon(
                                            Icons.visibility,
                                            size: 24,
                                          ),
                                        )
                                      : Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Icon(
                                            Icons.visibility_off,
                                            size: 24,
                                          ),
                                        ),
                                ),
                                errorText: _passwordValid
                                    ? null
                                    : 'Password must be at least 8 characters long',
                                errorStyle: TextStyle(
                                  color: Colors.red[400],
                                  fontWeight: FontWeight.bold,
                                ),
                                hintText: "Your password",
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Icon(Icons.lock),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Hero(
                            tag: "login_btn",
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Login".toUpperCase(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Don’t have an Account ? ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Container();
                                      },
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    if (MediaQuery.of(context).viewInsets.bottom == 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 26.0,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  "https://i.ibb.co/7WBNQ3M/281764.png",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 26.0,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  "https://i.ibb.co/ThDwmPF/145802.png",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }
}
