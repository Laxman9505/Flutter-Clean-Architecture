import 'package:hive/hive.dart';
import 'package:riverpod_state_management/config/constants/hive_table_constant.dart';
import 'package:riverpod_state_management/features/course/domain/entity/course_entity.dart';
import 'package:uuid/uuid.dart';

//  dart run build_runner build --delete-conflicting-outputs
part 'course_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.courseTableId)
class CourseHiveModel {
  @HiveField(0)
  final String? courseId;

  @HiveField(1)
  final String courseName;

  CourseHiveModel({String? courseId, required this.courseName})
      : courseId = courseId ?? const Uuid().v4();

  // Convert Hive Object to Entity
  CourseEntity toEntity() => CourseEntity(
        courseId: courseId,
        courseName: courseName,
      );

  // Convert Entity to Hive Object
  CourseHiveModel toHiveModel(CourseEntity entity) => CourseHiveModel(
        // courseId: entity.courseId,
        courseName: entity.courseName,
      );

  List<CourseHiveModel> toHiveModelList(List<CourseEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  // Convert Hive List to Entity List
  List<CourseEntity> toEntityList(List<CourseHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'courseId: $courseId, courseName: $courseName';
  }
}
