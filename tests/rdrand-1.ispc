
export uniform int width() { return programCount; }

export void f_f(uniform float RET[], uniform float aFOO[]) {
#if !defined(ISPC_TARGET_AVX11) && !defined(ISPC_TARGET_AVX2)
    RET[programIndex] = 1;
#else

    uniform float r = -1;
    uniform int count = 0;
    while (!rdrand(&r)) {
        ++count;
    }
    RET[programIndex] = (r >= 0 && r < 1);

#endif
}

export void result(uniform float RET[]) {
    RET[programIndex] = 1;
}
