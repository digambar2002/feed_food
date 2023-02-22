import 'package:flutter/material.dart';

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _email;
  late String _phoneNumber;
  late String _address;
  late int _quantity;
  late String _type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Food'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Enter your phone number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onSaved: (value) => _phoneNumber = value!,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  hintText: 'Enter your address',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
                onSaved: (value) => _address = value!,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Quantity',
                  hintText: 'Enter the quantity of food to donate',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the quantity';
                  }
                  return null;
                },
                onSaved: (value) => _quantity = int.parse(value!),
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Type of Food',
                ),
                value: _type,
                items: [
                  DropdownMenuItem(
                    child: Text('Non-perishable'),
                    value: 'Non-perishable',
                  ),
                  DropdownMenuItem(
                    child: Text('Perishable'),
                    value: 'Perishable',
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _type = value!;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select the type of food';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Container(
                width: double.infinity,
                height: 60.0,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
// send the donation information to the server
// or save it to the database
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
