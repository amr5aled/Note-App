import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/record/record_cubit.dart';
import '../../../resources/index.dart';
import '../../../widgets/index.dart';
import '../../../widgets/progress_indicator.dart';
import '../../recorder/views/cloud_record_list_view.dart';
import '../../recorder/views/feature_buttons_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AppText(
            translation: AppStrings.home,
          ),
        ),
        body: BlocBuilder<RecordCubit, RecordState>(
          builder: (context, state) {
            var cubit = RecordCubit.get(context);
            return state is! RecordGetRecordLoading
                ? Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: cubit.references.length == 0
                            ? Center(
                                child: AppText(
                                  translation: AppStrings.noFileUploadedYet,
                                  color: AppPalette.textMediumColor,
                                ),
                              )
                            : CloudRecordListView(
                                // references: cubit.references,
                              ),
                      ),
                      Expanded(
                        flex: 2,
                        child: FeatureButtonsView(
                           
                            ),
                      ),
                    ],
                  )
                : loadingData();
          },
        ),
      ),
    );
  }

 
}
