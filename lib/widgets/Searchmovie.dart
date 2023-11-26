import 'package:flutter/material.dart';
import 'package:brewapp/model/MovieModel.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<MovieModel> main_movies = [
    MovieModel('Oppenheimer',
        'The story of j Robert Oppenheimer role in development of atomic bomb',
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPWyNj66k_Y_1zJVY7yw6guBEYwxy8-Z40DWFoZ7GTWWBPAtMZdm_IRP3MP5csTrS-P7E&usqp=CAU"),
    MovieModel('Doctor Who',
        'The Doctor is a Time Lord: a 900 year old allien with two hearts ',
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2Po1ngNxjfR9cl7yTzZ_sVu69YONhy-qnv-5aD3sWq1h-PhdCNddpca7smPS15rW4wd8&usqp=CAU"),
    MovieModel('Leo',
        'Jaded 74 year old lizard leo has been stuck in florida classroom for decades.The Doctor is a Time Lord: a 900 year old allien with two hearts ',
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfKmRho1Jv5BoAt1go1voMOOQzdhNnnmZkwVaJzyKQo6Z-h5e6_VZxKTNdl8hw7xj1YrE&usqp=CAU"),
    MovieModel(
      "Avatar",
      "A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.",
      "https://i.pinimg.com/736x/cb/87/ec/cb87ec55dc8b54c58b9c0d0e095e2474.jpg",
    ),
    MovieModel(
        "I Am Legend",
        "Years after a plague kills most of humanity and transforms the rest into monsters, the sole survivor in New York City struggles valiantly to find a cure.",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCmv6___nhRZDstzfzMtW_iAFJ8IyeN_hqsZ1v9fk88Zu_IIogE5TYKt-JaeJzhtloLks&usqp=CAU"),
    MovieModel(
        "300",
        "King Leonidas of Sparta and a force of 300 men fight the Persians at Thermopylae in 480 B.C.",
        "https://i.pinimg.com/474x/d7/d6/bb/d7d6bb3c1d04738ed8b7ff332eeefa48.jpg"),
    MovieModel(
        "The Avengers",
        "Earth's mightiest heroes must come together and learn to fight as a team if they are to stop the mischievous Loki and his alien army from enslaving humanity.",
        "https://upload.wikimedia.org/wikipedia/en/0/0d/Avengers_Endgame_poster.jpg"),
    MovieModel(
        "The Wolf of Wall Street",
        "Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.",
        "https://resizing.flixster.com/9Ew-94nSBiYWqkuOixtqPSEpowU=/300x300/v2/https://resizing.flixster.com/QLU-6pzeWGquNW8D5cZFFjHOD3k=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzL2VmN2I2YmQ1LTA5MzItNDRkZC05ODgwLWQ0NDY0M2U3ZTU5Zi53ZWJw"),
    MovieModel(
        "Interstellar",
        "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2HtOlzxlJRJrd9RefKcXziz6cmBQQGnvGmQ&usqp=CAU"),
    MovieModel(
        "Game of Thrones",
        "While a civil war brews between several noble families in Westeros, the children of the former rulers of the land attempt to rise up to power. Meanwhile a forgotten race, bent on destruction, plans to return after thousands of years in the North.",
        "https://fr.web.img3.acsta.net/c_310_420/pictures/23/01/03/14/13/0717778.jpg"),
    MovieModel(
        "Vikings",
        "The world of the Vikings is brought to life through the journey of Ragnar Lothbrok, the first Viking to emerge from Norse legend and onto the pages of history - a man on the edge of myth.",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-cB16l7cAAm_XEtnnoVsbD9FzTn4KcQ7jI6BRVJ0ynfIrqessr7-VGHTwpa9bj8-AfAQ&usqp=CAU")
  ];

  List<MovieModel> display = List.from(main_movies);

  void updateList(String value) {
    setState(() {
      display = main_movies
          .where((element) =>
          element.Title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search for a movie',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black45,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                hintText: "eg: Batman",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
                child: display.length == 0
                    ? Center(
                    child: Text(
                      'No Result Found',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ))
                    : ListView.builder(
                    itemCount: display.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black26),
                          color: Colors.black12
                        ),
                        child: ListTile(

                          contentPadding: EdgeInsets.all(10),
                          title: Text(
                            display[index].Title!,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '${display[index].Plot!}',
                            style: TextStyle(color: Colors.white60),
                          ),
                          leading: Image.network(display[index].Poster!),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
