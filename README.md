VisualC++用のソリューション

Use this command to install open62541

```
$ mkdir deps
$ cd deps 
$ git clone -b v1.3.7 --recursive git@github.com:open62541/open62541.git
$ cd open62541
$ cmake -S . -B build_VS2022 -G "Visual Studio 17 2022" -DUA_ENABLE_PUBSUB=ON -DUA_ENABLE_SUBSCRIPTIONS=ON -DUA_ENABLE_ENCRYPTION=OPENSSL -DUA_ENABLE_PUBSUB_INFORMATIONMODEL=ON -DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=ON -DBUILD_SHARED_LIBS=ON -DUA_BUILD_EXAMPLES=OFF -DCMAKE_BUILD_TYPE=Release
```


And then, open open62541.sln in build_VS2022 folder, and build the solution with "Release" mode.

```
$ cmake --build build_VS2022
$ cmake --install build_VS2022 --prefix ../..
```

Finally, move `bin/open62541.dll` to `lib\open62541.dll`.