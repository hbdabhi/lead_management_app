import 'package:flutter/material.dart';
import 'package:lead_management/provider/lead_provider.dart';
import 'package:provider/provider.dart';

import '../model/lead.dart';

class EditLead extends StatefulWidget {
  EditLead({super.key, required this.id});

  int? id;

  @override
  State<EditLead> createState() => _EditLeadState();
}

TextEditingController name_controller = TextEditingController();
TextEditingController number_controller = TextEditingController();
TextEditingController description_controller = TextEditingController();
final _key = GlobalKey<FormState>();
String statusValue = "New";

class _EditLeadState extends State<EditLead> {
  @override
  Widget build(BuildContext context) {
    final lead = Provider.of<LeadProvider>(context).getLeadById(widget.id ?? 0);
    number_controller.text = lead!.Number!;
    name_controller.text = lead.Name!;
    description_controller.text = lead.Description!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Lead Details",
          style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.w600,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.tealAccent, Colors.greenAccent],
            ),
          ),
        ),
      ),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name ...",
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  controller: name_controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name required";
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Phone Number ...",
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  controller: number_controller,
                  keyboardType: TextInputType.numberWithOptions(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Number required";
                    }
                  },
                ),
                SizedBox(height: 20,),
                DropdownMenu<String>(
                  width: double.infinity,
                  label: Text("Status..."),
                  inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                  ),
                  initialSelection: statusValue,
                  onSelected: (value){
                    setState(() {
                      statusValue = value!;
                    });
                  },
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: "New", label: "New"),
                    DropdownMenuEntry(value: "Lost", label: "Lost"),
                    DropdownMenuEntry(value: "Contacted", label: "Contacted"),
                    DropdownMenuEntry(value: "Converted", label: "converted"),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Description ...",
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  controller: description_controller,
                  minLines: 2,
                  maxLines: 3,
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      final lead = Lead(
                        id: widget.id,
                        Name: name_controller.text,
                        Number: number_controller.text,
                        Status: statusValue,
                        Description: description_controller.text,
                      );
                      Provider.of<LeadProvider>(
                        context,
                        listen: false,
                      ).editLead(lead);
                      int cnt = 0;
                      Navigator.popUntil(context, (route) => cnt++ >=2,);
                    }
                  },
                  child: Text("Update"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
