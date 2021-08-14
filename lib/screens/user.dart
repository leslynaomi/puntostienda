import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';
import 'package:puntotienda/consts/colors.dart';
import 'package:puntotienda/provider/user_provider.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreen createState() => _UserScreen();
}

class _UserScreen extends State<UserScreen> {
  bool _value = false;
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          elevation: 4,
          expandedHeight: 200,
          pinned: true,
          flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            top = constraints.biggest.height;
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      ColorsConst.starterColor,
                      ColorsConst.endColor,
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                centerTitle: true,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: top <= 110.0 ? 1.0 : 0,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            height: kToolbarHeight / 1.8,
                            width: kToolbarHeight / 1.8,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 1.0,
                                ),
                              ],
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            // 'top.toString()',
                            'Guest',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                background: Image(
                  image: AssetImage("assets/images/computer_user.jpg"),
                  // NetworkImage(
                  //     'https://i.pinimg.com/564x/61/2d/38/612d38034bb8ea4f566b0630e1c96f1d.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
        ),
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: usertitle('bolsa de usuario')),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Theme.of(context).splashColor,
                  child: ListTile(
                    onTap: () => Navigator.of(context).pushNamed('favoritos'),
                    title: Text('lista de deseos'),
                    trailing: Icon(Icons.chevron_right_rounded),
                    leading: Icon(Icons.favorite),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Theme.of(context).splashColor,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed('carrito');
                    },
                    title: Text('Carrito'),
                    trailing: Icon(Icons.chevron_right_rounded),
                    leading: Icon(Icons.shopping_bag),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: usertitle('Informacion de usuario')),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              userListTitle('Nombre', context),
              userListTelefono('Numero de telefono', '+591', context),
              userEmail('Email', context),
              Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: usertitle('Configuracion de Usuario')),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTileSwitch(
                value: _value,
                leading: const Icon(Icons.message),
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
                switchActiveColor: Colors.teal,
                switchScale: 0.8,
                switchType: SwitchType.cupertino,
                title: const Text(
                  'Dark theme',
                ),
              ),
              userListexit('cerrar sesion', '', context),
            ],
          ),
        )
      ],
      // ),
    );
  }

  Widget userListTitle(String title, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () {},
          title: Text(title),
          subtitle: Text(Provider.of<UsuarioProvider>(context).getNombre),
          leading: Icon(Icons.account_circle),
        ),
      ),
    );
  }

  Widget userListTelefono(String title, String subtitle, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () {},
          title: Text(title),
          subtitle: Text(
              subtitle + Provider.of<UsuarioProvider>(context).getTelefono),
          leading: Icon(Icons.phone),
        ),
      ),
    );
  }

  Widget userEmail(String title, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () {},
          title: Text(title),
          subtitle: Text(Provider.of<UsuarioProvider>(context).getEmail),
          leading: Icon(Icons.email),
        ),
      ),
    );
  }

  Widget userListverdespues(
      String title, String subtitle, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () {},
          title: Text(title),
          subtitle: Text(subtitle),
          leading: Icon(Icons.watch_later),
        ),
      ),
    );
  }

  Widget userListexit(String title, String subtitle, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () {},
          title: Text(title),
          subtitle: Text(subtitle),
          leading: Icon(Icons.exit_to_app_rounded),
        ),
      ),
    );
  }

  Widget usertitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Informacion de Usuario',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
    );
  }
}
