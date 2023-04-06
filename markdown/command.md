# List of usefull command

## Build

```bash

    mkdir build
    cd  build
    cmake ..
    cmake --build . --parallel 8
```

or

```bash

    mkdir -p build/terminal
    cd  build/terminal
    cmake ../.. -GNinja
    cmake --build . --parallel 8
```

## My command

```bash
    ./bin/ytrace --scene tests/shapes2/shapes2.json --output out/path/shapes2_geometry.jpg --sampler path --samples 1024 --resolution 720 --bounces 8 --interactive

    ./bin/ypathtrace --scene tests/shapes4/shapes4.json  --output out/lowres/shapes4_method_project.jpg --shader pathtrace --samples 1024 --resolution 720 --bounces 8 --points true --lines true

    ./bin/ypathtrace --scene tests/shapes4/shapes4.json  --output out/lowres/shapes4_method_defaul.jpg --shader pathtrace --samples 1024 --resolution 720 --bounces 8
```

## Run Test Ray-Trace

### 01 - CornellBox

```bash

./bin/yraytrace --scene tests/01_cornellbox/cornellbox.json --output out/highres/01_cornellbox_512_64.jpg --samples 64 --resolution 512
./bin/yraytrace --scene tests/01_cornellbox/cornellbox.json --output out/highres/01_cornellbox_512_256.jpg --samples 256 --resolution 512
./bin/yraytrace --scene tests/01_cornellbox/cornellbox.json --output out/highres/01_cornellbox_512_1024.jpg --samples 1024 --resolution 512
./bin/yraytrace --scene tests/01_cornellbox/cornellbox.json --output out/highres/01_cornellbox_512_4096.jpg --samples 4096 --resolution 512
```

### 02 - Matte

```bash

./bin/yraytrace --scene tests/02_matte/matte.json --output out/lowres/0x_color_720_9.jpg --samples 9 --shader color --resolution 720
./bin/yraytrace --scene tests/02_matte/matte.json --output out/lowres/0x_normal_720_9.jpg --samples 9 --shader normal --resolution 720
./bin/yraytrace --scene tests/02_matte/matte.json --output out/lowres/0x_texcoord_720_9.jpg --samples 9 --shader texcoord --resolution 720
./bin/yraytrace --scene tests/02_matte/matte.json --output out/lowres/0x_eyelight_720_9.jpg --samples 9 --shader eyelight --resolution 720
./bin/yraytrace --scene tests/02_matte/matte.json --output out/lowres/02_matte_720_256.jpg --samples 25 --resolution 720

./bin/yraytrace --scene tests/02_matte/matte.json --output out/highres/0x_color_1280_9.jpg --samples 9 --shader color --resolution 1280
./bin/yraytrace --scene tests/02_matte/matte.json --output out/highres/0x_normal_1280_9.jpg --samples 9 --shader normal --resolution 1280
./bin/yraytrace --scene tests/02_matte/matte.json --output out/highres/0x_texcoord_1280_9.jpg --samples 9 --shader texcoord --resolution 1280
./bin/yraytrace --scene tests/02_matte/matte.json --output out/highres/0x_eyelight_1280_9.jpg --samples 9 --shader eyelight --resolution 1280
./bin/yraytrace --scene tests/02_matte/matte.json --output out/highres/02_matte_1280_256.jpg --samples 25 --resolution 1280
./bin/yraytrace --scene tests/02_matte/matte.json --output out/highres/02_matte_1280_1024.jpg --samples 1024 --resolution 1280
```

### 03 - Texture

```bash

./bin/yraytrace --scene tests/03_texture/texture.json --output out/lowres/03_texture_720_256.jpg --samples 256 --resolution 720
./bin/yraytrace --scene tests/03_texture/texture.json --output out/highres/03_texture_1280_256.jpg --samples 256 --resolution 1280
./bin/yraytrace --scene tests/03_texture/texture.json --output out/highres/03_texture_1280_1024.jpg --samples 1024 --resolution 1280
```

### 04 - Envlight

```bash

./bin/yraytrace --scene tests/04_envlight/envlight.json --output out/lowres/04_envlight_720_256.jpg --samples 256 --resolution 720
./bin/yraytrace --scene tests/04_envlight/envlight.json --output out/highres/04_envlight_1280_256.jpg --samples 256 --resolution 1280
./bin/yraytrace --scene tests/04_envlight/envlight.json --output out/highres/04_envlight_1280_1024.jpg --samples 1024 --resolution 1280
```

### 05 - AreaLight

```bash

./bin/yraytrace --scene tests/05_arealight/arealight.json --output out/lowres/05_arealight_720_256.jpg --samples 256 --resolution 720
./bin/yraytrace --scene tests/05_arealight/arealight.json --output out/highres/05_arealight_1280_256.jpg --samples 256 --resolution 1280
./bin/yraytrace --scene tests/05_arealight/arealight.json --output out/highres/05_arealight_1280_1024.jpg --samples 1024 --resolution 1280
```

### 06 - Metal

```bash

./bin/yraytrace --scene tests/06_metal/metal.json --output out/lowres/06_metal_720_256.jpg --samples 256 --resolution 720
./bin/yraytrace --scene tests/06_metal/metal.json --output out/highres/06_metal_1280_256.jpg --samples 256 --resolution 1280
./bin/yraytrace --scene tests/06_metal/metal.json --output out/highres/06_metal_1280_1024.jpg --samples 1024 --resolution 1280
./bin/yraytrace --scene tests/06_metal/metal.json --output out/highres/06_metal_1280_4096.jpg --samples 4096 --resolution 1280
```

### 07 - Plastic

```bash

./bin/yraytrace --scene tests/07_plastic/plastic.json --output out/lowres/07_plastic_720_256.jpg --samples 256 --resolution 720
./bin/yraytrace --scene tests/07_plastic/plastic.json --output out/highres/07_plastic_1280_256.jpg --samples 256 --resolution 1280
./bin/yraytrace --scene tests/07_plastic/plastic.json --output out/highres/07_plastic_1280_1024.jpg --samples 1024 --resolution 1280
./bin/yraytrace --scene tests/07_plastic/plastic.json --output out/highres/07_plastic_1280_4096.jpg --samples 4096 --resolution 1280
```

### 08 - Glass

```bash

./bin/yraytrace --scene tests/08_glass/glass.json --output out/lowres/08_glass_720_256.jpg --samples 256 --bounces  8 --resolution 720
./bin/yraytrace --scene tests/08_glass/glass.json --output out/highres/08_glass_1280_256.jpg --samples 256 --bounces 8 --resolution 1280
./bin/yraytrace --scene tests/08_glass/glass.json --output out/highres/08_glass_1280_1024.jpg --samples 1024 --bounces 8 --resolution 1280
```

### 09 - Opacity

```bash

./bin/yraytrace --scene tests/09_opacity/opacity.json --output out/lowres/09_opacity_720_256.jpg --samples 256 --resolution 720
./bin/yraytrace --scene tests/09_opacity/opacity.json --output out/highres/09_opacity_1280_256.jpg --samples 256 --resolution 1280
./bin/yraytrace --scene tests/09_opacity/opacity.json --output out/highres/09_opacity_1280_1024.jpg --samples 1024 --resolution 1280
```

### 10 - Hair

```bash

./bin/yraytrace --scene tests/10_hair/hair.json --output out/lowres/10_hair_720_256.jpg --samples 256 --resolution 720
./bin/yraytrace --scene tests/10_hair/hair.json --output out/highres/10_hair_1280_256.jpg --samples 256 --resolution 1280
./bin/yraytrace --scene tests/10_hair/hair.json --output out/highres/10_hair_1280_1024.jpg --samples 1024 --resolution 1280
```

### 11 - Bathroom1

```bash

./bin/yraytrace --scene tests/11_bathroom1/bathroom1.json --output out/lowres/11_bathroom1_720_256.jpg --samples 256 --bounces  8 --resolution 720
./bin/yraytrace --scene tests/11_bathroom1/bathroom1.json --output out/highres/11_bathroom1_1280_256.jpg --samples 256 --bounces 8 --resolution 1280
./bin/yraytrace --scene tests/11_bathroom1/bathroom1.json --output out/highres/11_bathroom1_1280_1024.jpg --samples 1024 --bounces 8 --resolution 1280
./bin/yraytrace --scene tests/11_bathroom1/bathroom1.json --output out/highres/11_bathroom1_1280_4096.jpg --samples 4096 --bounces 8 --resolution 1280
```

### 12 - EcoSys

```bash

./bin/yraytrace --scene tests/12_ecosys/ecosys.json --output out/lowres/12_ecosys_720_256.jpg --samples 256 --resolution 720
./bin/yraytrace --scene tests/12_ecosys/ecosys.json --output out/highres/12_ecosys_1280_256.jpg --samples 256 --resolution 1280
./bin/yraytrace --scene tests/12_ecosys/ecosys.json --output out/highres/12_ecosys_1280_1024.jpg --samples 1024 --resolution 1280
```

## Run Test Path-Trace

### 01 - CornnelBox

```bash

./bin/ypathtrace --scene tests/01_cornellbox/cornellbox.json --output out/naive/01_cornellbox_512_256.jpg --shader naive --samples 256 --resolution 512 --bounces 4

./bin/ypathtrace --scene tests/01_cornellbox/cornellbox.json --output out/path/01_cornellbox_512_256.jpg --shader pathtrace --samples 256 --resolution 512 --bounces 4

./bin/ypathtrace --scene tests/01_cornellbox/cornellbox.json --output out/highres/01_cornellbox_512_1024.jpg --shader pathtrace --samples 1024 --resolution 512 --bounces 4
```

### 02 - Matte

```bash

./bin/ypathtrace --scene tests/02_matte/matte.json --output out/naive/02_matte_720_256.jpg --shader naive --samples 256 --resolution 720 --bounces 4

./bin/ypathtrace --scene tests/02_matte/matte.json --output out/path/02_matte_720_256.jpg --shader pathtrace --samples 256 --resolution 720 --bounces 4

./bin/ypathtrace --scene tests/02_matte/matte.json --output out/highres/02_matte_1280_1024.jpg --shader pathtrace --samples 1024 --resolution 1280 --bounces 4
```

### 03 - Metal

```bash

./bin/ypathtrace --scene tests/03_metal/metal.json --output out/naive/03_metal_720_256.jpg --shader naive --samples 256 --resolution 720 --bounces 4

./bin/ypathtrace --scene tests/03_metal/metal.json --output out/path/03_metal_720_256.jpg --shader pathtrace --samples 256 --resolution 720 --bounces 4

./bin/ypathtrace --scene tests/03_metal/metal.json --output out/highres/03_metal_1280_1024.jpg --shader pathtrace --samples 1024 --resolution 1280 --bounces 4
```

### 04 - Plastic

```bash

./bin/ypathtrace --scene tests/04_plastic/plastic.json --output out/naive/04_plastic_720_256.jpg --shader naive --samples 256 --resolution 720 --bounces 4

./bin/ypathtrace --scene tests/04_plastic/plastic.json --output out/path/04_plastic_720_256.jpg --shader pathtrace --samples 256 --resolution 720 --bounces 4

./bin/ypathtrace --scene tests/04_plastic/plastic.json --output out/highres/04_plastic_1280_1024.jpg --shader pathtrace --samples 1024 --resolution 1280 --bounces 4
```

### 05 - Glass

```bash

./bin/ypathtrace --scene tests/05_glass/glass.json --output out/naive/05_glass_720_256.jpg --shader naive --samples 256 --resolution 720 --bounces 8

./bin/ypathtrace --scene tests/05_glass/glass.json --output out/path/05_glass_720_256.jpg --shader pathtrace --samples 256 --resolution 720 --bounces 8

./bin/ypathtrace --scene tests/05_glass/glass.json --output out/highres/05_glass_1280_1024.jpg --shader pathtrace --samples 1024 --resolution 1280 --bounces 8
```

### 06 - Opacity

```bash

./bin/ypathtrace --scene tests/06_opacity/opacity.json --output out/naive/06_opacity_720_256.jpg --shader naive --samples 256 --resolution 720 --bounces 8

./bin/ypathtrace --scene tests/06_opacity/opacity.json --output out/path/06_opacity_720_256.jpg --shader pathtrace --samples 256 --resolution 720 --bounces 8

./bin/ypathtrace --scene tests/06_opacity/opacity.json --output out/highres/06_opacity_1280_1024.jpg --shader pathtrace --samples 1024 --resolution 1280 --bounces 8
```

### 07 - Hair

```bash

./bin/ypathtrace --scene tests/07_hair/hair.json --output out/naive/07_hair_720_256.jpg --shader naive --samples 256 --resolution 720 --bounces 4

./bin/ypathtrace --scene tests/07_hair/hair.json --output out/path/07_hair_720_256.jpg --shader pathtrace --samples 256 --resolution 720 --bounces 4

./bin/ypathtrace --scene tests/07_hair/hair.json --output out/highres/07_hair_1280_1024.jpg --shader pathtrace --samples 1024 --resolution 1280 --bounces 4
```

### 08 - Lens

```bash

./bin/ypathtrace --scene tests/08_lens/lens.json --output out/naive/08_lens_720_256.jpg --shader naive --samples 256 --resolution 720 --bounces 4

./bin/ypathtrace --scene tests/08_lens/lens.json --output out/path/08_lens_720_256.jpg --shader pathtrace --samples 256 --resolution 720 --bounces 4

./bin/ypathtrace --scene tests/08_lens/lens.json --output out/highres/08_lens_1280_1024.jpg --shader pathtrace --samples 1024 --resolution 1280 --bounces 4
```

### 11 - Bathroom

```bash

./bin/ypathtrace --scene tests/11_bathroom1/bathroom1.json --output out/path/11_bathroom1_720_256.jpg --shader pathtrace --samples 256 --resolution 720 --bounces 8

./bin/ypathtrace --scene tests/11_bathroom1/bathroom1.json --output out/highres/11_bathroom1_1280_1024.jpg --shader pathtrace --samples 1024 --resolution 1280 --bounces 8
```

### 12 - Ecosys

```bash

./bin/ypathtrace --scene tests/12_ecosys/ecosys.json --output out/path/12_ecosys_720_256.jpg --shader pathtrace --samples 256 --resolution 720 --bounces 8

./bin/ypathtrace --scene tests/12_ecosys/ecosys.json --output out/highres/12_ecosys_1280_1024.jpg --shader pathtrace --samples 1024 --resolution 1280 --bounces 8
```

### 13 - Bedroom

```bash

./bin/ypathtrace --scene tests/13_bedroom/bedroom.json --output out/path/13_bedroom_720_256.jpg --shader pathtrace --samples 256 --resolution 720 --bounces 8

./bin/ypathtrace --scene tests/13_bedroom/bedroom.json --output out/highres/13_bedroom_1280_1024.jpg --shader pathtrace --samples 1024 --resolution 1280 --bounces 8
```

### 14 - Car

```bash

./bin/ypathtrace --scene tests/14_car1/car1.json --output out/path/14_car1_720_256.jpg --shader pathtrace --samples 256 --resolution 720 --bounces 8

./bin/ypathtrace --scene tests/14_car1/car1.json --output out/highres/14_car1_1280_1024.jpg --shader pathtrace --samples 1024 --resolution 1280 --bounces 8
```

### 15 - Classroom

```bash

./bin/ypathtrace --scene tests/15_classroom/classroom.json --output out/path/15_classroom_720_256.jpg --shader pathtrace --samples 256 --resolution 720 --bounces 8

./bin/ypathtrace --scene tests/15_classroom/classroom.json --output out/highres/15_classroom_71280_1024.jpg --shader pathtrace --samples 1024 --resolution 1280 --bounces 8
```

### 16 - Coffe

```bash

./bin/ypathtrace --scene tests/16_coffee/coffee.json --output out/path/16_coffee_720_256.jpg --shader pathtrace --samples 256 --resolution 720 --bounces 8

./bin/ypathtrace --scene tests/16_coffee/coffee.json --output out/highres/16_coffee_1280_1024.jpg --shader pathtrace --samples 1024 --resolution 1280 --bounces 8
```

### 17 - Kitchen

```bash

./bin/ypathtrace --scene tests/17_kitchen/kitchen.json --output out/path/17_kitchen_720_256.jpg --shader pathtrace --samples 256 --resolution 720 --bounces 8

./bin/ypathtrace --scene tests/17_kitchen/kitchen.json --output out/highres/17_kitchen_1280_1024.jpg --shader pathtrace --samples 1024 --resolution 1280 --bounces 8
```

## Run Test Volumetric Path-Trace


### 01 - Surface

```bash

./bin/ypathtrace --scene tests/01_surface/surface.json --output out/lowres/01_surface_720_256.jpg --shader pathtrace  --samples 256 --resolution 720

./bin/ypathtrace --scene tests/01_surface/surface.json --output out/highres/01_surface_1280_1024.jpg --shader pathtrace --samples 1024 --resolution 1280
```

### 02 - Rolling Teapot

```bash

./bin/ypathtrace --scene tests/02_rollingteapot/rollingteapot.json --output out/lowres/02_rollingteapot_720_256.jpg --shader pathtrace  --samples 256 --resolution 720

./bin/ypathtrace --scene tests/02_rollingteapot/rollingteapot.json --output out/highres/02_rollingteapot_1280_1024.jpg --shader pathtrace --samples 1024 --resolution 1280
```

### 03 - Volume

```bash

./bin/ypathtrace --scene tests/03_volume/volume.json --output out/lowres/03_volume_720_256.jpg --shader volpathtrace  --samples 256 --resolution 720 --bounces 64

./bin/ypathtrace --scene tests/03_volume/volume.json --output out/highres/03_volume_1280_1024.jpg --shader volpathtrace --samples 1024 --resolution 1280 --bounces 64
```

### 04 - Head

```bash

./bin/ypathtrace --scene tests/04_head1/head1.json --output out/lowres/04_head1_720_256.jpg --shader volpathtrace  --samples 256 --resolution 720

./bin/ypathtrace --scene tests/04_head1/head1.json --output out/highres/04_head1_1280_1024.jpg --shader volpathtrace --samples 1024 --resolution 1280
```

### 05 - Head 1ss

```bash

./bin/ypathtrace --scene tests/05_head1ss/head1ss.json --output out/lowres/05_head1ss_720_256.jpg --shader volpathtrace  --samples 256 --resolution 720 --bounces 64

./bin/ypathtrace --scene tests/05_head1ss/head1ss.json --output out/highres/05_head1ss_1280_1024.jpg --shader volpathtrace --samples 4096 --resolution 1280 --bounces 64
```