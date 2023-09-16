import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> questions = [
    "Nervousness or shakiness inside",
    "Faintness or dizziness",
    "The idea that someone else can control your thoughts",
    "Feeling others are to blame for most of your troubles",
    "Trouble remembering things",
    "Feeling easily annoyed or irritated",
    "Pains in heart or chest",
    "Feeling afraid in open spaces or on the streets",
    "Thoughts of ending your life",
    "Feeling that most people cannot be trusted",
    "Poor appetite",
    "Suddenly scared for no reason",
    "Temper outbursts that you could not control",
    "Feeling blocked in getting things done",
    "Feeling lonely",
    "Feeling blue",
    "Feeling no interest in things",
    "Feeling fearful",
    "Your feelings being easily hurt",
    "Feeling that people are unfriendly or dislike you",
    "Nausea or upset stomach",
    "Feeling inferior to others",
    "Feeling that you are watched or talked about by others",
    "Trouble falling asleep",
    "Having to check and double-check what you do",
    "Difficulty making decisions",
    "Feeling afraid to travel on buses, subways, or trains",
    "Trouble getting your breath",
    "Hot or cold spells",
    "Having to avoid certain things, places, or activities because they frighten you",
    "Your mind going blank",
    "Numbness or tingling in parts of your body",
    "Feeling hopeless about the future",
    "Trouble concentrating",
    "Feeling weak in parts of your body",
    "Feeling tense or keyed up",
    "Thoughts of death or dying",
    "Having urges to beat, injure, or harm someone",
    "Having urges to break or smash things",
    "Feeling very self-conscious with others",
    "Feeling uneasy in crowds, such as shopping or at a movie",
    "Spells of terror or panic",
    "Getting into frequent arguments",
    "Feeling nervous when you are left alone",
    "Others not giving you proper credit for your achievements",
    "Feeling lonely even when you are with people",
    "Feeling so restless you couldn't sit still",
    "Feelings of worthlessness",
    "Feeling that people will take advantage of you if you let them",
    "The idea that you should be punished for your sins",
    "Never feeling close to another person",
    "Feelings of guilt",
    "The idea that something is wrong with your mind",
    

  ];
  Map<int, String?> selectedOptions = {};
  List<String> options = [
    "Not at all","A little Bit","Moderately","Quite A Bit","Extremely"
  ];

  int currentQuestionIndex = 0;
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/main-bg.jpg"),
            fit: BoxFit.cover,
          ),),

        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Question ${currentQuestionIndex+1}',
                style: TextStyle(fontSize: 20,color: Colors.white),
              ),
              SizedBox(height: 20),
              Text("For the past week, how much were you bothered by:",style: TextStyle(fontSize: 20,color: Colors.white),),
              SizedBox(height: 20),
              Text(questions[currentQuestionIndex],style: TextStyle(fontSize: 20,color: Colors.white),),
              SizedBox(height: 20),
              Column(
                children: options.map((option) {
                  return RadioListTile(
                    
                    title: Text(option,style: TextStyle(color: Colors.white),),
                    value: option,
                    groupValue: selectedOptions[currentQuestionIndex],
                    onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                      selectedOptions[currentQuestionIndex] = value; // Store selected option for the current question
                    });

              },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Check the answer and move to the next question
                      // You can implement the scoring logic here
                      if (currentQuestionIndex >0) {
                        setState(() {
                          currentQuestionIndex--;
                          selectedOption = null;
                        });
                      } else {
                        // Quiz is finished, show results or navigate to a result screen
                        // Implement your desired behavior here
                      }
                    },
                    child: Text("Previous"),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Check the answer and move to the next question
                      // You can implement the scoring logic here
                      if (currentQuestionIndex < questions.length - 1) {
                        setState(() {
                          currentQuestionIndex++;
                          selectedOption = null;
                        });
                      } else {
                        // Quiz is finished, show results or navigate to a result screen
                        // Implement your desired behavior here
                      }
                    },
                    child: Text("Next"),
                  ),
                  
                  
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}