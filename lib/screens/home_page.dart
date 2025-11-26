import 'package:flutter/material.dart';
import 'package:lead_management/provider/lead_provider.dart';
import 'package:lead_management/screens/add_lead.dart';
import 'package:lead_management/screens/show_lead.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<LeadProvider>(context, listen: false).fatchLeads();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LeadProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Mini Lead Manager",
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.w600,
            ),
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
      body: provider.leads.isEmpty
          ? Center(child: Text("No Lead Added",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),))
          : ListView.builder(
              itemCount: provider.leads.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person),),
                  title: Text(provider.leads[index].Name ?? ""),
                  subtitle: Text(provider.leads[index].Number ?? ""),
                  trailing: Text("Status : ${provider.leads[index].Status ?? ""}"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ShowLead(id: provider.leads[index].id ?? 0);
                    },));
                  },
                );
              },
            ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom:60 ,right:20),
        child: FloatingActionButton(
          backgroundColor: Colors.blue[800],
          foregroundColor: Colors.white,

          autofocus: true,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddLead();
                },
              ),
            ).then((value) {
              setState(() {});
            });
          },
        ),
      ),
    );
  }
}
