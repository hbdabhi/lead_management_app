import 'package:flutter/cupertino.dart';
import 'package:lead_management/db/db_helper.dart';
import '../model/lead.dart';

class LeadProvider with ChangeNotifier{
  List<Lead> _leads= [];
  List<Lead> get leads => _leads;

  Future<void> fatchLeads() async{
    final data = await DBHelper.instance.queryAll('leads');
    _leads = data.map((e)=> Lead.fromMap(e)).toList();
    notifyListeners();
  }
  Future<void> addLead(Lead lead) async{
    await DBHelper.instance.insert("leads", lead.toMap());
    await fatchLeads();
  }
  Future<void> editLead(Lead lead) async{
    await DBHelper.instance.update("leads", lead.toMap(), lead.id!);
    await fatchLeads();
  }
  Future<void> deleteLead(int id) async{
    await DBHelper.instance.delete("leads", id);
    await fatchLeads();
  }
  Lead? getLeadById(int id) {
    try {
      return _leads.firstWhere((lead) => lead.id == id);
    } catch (e) {
      return null;
    }
  }

}