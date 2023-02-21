import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../components/book_item.dart';
import '../providers/home_provider.dart';
import '../utils/styles.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    var provider=Provider.of<HomeProvider>(context,listen: false);
    provider.loadData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: SvgPicture.asset(
                'assets/icons/menu.svg',
                color: Colors.white,
              ),
              splashRadius: 22,
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        centerTitle: true,
        title: Text('All Books', style: appBarTitle()),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              color: Colors.white,
            ),
            splashRadius: 22,
            onPressed: () => (){
              //showSearch(
              //               context: context,
              //               // delegate: Search(),
              //             ),
            }
          ),
        ],
      ),

      // drawer: MainDrawer(),
      body: Builder(
        builder: (context) {
          if(provider.progress){
            return Center(child: CircularProgressIndicator(),);
          }
          else{
            return GridView.builder(
                itemCount: provider.results.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 240,
                ),
                padding: EdgeInsets.all(15),
                itemBuilder: ((context, index) {
                  return DefaultBookItem(provider.results[index]);
                }));

          }
        }
      )
    );
  }
}
