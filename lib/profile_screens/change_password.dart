import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future changePasswordAlert(BuildContext context, User user) async {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  return showDialog(
    context: context,
    builder: (context) => StatefulBuilder(builder: (context, setState) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            20.0,
          ),
        ),
      ),
      contentPadding: EdgeInsets.only(
        top: 10.0,
      ),
      title: Text(
        "Change password",
        style: TextStyle(fontSize: 24.0),
      ),
      content:
      Container(
        height: 350,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  " New password",
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            controller: _pass,
                            obscureText: !_passwordVisible,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'New password',
                              suffixIcon: IconButton(
                                icon: Icon(_passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a new password';
                              }
                              else if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Confirm password",
                            ),
                          ),
                          TextFormField(
                            controller: _confirmPass,
                            obscureText: !_confirmPasswordVisible,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Confirm new password',
                                suffixIcon: IconButton(
                                  icon: Icon(_confirmPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _confirmPasswordVisible = !_confirmPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm the new password';
                              }
                              else if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              else if (value != _pass.text){
                                return 'Password do not match';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      try {
                        user.updatePassword(_pass.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Password changed!')),);
                        Navigator.pop(context);
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text(
                              'Failed to change password, please try again later.')),);
                      }

                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    // fixedSize: Size(250, 50),
                  ),
                  child: Text(
                    "Submit",
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    // fixedSize: Size(250, 50),
                  ),
                  child: Text(
                    "Cancel",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )
    ),
  );
}