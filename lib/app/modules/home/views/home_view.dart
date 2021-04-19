import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart';
import 'package:sample_project/controllers/controllers.dart';
import 'package:sample_project/controllers/user_controller.dart';
import 'package:sample_project/generated/graphql/api.graphql.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => ApiController.to.logout(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.bottomSheet(NewsSheet()),
        child: Icon(Icons.edit),
      ),
      body: Center(
        child: Container(
          height: Get.height,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Subscription(
                    builder: (result) {
                      if (result == null) {
                        return CircularProgressIndicator();
                      }
                      var r = NewsList$SubscriptionRoot.fromJson(result.data)
                          .news
                          .toList();
                      return Container(
                        child: ListView.builder(
                          itemCount: r.length,
                          itemBuilder: (context, i) {
                            // return Text(resultParse[index].title.toString());

                            return InkWell(
                              onTap: () => Get.dialog(
                                CardNews(
                                  content: r[i].content,
                                  createdAt: r[i].createdAt.toString(),
                                  id: r[i].id.toString(),
                                  title: r[i].title.toString(),
                                ),
                              ),
                              child: Container(
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            r[i].title.toString(),
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                        Text(r[i].content.length < 50
                                            ? r[i].content
                                            : r[i].content.substring(0, 50) +
                                                '...')
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    options: SubscriptionOptions(
                        document: controller.newsSubs.document),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsSheet extends StatelessWidget {
  NewsSheet({
    Key key,
  }) : super(key: key);
  final HomeController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: Get.height / 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                onChanged: (v) => c.title.value = v,
                decoration: InputDecoration(hintText: 'Заголовок'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                onChanged: (v) => c.content.value = v,
                decoration: InputDecoration(
                    hintText: 'Ваша новость', border: OutlineInputBorder()),
                maxLines: 6,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: TextButton.icon(
                  label: Text("Отправить"),
                  icon: Icon(Icons.send),
                  onPressed: () {
                    c.sendNews();
                    Get.back();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardNews extends StatelessWidget {
  const CardNews({
    this.content,
    this.createdAt,
    this.id,
    this.title,
    Key key,
  }) : super(key: key);

  final String title;
  final String content;
  final String createdAt;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            title,
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(content),
                          Divider(),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Create at: ' + createdAt.split(' ').first),
                          Text(
                            'Id: ' + id,
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
