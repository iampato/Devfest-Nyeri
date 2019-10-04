import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfest19/blocs/gallery/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gallery"), elevation: 0.0),
      body: BlocBuilder<GalleryBloc, GalleryState>(builder: (context, state) {
        if (state is GalleryLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is GalleryLoaded) {
          final images = state.images;
          return Container(
            child: GridView.builder(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                final image = images[index];
                return Hero(
                    tag: image.imagepath,
                    child: GestureDetector(
                      child: Card(
                        child: GridTile(
                          child: CachedNetworkImage(
                            imageUrl: image.imagepath,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Detail(imageUrl: image.imagepath);
                        }));
                      },
                    ));
              },
            ),
          );
        }
        return Container();
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void showAlertDialog(BuildContext context) {
    final galleryBloc = BlocProvider.of<GalleryBloc>(context);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Upload from: "),
            actions: <Widget>[
              FlatButton(
                child: Text("Camera"),
                onPressed: () {
                  galleryBloc.dispatch(
                    UploadCamera(),
                  );
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("Gallery"),
                onPressed: () {
                  galleryBloc.dispatch(
                    UploadGallery(),
                  );
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

class Detail extends StatelessWidget {
  final String imageUrl;
  Detail({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: imageUrl,
        child: GestureDetector(
          child: Center(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
