import 'package:training_center_xml/models/extensions/activity_extension_v2/namespace.dart';
import 'package:training_center_xml/namespace.dart';

const Map<String, String?> namespacesTcxTrainingCenterDatabase = {
  'http://www.w3.org/2001/XMLSchema-instance': 'xsi',
  namespaceTrainingCenterDatabaseV2: null,
  '$namespaceTrainingCenterDatabaseV2 http://www.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd':
      'schemaLocation',
  namespaceActivityExtensionV2: 'ax',
};
