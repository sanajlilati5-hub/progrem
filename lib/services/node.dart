import 'package:supabase_flutter/supabase_flutter.dart';

class DataNode {
  final supa = Supabase.instance.client;
  create(String title,String content){
    supa.from("node").insert({"title":title,"content":content});
  }
  read(){}
  update(){}
  delete(){}
  
}
