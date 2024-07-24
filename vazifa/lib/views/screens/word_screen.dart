import 'package:dars_5_3_getx/controllers/word_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WordScreen extends StatefulWidget {
  WordScreen({super.key});

  @override
  State<WordScreen> createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  final wordController = Get.put(WordController());

  @override
  void initState() {
    super.initState();
    wordController.makeEmptyList();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text("Round ${wordController.curIndex.toInt() + 1}"),
          actions: [
            TextButton(
                onPressed: () {
                  wordController.next();
                },
                child: const Text("Skip Round"))
          ],
        ),
        body: wordController.checkWin == true.obs
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "YOU WON!!!\nANSWER WORD: ${wordController.wordList[wordController.curIndex.toInt()].join()}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  wordController.curIndex.toInt() ==
                          wordController.wordList.length - 1
                      ? const Text("Congratilations! You finish the game")
                      : const SizedBox(
                          height: 20,
                        ),
                  ElevatedButton(
                    onPressed: () {
                      wordController.next();
                    },
                    child: wordController.curIndex.toInt() ==
                            wordController.wordList.length - 1
                        ? const Text(
                            "Restart",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ],
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Points: ${wordController.point}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 130,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 6,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 15),
                            itemCount: wordController
                                .wordList[wordController.curIndex.toInt()]
                                .length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  wordController.cancelAnswerLetter(index);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      wordController.answer[index],
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          width: 350,
                          child: Text(
                            wordController
                                .questions[wordController.curIndex.toInt()],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 200,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                            itemCount: wordController.letters.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  wordController.changeLetter(index);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      wordController.letters[index],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
