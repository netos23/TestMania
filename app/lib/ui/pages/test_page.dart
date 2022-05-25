import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(),
      body: SafeArea(
        child: SizedBox.expand(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                shadowColor: null,
                expandedHeight: 160.0,
                flexibleSpace: Center(
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: double.infinity,
                      // mainAxisExtent: ,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      return FloatingActionButton(
                        onPressed: () {},
                        child: Text('$index'),
                      );
                    },
                    itemCount: 20,
                  ),
                ),
              ),
              // SliverGrid(
              //     delegate: SliverChildBuilderDelegate(
              //           (context, index) {
              //         return FloatingActionButton(
              //           onPressed: () {},
              //           child: Text('$index'),
              //         );
              //       },
              //       childCount: 20,
              //     ),
              //     gridDelegate:
              // ),
              const SliverToBoxAdapter(
                child: Placeholder(),
              ),
              const SliverToBoxAdapter(
                child: Placeholder(),
              ),
              const SliverToBoxAdapter(
                child: Placeholder(),
              ),
              const SliverToBoxAdapter(
                child: Placeholder(),
              ),
              const SliverToBoxAdapter(
                child: Placeholder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
