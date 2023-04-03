import 'package:flutter/material.dart';
import 'package:miniproject/login.dart';
import 'package:miniproject/register.dart';
import 'package:miniproject/homepage.dart';
import 'package:miniproject/personal.dart';
import 'package:miniproject/favorites.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:miniproject/welcome.dart';
import 'package:miniproject/repass.dart';

import 'package:miniproject/Movie/action.dart';
import 'package:miniproject/Movie/adventure.dart';
import 'package:miniproject/Movie/comedy.dart';
import 'package:miniproject/Movie/animation.dart';
import 'package:miniproject/Movie/biography.dart';
import 'package:miniproject/Movie/crime.dart';
import 'package:miniproject/Movie/documentary.dart';
import 'package:miniproject/Movie/drama.dart';
import 'package:miniproject/Movie/family.dart';
import 'package:miniproject/Movie/fantasy.dart';
import 'package:miniproject/Movie/horror.dart';
import 'package:miniproject/Movie/musical.dart';
import 'package:miniproject/Movie/mystery.dart';
import 'package:miniproject/Movie/romance.dart';
import 'package:miniproject/Movie/sci_fipage.dart';
import 'package:miniproject/Movie/sport.dart';
import 'package:miniproject/Movie/thriller.dart';
import 'package:miniproject/Movie/war.dart';
import 'package:miniproject/Movie/western.dart';
import 'package:miniproject/video/videoplay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return buildMaterialApp();
  }

  MaterialApp buildMaterialApp() {
    return MaterialApp(
      title: 'Visual Movie',
      theme: ThemeData(
        primarySwatch: primaryBlack,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/homepage': (context) => Homepage(),
        '/action': (context) => Actionpage(),
        '/adventure': (context) => Adventurepage(),
        '/comedy': (context) => Comedypage(),
        '/animation': (context) => Animationpage(),
        '/biography': (context) => Biographypage(),
        '/crime': (context) => Crimepage(),
        '/documentary': (context) => Documentarypage(),
        '/drama': (context) => Dramapage(),
        '/family': (context) => Familypage(),
        '/fantasy': (context) => Fantasypage(),
        '/horror': (context) => Horrorpage(),
        '/musical': (context) => Musicalpage(),
        '/mystery': (context) => Mysterypage(),
        '/romance': (context) => Romancepage(),
        '/sci-fi': (context) => Sci_fipage(),
        '/sport': (context) => Sportpage(),
        '/thriller': (context) => Thrillerpage(),
        '/war': (context) => Warpage(),
        '/western': (context) => Westernpage(),
        '/personal': (context) => PersonalPage(),
        '/favorites': (context) => Favorites(),
        '/loginnewbpage': (context) => LoginNewBPage(),
        '/forgotpassword': (context) => ForgotPasswordPage(),
        //video
        '/Kill_the_Drug_Lords': (context) => Kill_the_Drug_Lords(),
        '/John_Wick': (context) => John_Wick(),
        '/Gotham_Knights_Season_1': (context) => Gotham_Knights_Season_1(),
        '/Bronco_Billy': (context) => Bronco_Billy(),
        '/Rampage': (context) => Rampage(),
        '/Deliverance': (context) => Deliverance(),
        '/Vikings_Valhalla_Season_1': (context) => Vikings_Valhalla_Season_1(),
        '/Exorcist': (context) => Exorcist(),
        '/Hotel_Transylvania': (context) => Hotel_Transylvania(),
        '/Detective_Conan_The_Culprit_Hanzawa': (context) =>
            Detective_Conan_The_Culprit_Hanzawa(),
        '/Puss_in_Boots': (context) => Puss_in_Boots(),
        '/One_Piece_Film_Red': (context) => One_Piece_Film_Red(),
        '/Locked_Down': (context) => Locked_Down(),
        '/Tribhanga_Tedhi_Medhi_Crazy': (context) =>
            Tribhanga_Tedhi_Medhi_Crazy(),
        '/Penguin_Bloom': (context) => Penguin_Bloom(),
        '/The_Debut': (context) => The_Debut(),
        '/Alpha_House': (context) => Alpha_House(),
        '/Jump_Street': (context) => Jump_Street(),
        '/Hello_Stranger': (context) => Hello_Stranger(),
        '/Panya_Renu': (context) => Panya_Renu(),
        '/Unlocked': (context) => Unlocked(),
        '/Training_Day': (context) => Training_Day(),
        '/In_His_Shadow': (context) => In_His_Shadow(),
        '/Furies': (context) => Furies(),
        '/Puff_Wonders_of_the_Reef': (context) => Puff_Wonders_of_the_Reef(),
        '/Kitty_Love_An_Homage_to_Cats': (context) =>
            Kitty_Love_An_Homage_to_Cats(),
        '/The_Year_Earth_Changed': (context) => The_Year_Earth_Changed(),
        '/Seaspiracy': (context) => Seaspiracy(),
        '/The_Secret_Romantic_Guesthouse': (context) =>
            The_Secret_Romantic_Guesthouse(),
        '/Our_Blooming_Youth': (context) => Our_Blooming_Youth(),
        '/The_Heavenly_Idol': (context) => The_Heavenly_Idol(),
        '/Walang_KaParis': (context) => Walang_KaParis(),
        '/Double_Dad': (context) => Double_Dad(),
        '/June_Kopi': (context) => June_Kopi(),
        '/Sardar_Ka_Grandson': (context) => Sardar_Ka_Grandson(),
        '/Crashing_Through_the_Snow': (context) => Crashing_Through_the_Snow(),
        '/Avatar': (context) => Avatar(),
        '/The_BFG': (context) => The_BFG(),
        '/Dracula_Untold': (context) => Dracula_Untold(),
        '/Star_Wars_1': (context) => Star_Wars_1(),
        '/Winnie_the_Pooh_Blood_and_Honey': (context) =>
            Winnie_the_Pooh_Blood_and_Honey(),
        '/The_Lair': (context) => The_Lair(),
        '/Curse_of_Chucky': (context) => Curse_of_Chucky(),
        '/The_Cursed': (context) => The_Cursed(),
        '/Tar': (context) => Tar(),
        '/Copying_Beethoven': (context) => Copying_Beethoven(),
        '/Daisy_Jones_The_Six': (context) => Daisy_Jones_The_Six(),
        '/Bono_The_Edge_A_Sort_of_Homecoming_with_Dave_Letterman': (context) =>
            Bono_The_Edge_A_Sort_of_Homecoming_with_Dave_Letterman(),
        '/Lupin': (context) => Lupin(),
        '/The_Woman_in_the_Window': (context) => The_Woman_in_the_Window(),
        '/The_Soul': (context) => The_Soul(),
        '/The_Night_House': (context) => The_Night_House(),
        '/But_Always': (context) => But_Always(),
        '/Always': (context) => Always(),
        '/Faraway': (context) => Faraway(),
        '/Sweeter_Than_Chocolate': (context) => Sweeter_Than_Chocolate(),
        '/The_2012': (context) => The_2012(),
        '/Moonfall': (context) => Moonfall(),
        '/The_Day_After_Tomorrow': (context) => The_Day_After_Tomorrow(),
        '/Deep_Impact': (context) => Deep_Impact(),
        '/Chang_Can_Dunk': (context) => Chang_Can_Dunk(),
        '/Caught_Out': (context) => Caught_Out(),
        '/Creed': (context) => Creed(),
        '/Bill_Russell_Legend': (context) => Bill_Russell_Legend(),
        '/Son': (context) => Son(),
        '/The_Lightless_Door': (context) => The_Lightless_Door(),
        '/V_S_H': (context) => V_S_H(),
        '/Project_Gemini': (context) => Project_Gemini(),
        '/Narvik': (context) => Narvik(),
        '/Saving_Private_Ryan': (context) => Saving_Private_Ryan(),
        '/Battlebox': (context) => Battlebox(),
        '/The_1917': (context) => The_1917(),
        '/The_Treasure_of_the_Sierra_Madre': (context) =>
            The_Treasure_of_the_Sierra_Madre(),
        '/Dead_for_a_Dollar': (context) => Dead_for_a_Dollar(),
        '/Murder_at_Yellowstone_City': (context) =>
            Murder_at_Yellowstone_City(),
        '/The_Old_Way': (context) => The_Old_Way(),
      },
    );
  }
}
