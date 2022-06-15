import 'package:equatable/equatable.dart';

class CallBack<T> extends Equatable {
  final void Function(T? parameters) action;

  const CallBack(this.action);

  call([T? parameters]) {
    action(parameters);
  }

  @override
  List<Object?> get props => [action];
}
