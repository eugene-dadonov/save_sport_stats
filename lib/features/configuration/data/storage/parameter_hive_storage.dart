import 'package:hive_flutter/hive_flutter.dart';
import 'package:sport_stats_live/features/configuration/data/converter/parameter_converter.dart';
import 'package:sport_stats_live/features/configuration/data/model/parameter_model.dart';
import 'package:sport_stats_live/features/configuration/data/storage/parameter_generator.dart';
import 'package:sport_stats_live/features/configuration/data/storage/parameter_storage.dart';
import 'package:sport_stats_live/features/configuration/domain/exception/parameter_exception.dart';
import 'package:sport_stats_live/features/configuration/domain/parameter.dart';

class HiveParameterStorage extends ParameterStorage {
  // Boxes:
  static const boxParameterStorage = "boxParameterStorage";

  Future<void> init() async {
    Hive.registerAdapter<ParameterModel>(ParameterModelAdapter());
    await Hive.openBox<ParameterModel>(boxParameterStorage);
  }

  Future<void> createDemoParameters() async {
    final pars = ParameterGenerator().generate();
    final parsModels =
    pars.map((team) => ParameterConverter.toModel(team));
    final parsBox = Hive.box<ParameterModel>(boxParameterStorage);

    if (parsBox.isEmpty) {
      await parsBox.clear();

      for (var par in parsModels) {
        await parsBox.put(par.id, par);
      }
    } else {
      print('TeamBox: Box already has ${parsBox.length} items');
    }
  }

  @override
  Future<void> deleteParameter(String id) async {
    final box = Hive.box<ParameterModel>(boxParameterStorage);
    box.delete(id);
  }

  @override
  Future<Parameter> getParameter(String id) async {
    final box = Hive.box<ParameterModel>(boxParameterStorage);
    final parameterModel = box.get(id);
    if (parameterModel == null) {
      throw NoSuchParameter(id: id);
    } else {
      return ParameterConverter.fromModel(parameterModel);
    }
  }

  @override
  Future<List<Parameter>> getParameters() async {
    final box = Hive.box<ParameterModel>(boxParameterStorage);
    return box.values
        .map((model) => ParameterConverter.fromModel(model))
        .toList();
  }

  @override
  Future<void> saveParameter(Parameter parameter) async {
    final box = Hive.box<ParameterModel>(boxParameterStorage);
    final parameterModel = ParameterConverter.toModel(parameter);
    box.put(parameterModel.id, parameterModel);
  }
}
