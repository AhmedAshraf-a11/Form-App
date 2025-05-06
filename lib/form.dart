import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String firstName = '';
  String lastName = '';
  String? gender;
  bool? termsAndConditions = false;
  bool darkMode = false;
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  bool validation = false;
  submit() {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      validation = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Form app"),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (text) {
                if (text!.isEmpty || text.length > 10) {
                  return "text is not valid";
                }
                firstName = text;
              },
              decoration: InputDecoration(label: Text("First Name")),
            ),
            SizedBox(height: 10),
            TextFormField(
              validator: (text) {
                if (text!.length < 3 || text.length > 10) {
                  return "text is not valid";
                }
                lastName = text;
              },
              decoration: InputDecoration(label: Text("last Name")),
            ),
            SizedBox(height: 10),
            RadioListTile(
              value: "Male",
              groupValue: gender,
              onChanged: (val) {
                setState(() {
                  gender = val;
                });
              },
              title: Text("Male"),
            ),
            RadioListTile(
              value: "Female",
              groupValue: gender,
              onChanged: (val) {
                setState(() {
                  gender = val;
                });
              },
              title: Text("Female"),
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text("Agree to terms and Conditions"),
              value: termsAndConditions,
              onChanged: (val) {
                setState(() {
                  termsAndConditions = val;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dark Mode"),
                SizedBox(width: 14),
                Switch(
                  value: darkMode,
                  onChanged: (val) {
                    setState(() {
                      darkMode = val;
                      print(val);
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  validation = false;
                });
                submit();
                if (validation == true &&
                    termsAndConditions == true &&
                    gender != null) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              print('ok');
                              Navigator.pop(context);
                            },
                            child: Text("ok"),
                          ),
                        ],
                        title: Text('User Info'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("First Name: $firstName"),
                            Text("Last Name: $lastName"),
                            Text("Gender: $gender"),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Error submiting form please enter valid data',
                      ),
                    ),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
