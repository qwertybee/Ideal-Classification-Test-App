import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future changeUserDetailAlert(BuildContext context, User user) async {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _confirmEmail = TextEditingController();

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Please enter a valid email address';
    else
      return null;
  }

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
        "Change user details",
        style: TextStyle(fontSize: 24.0),
      ),
      content:
      Container(
        height: 450,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Container(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              " New name",
                            ),
                          ),
                          TextFormField(
                            controller: _name,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'New name',
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              " New e-mail",
                            ),
                          ),
                          TextFormField(
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'New e-mail',
                            ),
                            validator: (value) {
                              if ((value == null || value.isEmpty) && _confirmEmail.text.isNotEmpty) {
                                return 'Please confirm the new email';
                              }
                              validateEmail(value);
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Confirm e-mail",
                            ),
                          ),
                          TextFormField(
                            controller: _confirmEmail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Confirm new e-mail',
                            ),
                            validator: (value) {
                              if ((value == null || value.isEmpty) && _email.text.isNotEmpty) {
                                return 'Please confirm the new email';
                              }
                              else if (value != _email.text){
                                return 'Email do not match';
                              }
                              validateEmail(value);
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
                      if(_email.text.isNotEmpty){
                        try {
                          user.updateEmail(_email.text);
                          Navigator.pop(context);
                        } catch (e) {
                          print(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text(
                                'Failed to change e-mail, please try again later.')),);
                        }
                      }
                      if(_name.text.isNotEmpty){
                        try {
                          user.updateDisplayName(_name.text);

                        } catch (e) {
                          print(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text(
                                'Failed to change display name, please try again later.')),);
                        }
                      }

                      if(_name.text.isNotEmpty && _email.text.isNotEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Name & E-mail changed!')),);
                      }
                      else if (_name.text.isNotEmpty && _email.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Name changed!')),);
                      }
                      else if (_name.text.isEmpty && _email.text.isNotEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('E-mail changed!')),);
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('No changes made!')),);

                      }
                      Navigator.pop(context);
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