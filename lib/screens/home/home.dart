import 'package:flutter/material.dart';
import 'package:google_agenda/models/contact.dart';
import 'package:google_agenda/provider/contacts.dart';
import 'package:google_agenda/style.dart';

class Home extends StatefulWidget {
  // Estado inicial da tela
  @override
  // HomeState -> TelaState
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus contatos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(
          Icons.add,
        ),
      ),
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          Contact contact = contacts.elementAt(index);
          return ListTile(
            leading: IconButton(
              icon: (contact.isFavorite)
              ? Icon(Icons.star)
              : Icon(Icons.star_outline),
              onPressed: (){
                setState(() {
                  contact.isFavorite = ! contact.isFavorite;
                });
              },
              color: blueTheme,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.chevron_right,
              ),
              color: grayTheme,
              onPressed: null,
            ),
            title: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    contact.photo,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                       contact.name,
                       style: TextStyle(
                       color: grayTheme,
                       fontSize: 14,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   Text(
                     contact.phone,
                     style: TextStyle(
                       color: grayTheme,
                       fontSize: 10,
                       fontWeight: FontWeight.bold,
                     ),
                   )
                 ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: contacts.length,
      ),
    );
  }
}
