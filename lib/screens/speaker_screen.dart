import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfest19/blocs/speaker/bloc.dart';
import 'package:devfest19/blocs/speaker/speaker_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class SpeakerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Speakers"),
          elevation: 0.0,
        ),
        body: BlocProvider<SpeakerBloc>(
          builder: (context) {
            return SpeakerBloc(speakerRepository: FirebaseSpeakerRepository())
              ..dispatch(LoadingSpeaker());
          },
          child:
              BlocBuilder<SpeakerBloc, SpeakerState>(builder: (context, state) {
            if (state is SpeakerLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is SpeakerNotLoaded) {
              return Center(
                child: Text("Error while fetching data"),
              );
            }
            if (state is SpeakerLoaded) {
              final speakers = state.speakers;
              return ListView.builder(
                itemCount: speakers.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 2.5, left: 5, right: 5),
                    child: Column(
                      children: <Widget>[
                        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                          ConstrainedBox(
                              constraints: BoxConstraints.expand(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: speakers[i].imageUrl ??
                                    "https://lifesuccessforteens.com/wp-content/uploads/2019/07/Life-success-for-teens-1.jpg",
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(speakers[i].name,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600)),
                                  Opacity(
                                    opacity: 0.8,
                                    child: Text(
                                      speakers[i].occupation +
                                          " @ " +
                                          speakers[i].workPlace,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  Wrap(
                                      spacing: 5.0,
                                      children: speakers[i]
                                          .expertise
                                          .map((f) => Chip(
                                              backgroundColor:
                                                  randomColorGenerator(),
                                              label: Text(
                                                f,
                                              )))
                                          .toList()),
                                ]),
                          )
                        ]),
                        Divider()
                      ],
                    ),
                  );
                },
              );
            }
            return Container();
          }),
        ));
  }

  //Random color generator the skills chips
  Color randomColorGenerator() {
    List eligibleColors = [
      Colors.green,
      Colors.pink,
      Colors.amber,
      Colors.blue,
      Colors.purple,
      Colors.brown,
      Colors.red,
    ];
    // generates a new Random object
    final _random = new Random();
    var element = eligibleColors[_random.nextInt(eligibleColors.length)];
    return element;
  }
}
