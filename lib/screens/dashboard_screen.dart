import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:pmsnb1/provider/flags_provider.dart';
import 'package:pmsnb1/provider/theme_provider.dart';
import 'package:pmsnb1/screens/list_post_cloud_screen.dart';
import 'package:pmsnb1/screens/list_post_screen.dart';
import 'package:pmsnb1/settings/styles.dart';
import 'package:pmsnb1/widgets/futures_modal.dart';
import 'package:pmsnb1/widgets/modal_add_post.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return Consumer<FlagsProvider>(
          builder: (context, flagsProvider, _) {
            return Scaffold(
              appBar: AppBar(
                title: Text('TecBook :)'),
              ),
              body: ListPostCloudScreen(),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () => openCustomeDialog(context, null),
                icon: Icon(Icons.add_comment),
                label: Text('Post it!'),
              ),
              drawer: Drawer(
                child: ListView(
                  children: [
                    UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://previews.123rf.com/images/dclipart/dclipart1611/dclipart161100025/68284221-logotipo-de-la-mascota-del-lince-jefe-de-lince-aislado-ilustraci%C3%B3n-vectorial-.jpg',
                        ),
                      ),
                      accountName: Text('Rubensin Torres Frias'),
                      accountEmail: Text('ruben.torres@itcelaya.edu.mx'),
                    ),
                    ListTile(
                      onTap: () => Navigator.pushNamed(context, '/popular'),
                      title: Text('API Movies'),
                      leading: Icon(Icons.movie),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    ListTile(
                      title: Text('Cambiar tema'),
                      trailing: DropdownButton<int?>(
                        value: themeProvider.selectedTheme,
                        onChanged: (int? value) {
                          if (value != null) {
                            themeProvider.setTheme(value);
                          }
                        },
                        items: const [
                          DropdownMenuItem<int?>(
                            value: 0,
                            child: Text('Tema Claro'),
                          ),
                          DropdownMenuItem<int?>(
                            value: 1,
                            child: Text('Tema Oscuro'),
                          ),
                          DropdownMenuItem<int?>(
                            value: 2,
                            child: Text('Tema Rojo'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
