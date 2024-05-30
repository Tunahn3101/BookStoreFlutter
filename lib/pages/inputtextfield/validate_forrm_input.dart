import 'package:flutter/material.dart';

class ValidateFormInput extends StatefulWidget {
  const ValidateFormInput({super.key});

  @override
  State<ValidateFormInput> createState() => _ValidateFormInputState();
}

class _ValidateFormInputState extends State<ValidateFormInput> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // phương thức hiển thị dialog lỗi

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text('Error'),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'))
              ],
            ));
  }

  void _validateAndSubmit() {
    if (_formkey.currentState!.validate()) {
      print('Form is valid');
    } else {
      _showErrorDialog('Please correct the errors in the forrm');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validate Form'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return 'Password must be at least 6 characters long.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _validateAndSubmit,
                  child: const Text('Submit'),
                ),
              ],
            ),
          )),
    );
  }
}
