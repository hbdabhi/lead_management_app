import 'package:flutter/material.dart';
import 'package:lead_management/provider/lead_provider.dart';
import 'package:provider/provider.dart';

import '../model/lead.dart';

class AddLead extends StatefulWidget {
  const AddLead({super.key});

  @override
  State<AddLead> createState() => _AddLeadState();
}

class _AddLeadState extends State<AddLead> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController number_controller = TextEditingController();
  TextEditingController description_controller = TextEditingController();
  final _key = GlobalKey<FormState>();
  String statusValue = "New";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          "Add Lead Details",
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
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Name ...",
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
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Phone Number ...",
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
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description ...",
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
                SizedBox(height: 40,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if(_key.currentState!.validate()){
                      final lead = Lead(
                        Name : name_controller.text,
                        Number : number_controller.text,
                        Status : statusValue,
                        Description : description_controller.text,
                      );
                      Provider.of<LeadProvider>(context,listen: false).addLead(lead);
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
