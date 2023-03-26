// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';

import 'features/home/domain/entity/recipe.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 7860693157684598246),
      name: 'RecipeEntity',
      lastPropertyId: const IdUid(6, 5499374370516768793),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7215062879892867443),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 8067904818918582229),
            name: 'readyInMinutes',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3089826071119043713),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8286610006947685319),
            name: 'image',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1968208164025464467),
            name: 'instructions',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 5499374370516768793),
            name: 'healthyScore',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Store openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) =>
    Store(getObjectBoxModel(),
        directory: directory,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 7860693157684598246),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    RecipeEntity: EntityDefinition<RecipeEntity>(
        model: _entities[0],
        toOneRelations: (RecipeEntity object) => [],
        toManyRelations: (RecipeEntity object) => {},
        getId: (RecipeEntity object) => object.id,
        setId: (RecipeEntity object, int id) {
          if (object.id != id) {
            throw ArgumentError('Field RecipeEntity.id is read-only '
                '(final or getter-only) and it was declared to be self-assigned. '
                'However, the currently inserted object (.id=${object.id}) '
                "doesn't match the inserted ID (ID $id). "
                'You must assign an ID before calling [box.put()].');
          }
        },
        objectToFB: (RecipeEntity object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          final imageOffset = fbb.writeString(object.image);
          final instructionsOffset = fbb.writeString(object.instructions);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.readyInMinutes);
          fbb.addOffset(2, titleOffset);
          fbb.addOffset(3, imageOffset);
          fbb.addOffset(4, instructionsOffset);
          fbb.addInt64(5, object.healthyScore);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = RecipeEntity(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              readyInMinutes:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0),
              title: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              image: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              instructions: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, ''),
              healthyScore:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [RecipeEntity] entity fields to define ObjectBox queries.
class RecipeEntity_ {
  /// see [RecipeEntity.id]
  static final id =
      QueryIntegerProperty<RecipeEntity>(_entities[0].properties[0]);

  /// see [RecipeEntity.readyInMinutes]
  static final readyInMinutes =
      QueryIntegerProperty<RecipeEntity>(_entities[0].properties[1]);

  /// see [RecipeEntity.title]
  static final title =
      QueryStringProperty<RecipeEntity>(_entities[0].properties[2]);

  /// see [RecipeEntity.image]
  static final image =
      QueryStringProperty<RecipeEntity>(_entities[0].properties[3]);

  /// see [RecipeEntity.instructions]
  static final instructions =
      QueryStringProperty<RecipeEntity>(_entities[0].properties[4]);

  /// see [RecipeEntity.healthyScore]
  static final healthyScore =
      QueryIntegerProperty<RecipeEntity>(_entities[0].properties[5]);
}
