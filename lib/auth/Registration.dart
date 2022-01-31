import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login2_page/auth/login.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation <double> _animation;
  late TextEditingController _emailController = TextEditingController(text: '');
  late TextEditingController _passwordController = TextEditingController(text: '');
  bool _obsecureText=true;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 20));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.linear)
      ..addListener(() {
        setState(() {

        });
      })..addStatusListener((animationStatus) {
        if (animationStatus == AnimationStatus.completed){
          _animationController.reset();
          _animationController.forward();
        }


      });
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: "https://www.online-image-editor.com/styles/2019/images/power_girl.png",
            placeholder: (context, url) => Image.asset('images/002.jpg',fit: BoxFit.fill,),
            errorWidget: (context, url, error) => Icon(Icons.error),
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: FractionalOffset(_animation.value, 0),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                SizedBox(height: size.height *0.1),
                Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent
                    )
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "don't have an account ",
                        style: TextStyle(
                            fontSize: 16,
                          fontWeight: FontWeight.bold,
                            color: Colors.black87
                        ),
                      ),
                      TextSpan(text: '    '),
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () =>
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>Register()
                            )),
                        text: 'Register',
                        style: TextStyle(
                            color: Color(0xff55efc4),
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  style: TextStyle(
                      color: Colors.black87
                  ),
                  decoration: InputDecoration(
                    hintText: "Email or UserName",
                    hintStyle:  TextStyle(
                        color: Color(0xff2d3436)
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xff00cec9)
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xff00cec9)
                      ),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.deepOrangeAccent
                      ),
                    ),
                  ),

                ),
                TextFormField(
                  obscureText: _obsecureText,
                  validator: (value){
                    if(value!.isEmpty || value.length<8){
                      return 'Please enter valid password';

                    }
                    else{
                      return null;
                    }


                  },
                  controller: _passwordController,
                  style: TextStyle(
                      color: Colors.white70
                  ),
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle:  TextStyle(
                        color: Color(0xff2d3436)
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xffe84393)
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xff00cec9)
                      ),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.red
                      ),
                    ),
                  ),

                ),
                SizedBox(height: 35,),

                FlatButton(
                  onPressed: (){},
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff3742fa),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
