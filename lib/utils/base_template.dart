import 'package:fl_pos_app/utils/base_left_drawer.dart';
import 'package:fl_pos_app/utils/capitalize.dart';
import 'package:fl_pos_app/widget/default_title.dart';
import 'package:fl_pos_app/widget/fomr_control.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
abstract class BaseTemplate extends StatefulWidget {
  String title;
  bool? showSubtitle;
  BaseTemplate({Key? key, required this.title, this.showSubtitle = true})
      : super(key: key);
}

abstract class BaseTemplateState<T> extends State<BaseTemplate>
    with TickerProviderStateMixin {
  static const double _size = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const LeftDrawer(
            size: _size,
            isAdmin: true,
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: const Color.fromRGBO(237, 237, 237, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: PopupMenuButton(
                            offset: const Offset(0, 30),
                            child: Row(
                              children: [
                                Text(Capitalize.text("Username")),
                                const SizedBox(width: 5),
                                const Icon(Icons.people),
                              ],
                            ),
                            itemBuilder: (context) {
                              return <PopupMenuEntry>[
                                PopupMenuItem(
                                  child: Center(
                                    child: Container(
                                      padding: const EdgeInsets.all(25),
                                      constraints:
                                          const BoxConstraints(minWidth: 180),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const CircleAvatar(),
                                          Text(Capitalize.text("Username")),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                    child: ListTile(
                                  leading: const Icon(Icons.password,
                                      color: Colors.grey),
                                  title: const Text("Change Password"),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        var newPass = TextEditingController(),
                                            oldPass = TextEditingController(),
                                            oldPassVerif =
                                                TextEditingController();
                                        bool viewOldPassword = true;
                                        bool viewRetypeOldPassword = true;
                                        bool viewNewPassword = true;
                                        return StatefulBuilder(
                                            builder: (context, setState) {
                                          return SimpleDialog(
                                            children: [
                                              const Center(
                                                child: Text("Change Password"),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: FormControl(
                                                  obscureText: viewOldPassword,
                                                  controller: oldPass,
                                                  title: "Old Password",
                                                  suffixIcon: IconButton(
                                                    icon: const Icon(
                                                      Icons.remove_red_eye,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        viewOldPassword =
                                                            !viewOldPassword;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: FormControl(
                                                  obscureText:
                                                      viewRetypeOldPassword,
                                                  controller: oldPassVerif,
                                                  title: "Re Type old Password",
                                                  suffixIcon: IconButton(
                                                    icon: const Icon(
                                                      Icons.remove_red_eye,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        viewRetypeOldPassword =
                                                            !viewRetypeOldPassword;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: FormControl(
                                                  controller: newPass,
                                                  obscureText: viewNewPassword,
                                                  title: "New Password",
                                                  suffixIcon: IconButton(
                                                    icon: const Icon(
                                                      Icons.remove_red_eye,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        viewNewPassword =
                                                            !viewNewPassword;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                  onPressed: () async {},
                                                  child: const Text("Submit"))
                                            ],
                                          );
                                        });
                                      },
                                    );
                                  },
                                )),
                                PopupMenuItem(
                                    child: ListTile(
                                  leading: const Icon(
                                    Icons.logout,
                                    color: Colors.red,
                                  ),
                                  title: const Text("Logout"),
                                  onTap: () {},
                                ))
                              ];
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black12,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultTitle(
                            widget.title,
                            showSubtitle: widget.showSubtitle,
                          ),
                          body(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(
                          width: 1,
                          color: Colors.grey[300]!,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(
                            Icons.copyright,
                            color: Colors.grey,
                          ),
                          Text(
                            "2022 TOKO SS Versi. 1.0.0",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget body();
}
