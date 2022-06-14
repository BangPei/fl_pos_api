import 'package:fl_pos_app/router/app_router.dart';
import 'package:fl_pos_app/router/app_routers.dart';
import 'package:fl_pos_app/screen/masterMenu/uom/bloc/uom_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AppRouter appRouter = AppRouter(
      routes: NavigateTo.routes,
      notFoundHandler: NavigateTo.routeNotFoundHandler,
    );
    appRouter.setupRoutes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UomBloc>(create: (BuildContext context) => UomBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'POS APP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRouter.router.generator,
      ),
    );
  }
}
