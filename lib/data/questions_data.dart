import 'dart:convert';
import '../models/question.dart';

String jsonData = '''
  [
    {"question": "Which big cat is known as the king of the jungle?", "options": ["Tiger", "Lion", "Jaguar", "Cheetah"], "answer": "Lion"},
    {"question": "What is the longest snake found in rainforests?", "options": ["Cobra", "Anaconda", "Python", "Viper"], "answer": "Python"},
    {"question": "Which bird is famous for imitating sounds, including human speech?", "options": ["Parrot", "Owl", "Toucan", "Hawk"], "answer": "Parrot"},
    {"question": "What jungle animal is known for swinging through trees?", "options": ["Monkey", "Leopard", "Sloth", "Tiger"], "answer": "Monkey"},
    {"question": "Which large cat is the best swimmer?", "options": ["Tiger", "Lion", "Leopard", "Jaguar"], "answer": "Jaguar"},
    {"question": "Which rainforest animal moves so slowly that algae can grow on it?", "options": ["Sloth", "Turtle", "Anteater", "Pangolin"], "answer": "Sloth"},
    {"question": "What reptile can change its color to blend with its surroundings?", "options": ["Chameleon", "Frog", "Gecko", "Komodo Dragon"], "answer": "Chameleon"},
    {"question": "Which animal’s roar is the loudest in the jungle?", "options": ["Lion", "Tiger", "Jaguar", "Howler Monkey"], "answer": "Howler Monkey"},
    {"question": "What jungle bird has a large, colorful beak and lives in the Amazon?", "options": ["Toucan", "Macaw", "Eagle", "Hornbill"], "answer": "Toucan"},
    {"question": "Which big cat is known for its spotted coat and powerful bite?", "options": ["Leopard", "Jaguar", "Cheetah", "Tiger"], "answer": "Jaguar"},
    {"question": "What is the world's largest rainforest?", "options": ["Amazon", "Congo", "Daintree", "Sundarbans"], "answer": "Amazon"},
    {"question": "Which insect is famous for carrying loads many times its body weight?", "options": ["Termite", "Beetle", "Ant", "Grasshopper"], "answer": "Ant"},
    {"question": "What jungle animal is the largest primate?", "options": ["Chimpanzee", "Gorilla", "Orangutan", "Baboon"], "answer": "Gorilla"},
    {"question": "Which frog is known for its bright colors and poisonous skin?", "options": ["Bullfrog", "Tree Frog", "Dart Frog", "Toad"], "answer": "Dart Frog"},
    {"question": "Which jungle-dwelling mammal has a long snout and uses its tongue to eat ants?", "options": ["Armadillo", "Anteater", "Sloth", "Pangolin"], "answer": "Anteater"},
    {"question": "What animal has webbed feet and can glide through the jungle?", "options": ["Flying Squirrel", "Lemur", "Sugar Glider", "Tarsier"], "answer": "Flying Squirrel"},
    {"question": "Which jungle predator is the fastest land animal?", "options": ["Tiger", "Jaguar", "Cheetah", "Panther"], "answer": "Cheetah"},
    {"question": "What type of monkey is known for its loud, echoing calls?", "options": ["Spider Monkey", "Capuchin", "Howler Monkey", "Tamarin"], "answer": "Howler Monkey"},
    {"question": "Which jungle insect produces light to attract mates?", "options": ["Mosquito", "Firefly", "Butterfly", "Dragonfly"], "answer": "Firefly"},
    {"question": "Which rainforest tree is known for being one of the tallest in the Amazon?", "options": ["Baobab", "Kapok", "Cedar", "Mahogany"], "answer": "Kapok"},
    {"question": "What is the largest species of lizard found in tropical regions?", "options": ["Iguana", "Komodo Dragon", "Gecko", "Monitor Lizard"], "answer": "Komodo Dragon"},
    {"question": "Which mammal is known as the 'gardener of the rainforest' for dispersing seeds?", "options": ["Tapir", "Sloth", "Jaguar", "Gorilla"], "answer": "Tapir"},
    {"question": "Which bird in the jungle is known for its striking red and blue plumage?", "options": ["Macaw", "Toucan", "Hornbill", "Peacock"], "answer": "Macaw"},
    {"question": "What small jungle animal is famous for curling into a ball when threatened?", "options": ["Pangolin", "Armadillo", "Hedgehog", "Tarsier"], "answer": "Pangolin"},
    {"question": "Which jungle animal is the strongest relative to its body size?", "options": ["Tiger", "Leafcutter Ant", "Jaguar", "Gorilla"], "answer": "Leafcutter Ant"},
    {"question": "Which amphibian can climb trees using sticky pads on its toes?", "options": ["Toad", "Dart Frog", "Tree Frog", "Salamander"], "answer": "Tree Frog"},
    {"question": "What large jungle rodent is known for its swimming ability?", "options": ["Capybara", "Beaver", "Nutria", "Porcupine"], "answer": "Capybara"},
    {"question": "Which jungle cat is famous for its ability to roar and climb trees?", "options": ["Lion", "Jaguar", "Cheetah", "Panther"], "answer": "Jaguar"},
    {"question": "What large jungle-dwelling snake is known for its ability to squeeze its prey?", "options": ["Anaconda", "Python", "Boa Constrictor", "Viper"], "answer": "Anaconda"}
  ]
''';

List<Question> loadQuestions() {
  List<dynamic> jsonList = jsonDecode(jsonData);
  return jsonList.map((e) => Question.fromJson(e)).toList();
}
