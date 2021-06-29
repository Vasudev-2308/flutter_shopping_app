import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool ostext = true;
  bool change = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        change = true;
      });
      await Future.delayed(Duration(seconds: 2));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        change = false;
      });
    } else {
      setState(() {
        change = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              Container(
                
                child: Image.asset(
                  'assets/images/loginim.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome",
                style: TextStyle(fontSize: 28),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          labelText: "Email",
                        ),
                        validator: (value) {
                          if (value!.isEmpty){
                            return "Email can't be Empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: ostext,
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                            suffixIcon: IconButton(
                              icon: ostext?Icon(CupertinoIcons.eye_slash, color: context.accentColor,)
                              :Icon(CupertinoIcons.eye, color: context.accentColor,),
                              onPressed: () {
                                setState(() {
                                  ostext = !ostext;
                                });
                              },
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password can't be empty";
                          } else if (value.length < 6) {
                            return "Required atleast 6 Charecters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Material(
                        color: context.theme.buttonColor,
                        borderRadius: BorderRadius.circular(change ? 100 : 50),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          splashColor: Colors.blue,
                          child: AnimatedContainer(
                            duration: Duration(seconds: 2),
                            width: change
                                ? 75
                                : MediaQuery.of(context).size.width * 0.7,
                            height: change ? 75 : 50,
                            alignment: Alignment.center,
                            child: change
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 40,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
