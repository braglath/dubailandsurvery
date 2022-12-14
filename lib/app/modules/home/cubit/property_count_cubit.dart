import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landsurvey/app/data/api/home/total_property_count_api.dart';
import 'package:landsurvey/app/data/models/total_property_count_model.dart';

part 'property_count_state.dart';

class PropertyCountCubit extends Cubit<PropertyCountState> {
  StreamSubscription? streamSub;
  PropertyCountCubit() : super(PropertyCountInitial()) {
    emit(PropertyCountLoading());
    final apiStream = totalPropertyCountApi().asStream();
    streamSub = apiStream.listen((totalPropertyCountModel) {
      if (totalPropertyCountModel == null) {
        emit(PropertyCountOnError());
      } else {
        emit(PropertyCountOnData(
            totalPropertyCountModel: totalPropertyCountModel));
      }
    });
  }
  @override
  Future<void> close() async {
    if (streamSub != null) streamSub!.cancel();
    super.close();
  }
}
