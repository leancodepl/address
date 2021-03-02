import 'package:address/address.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _countryController =
      TextEditingController.fromValue(TextEditingValue(text: 'US'));
  final _formLangController =
      TextEditingController.fromValue(TextEditingValue(text: 'en'));

  final _nameController = TextEditingController();
  final _addressLine1Controller = TextEditingController();
  final _addressLine2Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _zoneController = TextEditingController();
  final _postalCodeController = TextEditingController();

  final _displayLangController =
      TextEditingController.fromValue(TextEditingValue(text: 'en'));

  Map<AddressFormField, TextEditingController> get _formFieldToControllerMap =>
      {
        AddressFormField.fullName: _nameController,
        AddressFormField.addressLine1: _addressLine1Controller,
        AddressFormField.addressLine2: _addressLine2Controller,
        AddressFormField.city: _cityController,
        AddressFormField.zone: _zoneController,
        AddressFormField.postalCode: _postalCodeController,
      };

  @override
  void initState() {
    super.initState();
    _countryController
        .addListener(() => setState(() => _zoneController.text = ''));
    _formLangController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final addressFormatter = AddressFormatter(_formLangController.text);
    final formFormat = addressFormatter.formatForm(_countryController.text);

    return Scaffold(
      appBar: AppBar(
        title: Text('Addresses example'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _countryController,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(
              labelText: 'Address country (ISO 3166-1 alpha-2)',
              helperText: 'US, CA, AU, PL, FR, IT, ES...',
            ),
          ),
          TextField(
            controller: _formLangController,
            textCapitalization: TextCapitalization.none,
            decoration: InputDecoration(
              labelText: 'Form language (ISO 639-1)',
              helperText: 'en, fr, pl, es...',
            ),
          ),
          const Divider(height: 48),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final field in formFormat)
                if (field.availableValues != null)
                  DropdownButtonFormField<String>(
                    value: _formFieldToControllerMap[field.type]!.text,
                    onChanged: (value) {
                      if (value == null) return;
                      _formFieldToControllerMap[field.type]!.text = value;
                    },
                    items: [
                      DropdownMenuItem(value: '', child: const SizedBox()),
                      for (final value in field.availableValues!.entries)
                        DropdownMenuItem(
                          value: value.key,
                          child: Text(value.value),
                        ),
                    ],
                    decoration: InputDecoration(
                      labelText: field.label,
                      helperText: field.description,
                    ),
                  )
                else
                  TextField(
                    controller: _formFieldToControllerMap[field.type],
                    decoration: InputDecoration(
                      labelText: field.label,
                      helperText: field.description,
                    ),
                  ),
            ],
          ),
          const Divider(height: 48),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _displayLangController,
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                    labelText: 'Display language (ISO 639-1)',
                    helperText: 'en, fr, pl, es...',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  final formatter =
                      AddressFormatter(_displayLangController.text);

                  final address = Address(
                    country: _countryController.text,
                    fullName: _nameController.text,
                    addressLine1: _addressLine1Controller.text,
                    addressLine2: _addressLine2Controller.text,
                    city: _cityController.text,
                    zone: _zoneController.text,
                    postalCode: _postalCodeController.text,
                  );

                  final displayFormatted = formatter.formatDisplay(address);

                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(displayFormatted.join('\n')),
                    ),
                  );
                },
                child: Text('FORMAT DISPLAY'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _countryController.dispose();
    super.dispose();
  }
}
