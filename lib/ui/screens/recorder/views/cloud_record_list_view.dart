import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/record/record_cubit.dart';
import '../../../widgets/snack_bar.dart';

class CloudRecordListView extends StatefulWidget {
  @override
  _CloudRecordListViewState createState() => _CloudRecordListViewState();
}

class _CloudRecordListViewState extends State<CloudRecordListView> {
  bool? isPlaying;
  late AudioPlayer audioPlayer;
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    isPlaying = false;
    audioPlayer = AudioPlayer();
    selectedIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecordCubit, RecordState>(
      listener: (context, state) {
        if (state is RecordDeleteRecordLoaded) {
          showSnackBar(context, 'Delete Successfully');
        }
      },
      builder: (context, state) {
        var cubit = RecordCubit.get(context);
        return ListView.builder(
          itemCount: cubit.references.length,
          reverse: true,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: UniqueKey(),
              // key: Key(cubit.references[index].name),
              onDismissed: (direction) async {
                // Remove the item from the data source.
                String url =
                    await cubit.references.elementAt(index).getDownloadURL();
                RecordCubit.get(context).deleteRecord(url: url);
                setState(() {});
              },
              child: ListTile(
                title: Text(
                    RecordCubit.get(context).references.elementAt(index).name),
                trailing: IconButton(
                  icon: selectedIndex == index
                      ? Icon(Icons.pause)
                      : Icon(Icons.play_arrow),
                  onPressed: () => _onListTileButtonPressed(index),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _onListTileButtonPressed(int index) async {
    setState(() {
      selectedIndex = index;
    });
    audioPlayer.play(
        await RecordCubit.get(context)
            .references
            .elementAt(index)
            .getDownloadURL(),
        isLocal: false);

    audioPlayer.onPlayerCompletion.listen((duration) {
      setState(() {
        selectedIndex = -1;
      });
    });
  }
}
