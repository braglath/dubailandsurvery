part of 'property_count_cubit.dart';

abstract class PropertyCountState extends Equatable {
  const PropertyCountState();

  @override
  List<Object> get props => [];
}

class PropertyCountInitial extends PropertyCountState {}

class PropertyCountLoading extends PropertyCountState {}

class PropertyCountOnData extends PropertyCountState {
  final TotalPropertyCountModel totalPropertyCountModel;
  const PropertyCountOnData({required this.totalPropertyCountModel});
}

class PropertyCountOnError extends PropertyCountState {}
