# About this repo
- Using in Ubuntu 20.04

# Install
## Install Ninja
```
$ sudo apt install ninja-build
```

## Build open62541
open62541をgit cloneして，以下のコマンドを実行する

```
$ cmake -S . -B build -G "Ninja" -DUA_BUILD_EXAMPLES=ON -DUA_BUILD_TOOLS=ON -DUA_ENABLE_PUBSUB=ON -DUA_ENABLE_SUBSCRIPTIONS=ON -DUA_ENABLE_ENCRYPTION=OPENSSL -DUA_ENABLE_PUBSUB_INFORMATIONMODEL=ON -DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=ON
$ cmake --build build
$ cd build && make install
```

ここで，動的ライブラリを生成せず静的ライブラリを生成するために，BUILD_SHARED_LIBSオプションはOFFのままとした．

## Install open62541
```
$ cmake --install build
```

# Build develop src
```
add_executable(<target> <target>.c)
target_link_libraries(<target> open62541::open62541)
```

