
class TaskQuestion {
  final String title;
  final String? question;
  final List<String> choices;
  final int? answer;


  TaskQuestion({
    required this.title,
    this.question,
    required this.choices,
    this.answer,
    });
}

const List? QMUChallengeTaskData = [
  {
    "id": 1,
    "title": "This is the first challenge",
    "question": "The Queen Margret Union is one of the oldest venues in Glasgow. What year was it founded? ",
    "choices": ["1921", "1955", "1915", "1890"],
    "answer_index": 3,
  },
  {
    "id": 2,
    "title": "This is the first challenge",
    "question": "Next, enter the QMU and turn right, on the wall you can see all the acts the QMU has hosted, which of the following has NOT performed at the QMU?",
    "choices": ['The Beatles', 'Nirvana', 'Queen', 'The RHCP'],
    "answer_index": 0,
  },
  {
    "id": 3,
    "title": "",
    "question": "The beatles have not performed at the QMU, who was the lead guitar player of the beatles?",
    "choices": ["Paul McCartney", "George Harrison", "Ringo Starr", "John Lennon"],
    "answer_index": 1,
  },
  {
    "id": 4,
    "title": "",
    "question": "George Harrison was a great guitarist, but who is most famously known to be the greatest guitar player to have lived?",
    "choices": ["Slash", "Eddie Van Halen", "Keith Richards", "Jimi Hendrix"],
    "answer_index": 3,
  },
  {
    "id": 5,
    "title": "",
    "question": "Jimi Hendrix unfortunately passed away in 1970, what age was he when he died?",
    "choices": ["31", "25", "27", "35"],
    "answer_index": 2,
  },
];

const List? cloistersChallengeTaskData = [
  {
    "id": 1,
    "title": "This is the first challenge",
    "question": "Within the Cloisters, how many columns are there?",
    "choices": ["24", "30", "35", "28"],
    "answer_index": 0,
  },
  {
    "id": 2,
    "title": "This is the second challenge",
    "question": "It is traditionally bad luck for students to do what in the quad before graduation?",
    "choices": ["Hug A Column", "Walk on the Grass", "Hang on a tree", "Sit on a bench"],
    "answer_index": 1,
  },
  {
    "id": 3,
    "title": "This is the third challenge",
    "question": "Glasgow University is the 4th oldest University in the UK, what year was it’s magnificent building built?",
    "choices": ["1381", "1272", "1451", "1598"],
    "answer_index": 2,
  },
  {
    "id": 4,
    "title": "This is the fourth challenge",
    "question": "Which of the following film or TV Shows do not feature scenes at the Cloisters? ",
    "choices": ["Highlander", "Cloud Atlas", "Outlaw King", "Outlander"],
    "answer_index": 0,
  },
  {
    "id": 5,
    "title": "This is the final challenge",
    "question": "The Film Outlaw King takes place during the Scottish Wars of Independence, in which century were these did these come to an end?",
    "choices": ["12th Century", "14th Century", "15th Century", "16th Century"],
    "answer_index": 1,
  },
];


const List? stevensonChallengeTaskData = [
{
"id": 1,
"title": "This is the first challenge",
"question": "The team should now be infront of the Stevenson Building, the University's sports department. How many floors of facilities does it have?",
"choices": ["2", "3", "4", "5"],
"answer_index": 3,
},
{
"id": 2,
"title": "This is the second challenge",
"question": "Mark Beaumont, graduate from the University in 2006, famously holds the record for cycling around the world. How long did the 18,000 mile route take him?",
"choices": ["365 Days", "45 Days", "80 Days", "300 Days"],
"answer_index": 2,
},
{
"id": 3,
"title": "This is the third challenge",
"question": "Glasgow famously hosts two main football teams, Rangers and Celtic. How many times have these two won the Champions League combined?",
"choices": ["0", "1", "2", "3"],
"answer_index": 1,
},
{
"id": 4,
"title": "This is the fourth challenge",
"question": "Which tennis player has NOT won 20 Grand Slam titles or more?",
"choices": ["Rafael Nadal", "Novak Djokovic", "Roger Federer", "Pete Sampras"],
"answer_index": 3,
},
{
"id": 5,
"title": "This is the final challenge",
"question": "John Beattie, Former Scottish Rugby Captain is also a graduate of the University, which of the following has NOT captained the Scottish International Rugby Team?",
"choices": ["Gavin Hastings", "Darcy Graham", "Greig Laidlaw", "Jamie Ritche"],
"answer_index": 1,
},];
