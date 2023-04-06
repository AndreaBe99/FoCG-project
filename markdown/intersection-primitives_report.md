# Intersection Primitives

The rendering of points, lines and quads is now too approximate; in this project we will compute these intersections accurately:

- render **points as spheres** and **lines as capped cones**; intersection algorithms can be found [here](https://iquilezles.org/www/articles/intersectors/intersectors.htm) with names Sphere and Rounded Cone;
- render **quads as bilinear patches** as shown [here](https://research.nvidia.com/publication/2019-03_cool-patches-geometric-approach-raybilinear-patch-intersections);
- to integrate them in our code you have to:
  1. insert the new intersection functions in `intersect_bvh` in `yocto_bvh`,
  2. change the functions `eval_position` e `eval_normal` to compute the new position and normal, or
  3. change the data to return the intersection normal and position directly from the intersection call;
[intersection-primitives_report.md](intersection-primitives_report.md)
- make test files that show the difference between the methods (I would put a flag inside shapes that switches the intersection methods).

## Step by step

1. Add three parameters to `struct trace_params {...}` in `yocto_trace.h`:

    ```cpp
    
        struct trace_params {
            int                   camera     = 0;
            int                   resolution = 1280;
            ...
            // NOTE: Set the following parameters to `true` to render:
            //  - points as spheres,
            //  - lines as cupped cones,
            //  - quads as bilinear patches
            bool                  points_spheres = false;
            bool                  lines_cones = false;
            bool                  quads_patches = false;
        };
    ```

2. Add options for the console, to change the render of the points, lines and quads (`void run(...)` in `ytrace.cpp`):

    ```cpp
        
        ...
        add_option(cli, "points", params.points_spheres, "render points as spheres");
        add_option(cli, "lines",  params.lines_cones,    "render lines as capped cones");
        add_option(cli, "quads",  params.quads_patches,  "render quads as bilinear patches");
    ```

3. Add these three parameters to `intersect_shape_bvh(...)` and therefore also at `intersect_scene_bvh(...)` and `intersect_instance_bvh(...)` in `yocto_bvh.{h/cpp}`.

    ```cpp
    
        (...,
        bool points_spheres = false, 
        bool lines_cones = false,
        bool quads_patches = false)
    ```

4. Use the three FLAGs in `intersect_shape_bvh()` in `yocto_bvh.cpp` file to check the correct strategy:

    ```cpp

        ...
        // Points as Spheres
        prim_intersection pintersection;
        if (points_spheres) {
            pintersection = intersect_sphere(ray, shape.positions[p],
            shape.radius[p]);
        } else {
            pintersection = intersect_point(ray, shape.positions[p],
            shape.radius[p]);
        }
        
        ...
        // Lineas as Capped Cones
        prim_intersection pintersection;
        if (lines_cones) {
            pintersection = intersect_cone(ray, shape.positions[l.x], 
                shape.positions[l.y], shape.radius[l.x], shape.radius[l.y]);
        } else {
            pintersection = intersect_line(ray, shape.positions[l.x],
                shape.positions[l.y], shape.radius[l.x], shape.radius[l.y]);
        }
        ...
        // Quads as Bilinear Patches
        prim_intersection pintersection;
        if (quads_patches) {
            pintersection = intersect_patch(ray, shape.positions[q.x],
                shape.positions[q.y], shape.positions[q.z],
                shape.positions[q.w]);
        } else {
            pintersection = intersect_quad(ray, shape.positions[q.x],
                shape.positions[q.y], shape.positions[q.z],
                shape.positions[q.w]);
        }
        ...
    ```

5. I decided to follow the $(3.)^{th}$ point, i.e. *"change the data to return the intersection normal and position directly from the intersection call"*, to do this I added other two parameters to `struct prim_intersection{...}`, `normal` and `poistion`, in `yocto_geometry.

    ```cpp
    
        struct prim_intersection {
            vec2f uv       = {0, 0};
            float distance = flt_max;
            bool  hit      = false;
            // MY CODE: Add position and normal, to return them in the intersection call.
            vec3f position = {0, 0, 0};
            vec3f normal   = {0, 0, 1};
            };
    ```    

    I do the same for `struct scene_intersection{}` (`yocto_bvh.h`).

    ```cpp

            struct scene_intersection {

            int   instance = -1;
            int   element  = -1;
            vec2f uv       = {0, 0};
            float distance = 0;
            bool  hit      = false;
            // MY CODE: Add position and normal, to return them in the intersection call.
            vec3f position = {0, 0, 0};
            vec3f normal   = {0, 0, 1};
        };
    ```

    I do the same for `struct shape_intersection{}` (`yocto_shape.h` row 496).

    ```cpp

        struct shape_intersection {

            int   element  = -1;
            vec2f uv       = {0, 0};
            float distance = 0;
            bool  hit      = false;
            // MY CODE: Add position and normal, to return them in the intersection call.
            vec3f position = {0, 0, 0};
            vec3f normal   = {0, 0, 1};
        };
    ```

6. Write `intersect_cone(...)` function in `yocto_geometry.h`, as written in the web-site:

    ```cpp

        // Intersect a ray with a rounded cone
        inline prim_intersection intersect_cone(const ray3f& ray,
            const vec3f& pa, const vec3f& pb, float ra, float rb) {
        
            // NOTE: cone defined by extremes pa and pb, and radious ra and rb.
            // ray.o is the ray origin
            // ray.d is the ray direction
            vec3f ba = pb    - pa;
            vec3f oa = ray.o - pa;
            vec3f ob = ray.o - pb;
            float rr = ra    - rb;
            float m0 = dot(ba,    ba);
            float m1 = dot(ba,    oa);
            float m2 = dot(ba,    ray.d);
            float m3 = dot(ray.d, oa);
            float m5 = dot(oa,    oa);
            float m6 = dot(ob,    ray.d);
            float m7 = dot(ob,    ob);

            // body
            float d2 = m0 - rr *rr;
            float k2 = d2 - m2* m2;
            float k1 = d2 *m3 - m1* m2 + m2 *rr* ra;
            float k0 = d2 *m5 - m1* m1 + m1 *rr* ra *2.0 - m0* ra *ra;
            float h  = k1* k1 - k0 * k2;
            
            if (h < 0.0) return {};
            
            float t = (-sqrt(h) - k1) / k2;
            if( t < 0.0 ) return {};
            
            float y = m1 - ra *rr + t* m2;
            if (y > 0.0 && y < d2) {
                // NOTE: check if the intersection is within the bounds of the cone
                if (t < ray.tmin || t > ray.tmax) return {};
                // NOTE: compute position and normal
                vec3f position = ray_point(ray, t);
                vec3f normal   = normalize(d2 *(oa + t* ray.d) - ba * y);
                // NOTE: compute u and v
                vec2f uv       = compute_uv(ray, pa, pb, normal);
                return {uv, t, true, position, normal};
            }

            // caps
            float h1 = m3 *m3 - m5 + ra* ra;
            float h2 = m6 *m6 - m7 + rb* rb;
            if (max(h1, h2) < 0.0) return {};

            vec4f r = vec4f{1e20f, 1e20f, 1e20f, 1e20f};
            vec3f normal;
            if (h1 > 0.0) {
                t = -m3 - sqrt(h1);
                // WEB-SITE CODE:
                // r = vec4(t, (oa + t *ray.d) / ra);
                normal = normalize((ray_point(ray, t) - pa) / ra);
                r      = vec4f{t, normal.x, normal.y, normal.z};
            }
            if (h2 > 0.0) {
                t = -m6 - sqrt(h2);
                if (t < r.x) {
                // WEB-SITE CODE:
            // r = vec4(t, (ob + t* ray.d) / rb);
                normal = normalize((ray_point(ray, t) - pb) / rb);
                r      = vec4f{t, normal.x, normal.y, normal.z};
                }
            }
            // NOTE: re-assing t for a better readability
            t = r.x;
            if (t < ray.tmin || t > ray.tmax) return {};

            // NOTE: compute position and normal
            vec3f position = ray_point(ray, t);
            // NOTE: compute u and v
            vec2f uv = compute_uv(ray, pa, pb, normal);

            // intersection occurred: set params and exit
            return {uv, t, true, position, normal};
        }
    ```

    Then I had write `compute_uv(...)` function in `yocto_geometry.h` file, to compute the value of `u` and `v`, with `u` computed as in the `line_intersection(...)` function, and `v` as in the `sphere_intersection(...)` function.

    ```cpp

        inline vec2f compute_uv(
                const ray3f& ray, const vec3f& pa, const vec3f& pb, const vec3f& normal) {

            // NOTE: compute u as in the line intersection
            // setup intersection params
            auto iu = ray.d;
            auto iv = pb - pa;
            auto iw = ray.o - pa;
            // compute values to solve a linear system
            auto  a   = dot(iu, iu);
            auto  b   = dot(iu, iv);
            auto  c   = dot(iv, iv);
            auto  d   = dot(iu, iw);
            auto  e   = dot(iv, iw);
            float det = a *c - b* b;
            // compute u
            float u   = clamp((a *e - b* d) / det, 0.f, 1.f);
            
            // NOTE: compute v as in the sphere intersection
            float v = acos(clamp(normal.z, -1.0f, 1.0f)) / pif;
            
            return {u, v};
        }
    ```

7. Write the new `intersect_sphere(...)` function in `yocto_geometry.h`, as written in the web-site:

    ```cpp

        // Intersect a ray with a sphere
        inline prim_intersection intersect_sphere(
            const ray3f& ray, const vec3f& p, float r) {
            // p is the center of the sphere
            // r is the radius of the sphere
            vec3f  oc = ray.o - p;
            float b  = dot(oc, ray.d);
            float c  = dot(oc, oc) - r *r;
            float h  = b* b - c;

            // no intersection
            if (h < 0.0) return {};  
            
            h = sqrt(h);

            // ? WHY COMPUTE t IN THIS WAY?
            // ? t is the distance to the closest intersection,
            auto t = -b - sign(c) * h;

            // exit if not within bounds
            if (t < ray.tmin || t > ray.tmax) return {};
            
            // Compute poisition and normal
            auto position = ray_point(ray, t);
            auto normal   = normalize((ray_point(ray, t) - p) / r);
            
            // Compute uv
            auto u = atan2(normal.y, normal.x) / (2 * pif);
            if (u < 0) u += 1;
            auto v = acos(clamp(normal.z, -1.0f, 1.0f)) / pif;

            return {{u, v}, t, true, position, normal};
        }
    ```

8. Write `intersect_patch(...)` function in `yocto_geometry.h`, as written in the web-site:

    ```cpp

        // Intersect a ray with a bilinear patch.
        inline prim_intersection intersect_patch(const ray3f& ray, const vec3f& p0,
            const vec3f& p1, const vec3f& p2, const vec3f& p3) {
            // NOTE: I decided to 'rename' the parameters to match the code of the
            // paper, I didn't use the names q00, q01, q11, q10 directly to respect the
            // style of the intersect_quad function
            vec3f q00 = p0;
            vec3f q10 = p1;
            vec3f q11 = p2;
            vec3f q01 = p3;
            // q01---------------q11
            // |                   |
            // | e00           e11 |  we precompute
            // |        e10        |  qn = cross(q10-q00,q01-q11)
            // q00---------------q10

            vec3f e10 = q10 - q00;  
            vec3f e11 = q11 - q10;  
            vec3f e00 = q01 - q00;  
            vec3f qn  = cross(q10 - q00, q01 - q11);

            q00 -= ray.o;
            q10 -= ray.o;

            // the equation is: a + b u + c u^2, first compute a+b+c and then b
            float a = dot(cross(q00, ray.d), e00);  
            float c = dot(qn, ray.d);
            float b = dot(cross(q10, ray.d), e11);
            b -= a + c;  

            float det = b *b - 4* a * c;
            // see the right part of Figure 5
            if (det < 0) return {};

            // we -use_fast_math in CUDA_NVRTC_OPTIONS
            det = sqrt(det);
            // two roots (u parameter)
            float u1, u2;
            float t = ray.tmax, u, v;

            // if c == 0, it is a trapezoid  and there is only one root (c != 0 in
            // Stanford models) numerically "stable" root Viete's formula for u1*u2
            if (c == 0) {
                u1 = -a / b;
                u2 = -1;
            } else {
                u1 = (-b - copysignf(det, b)) / 2;
                u2 = a / u1;  
                u1 /= c;
            }

            // is it inside the patch?
            if (0 <= u1 && u1 <= 1) {
                // point on edge e10 (Fig. 4)
                vec3f pa = lerp(q00, q10, u1);
                vec3f pb = lerp(e00, e11, u1);  // it is, actually, pb - pa
                vec3f n   = cross(ray.d, pb);
                det       = dot(n, n);
                n         = cross(n, pa);
                float t1  = dot(n, pb);
                float v1  = dot(n, ray.d);
                // no need to check t1 < t
                // if t1 > ray.tmax,
                if (t1 > 0 && 0 <= v1 && v1 <= det) {  
                t = t1 / det;
                u = u1;
                v = v1 / det;  // it will be rejected
                }                // in rtPotentialIntersection
            }

            // it is slightly different,
            if (0 <= u2 && u2 <= 1) {  
                vec3f pa = lerp(q00, q10, u2);  // since u1 might be good
                vec3f pb = lerp(e00, e11, u2);  // and we need 0 < t2 < t1
                vec3f n  = cross(ray.d, pb);
                det       = dot(n, n);
                n         = cross(n, pa);
                float t2  = dot(n, pb) / det;
                float v2  = dot(n, ray.d);
                if (0 <= v2 && v2 <= det && t > t2 && t2 > 0) {
                t = t2;
                u = u2;
                v = v2 / det;
                }
            }

            if (t < ray.tmin || t > ray.tmax) return {};

            auto position = ray_point(ray, t);

            // Fill the intersection structure irec.
            // Normal(s) for the closest hit will be normalized in a shader.
            vec3f du = lerp(e10, q11 - q01, v);
            vec3f dv = lerp(e00, e11, u);
            
            auto geometric_normal = cross(du, dv);
            #if defined (SHADING_NORMALS)
            const vec3f* vn = patch.vertex_normals;
            auto shading_normal = lerp(lerp(vn[0], vn[1], u), lerp(vn[3], vn[2], u), v);
            #else
            auto shading_normal = geometric_normal;
            #endif

            return {{u, v}, t, true, position, shading_normal};
        }
    ```

9. For each path-trace type function, in `yocto_pathtrace.cpp` adjust the code for:
    - the parameters of `intersect_scene_bvh()`, in all the shader function like `trace_path()` or `trace_pathdirect()`...

        ```cpp

            // MY CODE: add the FLAGs to choose the intersection method
            auto intersection = intersect_scene_bvh(bvh, scene, ray, params.points_speheres, params.lines_cones, params.quads_patches);
        ```

    - the way how to compute the normal and the postion, in all the shader function like `trace_path()` or `trace_pathdirect()`...

        ```cpp

            // MY CODE: I decided to change the data to return the intersection normal
            // and position directly from the intersection call, and not to modify the
            // eval_normal and eval_position functions in yocto_scene.{h/cpp}.
            vec3f position, normal;
            // NOTE: Like in the eval_position check if there is a shape, and then
            // which method we are using, i.e.:
            //  - points or points as spheres
            //  - lines or lines as rounded cones
            //  - quads or quads as bilinear patches
            auto& instance = scene.instances[intersection.instance];
            auto& shape    = scene.shapes[instance.shape];
            // NOTE:
            if ((!shape.points.empty() && params.points_speheres) ||
                (!shape.lines.empty() && params.lines_cones) ||
                (!shape.quads.empty() && params.quads_patches)) {
                position = transform_point(instance.frame, intersection.position);
                normal   = transform_direction(instance.frame, intersection.normal);
            } else {
                position = eval_shading_position(scene, intersection, outgoing);
                normal   = eval_shading_normal(scene, intersection, outgoing);
            }
        ``` 

10. In `yocto_trace.cpp` the `sample_lights_pdf()` function we need to add `params` or `points_sphere`, `lines_cones`, `quads_patches` because it calls `intersect_intsance()`.
        
        - Add `params` at `sample_lights_pdf()` in `trace_path()` function

        ```cpp
            
            
        ```
