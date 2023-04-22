import 'package:demo/screen/CategoriesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final myController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/667/667200.png?w=740&t=st=1682076945~exp=1682077545~hmac=1e806fb6d64e02b1d1cd5e37183ee857e954ed34787f531767e27cf8fcc1b04e',
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(
                width: 350,
                child: FormBuilderTextField(
                  name: 'email',
                  decoration: InputDecoration(
                    labelText: 'Email',
                    icon: Icon(Icons.email_outlined),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.email(context),
                  ]),
                ),
              ),
              SizedBox(
                width: 350,
                child: FormBuilderTextField(
                  name: 'password',
                  decoration: InputDecoration(
                      labelText: 'password',
                      icon: Icon(Icons.password_outlined),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0)),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.minLength(context, 6),
                  ]),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        print(_formKey.currentState!.value['email']);
                        print(_formKey.currentState!.value['password']);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Categories(name: 'Firmigo')));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 255, 178, 233),
                                    Colors.pink,
                                    Colors.pink,
                                    Colors.pink,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                          child: const Center(
                            child: Text(
                              "Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          )),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Register');
                },
                child: Text(
                  'Dont have an account ? Register!',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
