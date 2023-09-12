import 'package:flutter/material.dart';
import 'dart:async';

class AccountSettings extends StatefulWidget {
  AccountSettings({super.key});
  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  Timer? debounce;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _emailValid = true;
  bool _passwordValid = true;
  bool _isPasswordVisible = true;
  String password = '';
  String email = '';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Photo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primary,
                    hintText: 'yourEmail@example.com',
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    suffixIcon: _emailController.text.isEmpty
                        ? Container(
                            width: 0,
                          )
                        : IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () => _emailController.clear(),
                          ),
                    errorText:
                        _emailValid ? null : 'Please enter a valid email',
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  onFieldSubmitted: (value) => setState(() {
                    ///ketika klik done dipojok keyboard
                    this.email = value;
                  }),
                  onChanged: (String value) {
                    if (debounce?.isActive ?? false) debounce?.cancel();
                    debounce = Timer(Duration(milliseconds: 500), () {
                      setState(() {
                        _emailValid = validateEmail(value) == null;
                        this.email = value;
                      });
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: _isPasswordVisible,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primary,
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                    ),
                    suffixIcon: IconButton(
                      icon: _isPasswordVisible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: () => setState(
                        () {
                          _isPasswordVisible = !_isPasswordVisible;
                        },
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    errorText: _passwordValid
                        ? null
                        : 'Password must be at least 8 characters long',
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  onFieldSubmitted: (value) => setState(
                    () {
                      this.password = value;
                    },
                  ),
                  onChanged: (value) {
                    if (debounce?.isActive ?? false) debounce?.cancel();
                    debounce = Timer(
                      Duration(milliseconds: 500),
                      () {
                        setState(
                          () {
                            _passwordValid = validatePassword(value) == null;
                            this.password = value;
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              child: Text('Submit',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground)),
              onPressed: () {
                setState(() {
                  _emailController.clear();
                  _passwordController.clear();
                });
              },
            )
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
