#! /usr/bin/bash

DXC=${DXC:-dxc}

current_dir=$(dirname ${BASH_SOURCE[0]})

for hlsl in $current_dir/*.hlsl; do
    spirv=${hlsl%.hlsl}-hlsl.spv
    ${DXC} -E main -T cs_6_5 -spirv -fvk-use-scalar-layout $hlsl -Fo $spirv
done