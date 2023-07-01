import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/features/presesntation/pages/settings/blocs/settings_events.dart';
import 'package:product_list/features/presesntation/pages/settings/blocs/settings_states.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState>{
  SettingsBloc():super(const SettingsState()){
    on<TriggerSettings>(_triggerSettings);
  }

  _triggerSettings(SettingsEvent event, Emitter<SettingsState> emitter){
    emitter(const SettingsState());
  }
}