import 'package:destini_app/story_brain.dart';
import 'package:flutter/material.dart';

StoryBrain storyBrain = StoryBrain();

void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  void updateStoryState({required int choiceNumber}) {
    setState(() {
      storyBrain.nextStory(choiceNumber: choiceNumber);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.png"), fit: BoxFit.cover),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      storyBrain.getStory(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextButton(
                    onPressed: () {
                      updateStoryState(choiceNumber: 1);
                    },
                    child: Text(
                      storyBrain.getChoice1(),
                      style: TextStyle(
                          color: Colors
                              .white), //overall padding 40(acts as margin w.r.t textbutton)
                    ),
                    style: ButtonStyle(
                        // padding: MaterialStateProperty.all(
                        //     EdgeInsets.symmetric(vertical: 15)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5,
                      bottom:
                          35), //overall padding 40(acts as margin w.r.t textbutton)
                  child: Visibility(
                    visible: storyBrain.isButtonVisible(),
                    child: TextButton(
                      onPressed: () {
                        updateStoryState(choiceNumber: 2);
                      },
                      child: Text(
                        storyBrain.getChoice2(),
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          // padding: MaterialStateProperty.all(
                          //     EdgeInsets.symmetric(vertical: 15)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                    ),
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
