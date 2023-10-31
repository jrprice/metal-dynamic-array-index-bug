#include <metal_stdlib>

using namespace metal;


struct vertex_outputs {
  float4 position [[position]];
};

vertex vertex_outputs vert_main() {
  vertex_outputs result = {};
  result.position = float4(1, 1, 1, 1);
  return result;
}


template<typename T, size_t N>
struct tint_array {
  thread T& operator[](size_t i) thread { return elements[i]; }
  const thread T& operator[](size_t i) const thread { return elements[i]; }
  T elements[N];
};

fragment float4 frag_main() {
  uint const index = 0;
  float const result = tint_array<float, 50>{
    0.f, 1.f, 2.f, 3.f, 4.f, 5.f, 6.f, 7.f, 8.f, 9.f,
    10.f, 11.f, 12.f, 13.f, 14.f, 15.f, 16.f, 17.f, 18.f, 19.f,
    20.f, 21.f, 22.f, 23.f, 24.f, 25.f, 26.f, 27.f, 28.f, 29.f,
    30.f, 31.f, 32.f, 33.f, 34.f, 35.f, 36.f, 37.f, 38.f, 39.f,
    40.f, 41.f, 42.f, 43.f, 44.f, 45.f, 46.f, 47.f, 48.f, 49.f}[min(index, 49u)];
  return result;
}
