import 'package:flutter/material.dart';
import '../widgets/input.dart';
import '../widgets/header.dart';
import '../widgets/button.dart';
import 'package:get/get.dart';
import '../contexts/userContext.dart';
import '../utils/postBoardDetail.dart';
import '../screens/boardPage.dart';

class BoardContentController extends GetxController {
  var title = ''.obs;
  var content = ''.obs;

  setTitle(String val) => title.value = val;
  setContent(String val) => content.value = val;
}

class WriteBoardPage extends StatelessWidget {
  BoardContentController controller = Get.put(BoardContentController());
  Controller userController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {

    final header = buildHeader('글쓰기');
    final titleInput = buildInput('제목', null, null, controller.setTitle);
    final contentInput = buildInput('내용 입력', 400, null, controller.setContent);
    final button = buildButton('확인', () async {
      final response = await postBoardDetail(controller.title.value, controller.content.value, userController.id.value);
      print(response);
      final boardController = Get.find<BoardController>();
      await boardController.loadBoards();
      Get.toNamed('/board');
    });

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              header,
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        titleInput,
                        contentInput,
                        button,
                      ],
                    ),
                  ),
                ),
              ),
            ]
          ),
        ),
      )
    );
  }
}