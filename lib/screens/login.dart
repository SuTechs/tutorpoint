import 'package:flutter/material.dart';
import 'package:tutorpoint/constants.dart';
import 'package:tutorpoint/data/bloc/loginBloc.dart';
import 'package:tutorpoint/screens/home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/login.png',
            fit: BoxFit.fitHeight,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: LoginField(
              onLogin: (email, pass) async {
                final success = await LoginBloc().login(email, pass);

                if (success)
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => NavigationHome()),
                      (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LoginField extends StatefulWidget {
  final Future<void> Function(String email, String pass) onLogin;

  const LoginField({Key key, @required this.onLogin}) : super(key: key);
  @override
  _LoginFieldState createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isPasswordVisible = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// email
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                cursorColor: kBlueColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: kBlueColor,
                  ),
                  hintText: 'email',
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value != '' && !isValidEmail(value))
                    return 'Invalid email';
                  return null;
                },
              ),
            ),

            /// password
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: _passController,
                obscureText: !isPasswordVisible,
                cursorColor: kBlueColor,
                decoration: InputDecoration(
                  hintText: "Password",
                  icon: Icon(
                    Icons.lock,
                    color: kBlueColor,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    child: Icon(
                      isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: kBlueColor,
                    ),
                  ),
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value.trim().length < 1) return 'Invalid Password';

                  return null;
                },
              ),
            ),

            /// login button
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  color: kBlueColor,
                  onPressed: () async {
                    if (isLoading || !_formKey.currentState.validate()) return;

                    setState(() {
                      isLoading = true;
                    });

                    await widget.onLogin(
                        _emailController.text, _passController.text);

                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: isLoading
                      ? SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

bool isValidEmail(String email) {
  final String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final RegExp regExp = RegExp(p);

  return regExp.hasMatch(email);
}
