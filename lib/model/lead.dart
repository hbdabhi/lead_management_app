class Lead{
  int? id;
  String? Name ;
  String? Number ;
  String? Status;
  String? Description ;

  Lead({
    this.id,
    required this.Name,
    required this.Number,
    required this.Status,
    required this.Description
  });

  Map<String,dynamic> toMap(){
    return {
      'Name': Name,
      'Number' : Number,
      'Status' : Status,
      'Description' : Description
    };
  }
  factory Lead.fromMap(Map<String, dynamic> map){
    return Lead(
      id: map['id'],
      Name: map['Name'],
      Number: map['Number'],
      Status: map['Status'],
      Description: map['Description'],
    );
  }
}