import 'package:state_management_with_stream/core/bloc.dart';

class IncrementCountNumberEvent extends BaseEvent{
  int count;

  IncrementCountNumberEvent(this.count);
}

class DecrementCountNumberEvent extends BaseEvent{
  int count;

  DecrementCountNumberEvent(this.count);
}

class IncrementCounter extends BaseState{
  int count;

  IncrementCounter(this.count);
}

class DecrementCounter extends BaseState{
  int count;

  DecrementCounter(this.count);
}


class SendDataEvent extends BaseEvent{
  dynamic data;

  SendDataEvent(this.data);
}

class SampleBloc extends BaseBloc{

 @override
  Future<void> mapEvent(event) async{
   if(event is IncrementCountNumberEvent) emit(IncrementCounter(event.count +1));
   if(event is DecrementCountNumberEvent) emit(DecrementCounter(event.count -1));
    return super.mapEvent(event);
  }
}