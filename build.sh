brew bundle --no-lock --file dist/Brewfile
mkdir -p build
cd build
CC=$(brew --prefix gcc@12)/bin/gcc-12     \
CXX=$(brew --prefix gcc@12)/bin/g++-12    \
OBJC=$(brew --prefix llvm)/bin/clang      \
OBJCXX=$(brew --prefix llvm)/bin/clang++  \
PKG_CONFIG_PATH="$(brew --prefix openssl)/lib/pkgconfig":"$(brew --prefix)/lib/pkgconfig" \
MACOSX_DEPLOYMENT_TARGET="10.15"          \
cmake                                     \
  -DCMAKE_BUILD_TYPE=$BUILD_TYPE          \
  -DCREATE_BUNDLE=ON                      \
  -DCREATE_PACKAGE=ON                     \
  -DCMAKE_C_COMPILER_LAUNCHER=ccache      \
  -DCMAKE_CXX_COMPILER_LAUNCHER=ccache    \
  -DCMAKE_OBJC_COMPILER_LAUNCHER=ccache   \
  -DCMAKE_OBJCXX_COMPILER_LAUNCHER=ccache \
  ..
make -j4 package