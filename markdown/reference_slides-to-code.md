# References Slides to Code

In this document for each slides of the course I bind the slide number (where there is a piece of code)with the .cpp file.

## 04 - Scene

- **13 - Camera Representation:** 
  - Struct `camera_data` defined at `yocto_scene.h`, row 83.
- **61 - Indexed Mesh Data Structure:** 
  - Struct `shape_data` defined at `yocto_shape.h`, row 74.
- **63 - Computing vertex normals:** 
  - Function `compute_normals` written in `yocto_shape.cpp`, row 196, that refers to `triangles_normals()` at  `yocto_shape.cpp`, row 1478.
- **64 - Interpolating vertex data:** 
  - Function `eval_position()` written in `yocto_shape.cpp`, row 63, that refers to `interpolate_triangle()` at  `yocto_geometry.cpp`, row 542;
  - Function `eval_normal()` written in `yocto_shape.cpp`, row 84, that refers to `triangle_normal()` at `yocto_geometry.cpp`, row 586.
- **78 - Representing Materials:**
  - Struct `texture_data` defined at `yocto_scene.h`, row 95.
  - Struct `material_data` defined at `yocto_scene.h`, row 120.
- **97 - Environment Maps:** 
  - Struct `environment_data` defined at `yocto_scene.h`, row 150
- **104 - Representing Instances:** 
  - Struct `instance_data` defined at `yocto_scene.h`, row 142.
- **106 - Representing Scenes:** 
  - Struct `scene_data` defined at `yocto_scene.h`, row 190.

## 05 - Ray-trace

### Camera Rays

- **10 - Ray, a half line:**
  - Struct `ray3f` defined at `yocto_geometry.h`, row 135.
- **16 - Pinhole camera:**
  - Function `eval_camera` written at `yocto_scene.cpp`, row 66.

### Ray-Scene Intersection

- **31 - Ray-triangle intersection:**
  - Function `intersect_triangle` written at `yocto_geometry.h`, row 794.
- **34 - Ray-point intersection:**
  - Function `intersect_point` written at `yocto_geometry.h`, row 697.
- **38 - Ray-line intersection:**
  - Function `intersect_line` written at `yocto_geometry.h`, row 716.
- **47 - Ray-scene intersection**
  - Struct  `scene_intersection` written at `yocto_bvh.h`, row 96.
- **48 - Ray-scene intersection**
  - Function `shade_color` written at `yocto_raytrace.cpp`, row 285.

#### Shading

- **56 - Computing shape values_**
  - Function `interpolate_triangle` written at `yocto_geometry.cpp`, row 542.
  - Function `eval_position()` written in `yocto_shape.cpp`, row 63.
  - Function `eval_normal()` written in `yocto_shape.cpp`, row 84.
- **57 - Normal shading:**
  - Function `shade_normal` written at `yocto_raytrace.cpp`, row 261.
- **59 - Diffuse Illumination:**
  - Function `shade_eyelight` written at `yocto_raytrace.cpp`, row 246.
- **74 - Indirect illumination:**
  - Function `shade_indirect` written at ?.

#### Antialiasing

- **79 - Aliased raytracing:**
- **80 - Antialiasing by supersampling:**
- **82 - Antialiasing by random sampling:**
- **83 - Progressive rendering:**

### Textures

- **89 - Lookup Texture Values:**
  - Funcion `lookup_texture` written at `yocto_scene.cpp`, row 111.
  - Funcion `eval_texture` written at `yocto_scene.cpp`, row 127.
- **90 - Lookup Texture Values:**
  - Funcion `shade_texcoord` written at `yocto_raytrace.cpp`, row 274.
- **91 - Lookup Texture Values:**
  - Funcion `shade_indirect` written at ?
- **92 - Lookup Environment Values:**
  - Funcion `eval_environment` written at `yocto_scene.cpp`, row 586.

### Materials

- **98 - Handling multiple materials:**
  - Function `shade_indirect` written at ?
- **100 - Matte surfaces:**
  - Function `eval_matte` written at `yocto_shading.h`, row 554.
- **103 - Polished metals:**
  - Function `fresnel_schlick` written at `yocto_shading.h`, row 309.
  - Function `fresnel_schlick` written at `yocto_shading.h`, row 309.
- **109 - Rough metals:**
  - Function `microfacet_distribution` written at `yocto_shading.h`, row 409.
  - Function `microfacet_shadowing` written at `yocto_shading.h`, row 427.
  - Function `eval_reflective` written at `yocto_shading.h`, row 619.
- **113 - Rough plastics:**
  - Function `eval_transparent` (or `eval_refractive`) written at `yocto_shading.h`, row 786 (or 881).
- **116 - Polished dielectrics:**
  - Function `eval_refractive` (or `eval_transparent`) written at `yocto_shading.h`, row 881 (or 786).
- **119 - Opacity:**
  - Function `?`

### Acceleration Intersections

- **128 - Axis aligned bounding boxes:**
  - Struct `bbox3f` defined at `yocto_geometry.h`, row 77.
- **129 - Axis aligned bounding boxes:**
  - Function `merge` defined at `yocto_geometry.h`, row 410.
  - Function `merge` defined at `yocto_geometry.h`, row 413.
- **130 - Construct AABBs:**
  - Function `triangle_bounds` defined at `yocto_geometry.h`, row 486.
- **136 - Ray-box intersection:**
  - Function `intersect_bbox` defined at `yocto_geometry.h`, row 838.
- **141 - Implementing BVHs:**
  - Struct `bvh_node` defined at `yocto_shape.h`, row 474.
  - Struct `bvh_tree` defined at `yocto_shape.h`, row 487.
  - Function `intersect_shape_bvh` defined at `yocto_bvh.cpp`, row 460.

## 09 - Surfaces

### Implementing Subdivs

- **51 - Implementing subdivs:**
  - Within Function `subdivide_catmullclark_impl` defined at `yocto_shape.cpp`, row 2879.
- **51 - Implementing subdivs:**
  - Function `subdivide_catmullclark_impl` defined at `yocto_shape.cpp`, row 2874.
- **53 - Implementing subdivs:**
  - Struct `edge_map` defined at `yocto_shape.h`, row 420.
  - Function `make_edge_map` defined at `yocto_shape.cpp`, row 1752.
- **54 - Implementing subdivs:**
  - Function `insert_edge` defined at `yocto_shape.cpp`, row 1787.
- **55 - Implementing subdivs:**
  - Within Function `subdivide_catmullclark_impl` defined at `yocto_shape.cpp`, row 2885.
- **56 - Implementing subdivs:**
  - Within Function `subdivide_catmullclark_impl` defined at `yocto_shape.cpp`, row 2900.
- **58 - Implementing subdivs:**
  - Within Function `subdivide_catmullclark_impl` defined at `yocto_shape.cpp`, row 2930.
- **59 - Implementing subdivs:**
  - Within Function `subdivide_catmullclark_impl` defined at `yocto_shape.cpp`, row 2951.
- **60 - Implementing subdivs:**
  - Within Function `subdivide_catmullclark_impl` defined at `yocto_shape.cpp`, row 2957.
- **62 - Implementing subdivs:**
  - Within Function `subdivide_catmullclark_impl` defined at `yocto_shape.cpp`, row 2985.

## 12 - Path Tracing

### Naive Path Tracing

- **74 - Path tracing – environment maps:**
  - Function `eval_environment` defined at `yocto_scene.cpp`, row 586.
- **75 - Path tracing – recursive:**
  - Function `shade_naive` defined at `yocto_pathtrace.cpp`, row 549.
- **76 - Path tracing – recursive:**
  - Function `shade_naive` defined at `yocto_pathtrace.cpp`, row 549.
- **81 - Path tracing – Russian roulette:**
  - It is integrated in `shade_naive` at `yocto_pathtrace.cpp`, row 549.
- **84 - Path tracing – product form:**
  - Function `shade_product` defined at ?
- **86 - Path tracing – handle materials:**
  - Function `shade_naive` defined at `yocto_pathtrace.cpp`, row 549.

### Realistic camera

- **94 - Sampling the lens:**
  - Function `eval_camera` defined at `yocto_scene.cpp`, row 66.
- **95 - Sampling the lens:**
  - Function `sample_disk` defined at `yocto_sampling.h`, row 339.
  - Function `sample_camera` defined at `yocto_trace.cpp`, row 338.

### Direct Illumination

- **109 - Path tracing – direct illumination:**
  - Function `shade_direct` defined at ?

### Multiple Importance Sampling

- **109 - Path tracing – MIS:**
  - Function `shade_direct` defined at ?
- **130 - Path tracing – sampling lights:**
  - Function `trace_light` defined at `yocto_trace.h` row 125
- **136 - Path tracing – lights pdf:**
  - Function `sample_lights_pdf` defined at `yocto_trace.cpp` row 391


### Materials

