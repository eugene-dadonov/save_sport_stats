import 'package:hive/hive.dart';
import 'package:sport_stats_live/features/configuration/data/converter/configuration_converter.dart';
import 'package:sport_stats_live/features/configuration/data/model/configuration_model.dart';
import 'package:sport_stats_live/features/configuration/data/storage/configuration_generator.dart';
import 'package:sport_stats_live/features/configuration/data/storage/configuration_storage.dart';
import 'package:sport_stats_live/features/configuration/domain/configuration.dart';
import 'package:sport_stats_live/features/configuration/domain/exception/configuration_exception.dart';

class HiveConfigurationStorage extends ConfigurationStorage {
  // Boxes:
  static const boxConfigurationStorage = "boxConfigurationStorage";

  Future<void> init() async {
    Hive.registerAdapter<ConfigurationModel>(ConfigurationModelAdapter());
    await Hive.openBox<ConfigurationModel>(boxConfigurationStorage);
  }

  Future<void> createDemoConfigurations() async {
    final confs = ConfigurationGenerator().generate();
    final confsModels =
        confs.map((team) => ConfigurationConverter.toModel(team));
    final confsBox = Hive.box<ConfigurationModel>(boxConfigurationStorage);

    if (confsBox.isEmpty) {
      await confsBox.clear();

      for (var conf in confsModels) {
        await confsBox.put(conf.id, conf);
      }
    } else {
      print('TeamBox: Box already has ${confsBox.length} items');
    }
  }

  @override
  Future<void> deleteConfiguration(String id) async {
    final box = Hive.box<ConfigurationModel>(boxConfigurationStorage);
    box.delete(id);
  }

  @override
  Future<Configuration> getConfiguration(String id) async {
    final box = Hive.box<ConfigurationModel>(boxConfigurationStorage);
    final configurationModel = box.get(id);
    if (configurationModel == null) {
      throw NoSuchConfiguration(id: id);
    } else {
      return ConfigurationConverter.fromModel(configurationModel);
    }
  }

  @override
  Future<void> saveConfiguration(Configuration configuration) async {
    final box = Hive.box<ConfigurationModel>(boxConfigurationStorage);
    final configurationModel = ConfigurationConverter.toModel(configuration);
    box.put(configurationModel.id, configurationModel);
  }

  @override
  Future<List<Configuration>> getConfigurations() async {
    final box = Hive.box<ConfigurationModel>(boxConfigurationStorage);
    return box.values
        .map((model) => ConfigurationConverter.fromModel(model))
        .toList();
  }
}
