import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/dependency_injection/get_it.dart' as getIt;
import 'package:movie_app/presentation/provider/get_trending_provider.dart';
import 'package:movie_app/presentation/themes/theme_color.dart';
import 'package:provider/provider.dart';

import 'dependency_injection/get_it.dart';
import 'presentation/screen/movie_app.dart';
import 'presentation/widgets/movie_item_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  unawaited(getIt.init());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then(((_) {
    runApp(const MovieApp());
  }));
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (context) => getItInstance<GetTrendingProvider>(),
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Movie App',
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//           ),
//           home: TrendingMovieList(),
//         ));
//   }
// }

// class TrendingMovieList extends StatefulWidget {
//   @override
//   State<TrendingMovieList> createState() => _TrendingMovieListState();
// }

// class _TrendingMovieListState extends State<TrendingMovieList> {
//   bool _isInit = true;
//   late Future _fetchData;

//   Future<void> _getTrendingData() async {
//     try {
//       await Provider.of<GetTrendingProvider>(context, listen: false)
//           .GetTrendingData();
//     } catch (error) {
//       print(error);
//     }
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (_isInit) {
//       _fetchData = _getTrendingData();
//     }
//     _isInit = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.vulcan,
//       appBar: AppBar(
//         backgroundColor: AppColor.vulcan,
//         title: const Text(
//           'Trending Movies',
//           style: TextStyle(fontSize: 28),
//         ),
//         elevation: 0,
//         centerTitle: false,
//         actions: [
//           IconButton(
//               icon: const Icon(
//                 Icons.search,
//                 size: 30,
//               ),
//               onPressed: () {
//                 // showSearch(context: context, delegate: PokemonSearchDelegate());
//               }),
//           IconButton(
//               icon: const Icon(Icons.favorite_border, size: 30),
//               onPressed: () {
//                 // Navigator.of(context).push(
//                 //     MaterialPageRoute(builder: (ctx) => FavouriteScreen()));
//               })
//         ],
//       ),
//       body: FutureBuilder(
//         future: _fetchData,
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           return snapshot.connectionState == ConnectionState.waiting
//               ? const Center(child: CircularProgressIndicator())
//               : snapshot.hasError
//                   ? const Center(child: Text('Sorry data could not be loaded'))
//                   : Consumer<GetTrendingProvider>(
//                       builder: (ctx, data, child) {
//                         return RefreshIndicator(
//                             triggerMode: RefreshIndicatorTriggerMode.anywhere,
//                             onRefresh: () async {
//                               setState(() {
//                                 _fetchData = _getTrendingData();
//                               });
//                             },
//                             child: GridView.builder(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 4),
//                               gridDelegate:
//                                   const SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 2,
//                                       mainAxisSpacing: 10,
//                                       crossAxisSpacing: 10),
//                               itemCount: data.trendingMovieList.length,
//                               itemBuilder: (ctx, index) {
//                                 final movies = data.trendingMovieList[index];
//                                 //return Text(pokemon.title);
//                                 return TrendingMovieItem(
//                                   Movie: movies,
//                                 );
//                               },
//                             ));
//                       },
//                     );
//         },
//       ),
//     );
//   }
// }
