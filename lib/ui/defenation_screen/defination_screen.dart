import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxtdart/api_servis/api_service.dart';
import 'package:rxtdart/controller/defination_controller.dart';

class DefinationScreen extends StatelessWidget {
  const DefinationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DefinationController controller =
        Get.put(DefinationController(apiService: ApiService()));

    String text = '';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Defination"),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Obx(
            () {
              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                          width: 320,
                          child: TextField(
                            onChanged: (v) {
                              text = v;
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.blue.shade100,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                )),
                          )),
                      IconButton(
                          color: Colors.black,
                          onPressed: () {
                            if (text.isNotEmpty) {
                              controller.getDefination(word: text);
                            }
                          },
                          icon: const Icon(Icons.search))
                    ],
                  ),
                  Expanded(
                    child: controller.defination.isEmpty
                        ? const Center(child: Text('Empty'))
                        : ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              ...List.generate(
                                  controller.defination.first.meanings!.first
                                      .definitions.length, (index) {
                                if (index == 0) {
                                  return Center(
                                    child:
                                        Text(controller.defination.first.word!),
                                  );
                                }
                                return Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      controller.defination.first.meanings!
                                          .first.definitions[index].definition,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                );
                              })
                            ],
                          ),
                  ),
                ],
              );
            },
          ),
          Align(
            child: Obx(() {
              return Visibility(
                visible: controller.isLoading.value,
                child: const CupertinoActivityIndicator(
                  color: Colors.black,
                  radius: 20,
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
