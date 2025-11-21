import 'package:flutter/material.dart';
import 'package:lead_management/provider/lead_provider.dart';
import 'package:lead_management/screens/edit_lead.dart';
import 'package:provider/provider.dart';

class ShowLead extends StatefulWidget {
  ShowLead({super.key, required this.id});

  int? id;

  @override
  State<ShowLead> createState() => _ShowLeadState();
}

class _ShowLeadState extends State<ShowLead> {
  @override
  Widget build(BuildContext context) {
    final lead = Provider.of<LeadProvider>(context).getLeadById(widget.id ?? 0);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lead Details",
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
                border: BoxBorder.all(color: Colors.black),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Name Of Lead :",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    softWrap: true,
                    lead!.Name.toString(),
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
                border: BoxBorder.all(color: Colors.black),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Number Of Lead : ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    softWrap: true,
                    lead!.Number.toString(),
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
                border: BoxBorder.all(color: Colors.black),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Status of Lead: ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    softWrap: true,
                    lead!.Status.toString(),
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Lead Description:",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    lead!.Description.toString(),
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    softWrap: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => EditLead(id: widget.id),)).then((value) {
                        setState(() {
                        });
                      },);
                  },
                  child: Text("Update"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    showConformationBox(context);
                  },
                  child: Text("Delete"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> showConformationBox(BuildContext context) async {
    return await showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Text("Delete"),
          content: Text("Are you Sure to Delete This Lead ? "),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[500],
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Provider.of<LeadProvider>(context, listen: false).deleteLead(
                    widget.id!);
                int count = 0;
                Navigator.popUntil(context, (route) => count++ >= 2);
              },
              child: Text("Yes"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[500],
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No"),
            ),
          ],
        ));
  }
}
