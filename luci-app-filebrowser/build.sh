#!/bin/sh
# Reference: https://medium.com/@diogok/on-golang-static-binaries-cross-compiling-and-plugins-1aed33499671
# Reference: https://golang.org/doc/install/source#environment
export GOPATH=${PWD}/GOPATH
export CGO_ENABLED=0
export GOOS=linux
# GOARCH=amd64 go build -a -ldflags '-s -w' -o mmm
main_file=${PWD}/src/filebrowser_HashPwd.go

[ ! -d ${PWD}/build ] && mkdir ${PWD}/build
[ ! -d ${PWD}/comp ] && mkdir ${PWD}/comp

rm ${PWD}/build/*
rm ${PWD}/comp/*

go get golang.org/x/crypto/bcrypt

GOARCH=amd64 go build -a -ldflags '-s -w' -o ${PWD}/build/amd64 $main_file
upx --lzma -o ${PWD}/comp/amd64 ${PWD}/build/amd64

GOARCH=386 GO386=387 go build -a -ldflags '-s -w' -o ${PWD}/build/i386_387 $main_file
upx --lzma -o ${PWD}/comp/i386_387 ${PWD}/build/i386_387

GOARCH=386 GO386=sse2 go build -a -ldflags '-s -w' -o ${PWD}/build/i386_sse2 $main_file
upx --lzma -o ${PWD}/comp/i386_sse2 ${PWD}/build/i386_sse2

GOARCH=arm GOARM=5 go build -a -ldflags '-s -w' -o ${PWD}/build/arm_5 $main_file
upx --lzma -o ${PWD}/comp/arm_5 ${PWD}/build/arm_5

GOARCH=arm GOARM=6 go build -a -ldflags '-s -w' -o ${PWD}/build/arm_6 $main_file
upx --lzma -o ${PWD}/comp/arm_6 ${PWD}/build/arm_6

GOARCH=arm GOARM=7 go build -a -ldflags '-s -w' -o ${PWD}/build/arm_7 $main_file
upx --lzma -o ${PWD}/comp/arm_7 ${PWD}/build/arm_7

GOARCH=arm64 go build -a -ldflags '-s -w' -o ${PWD}/build/arm64 $main_file
upx --lzma -o ${PWD}/comp/arm64 ${PWD}/build/arm64

GOARCH=ppc64 GOPPC64=power8 go build -a -ldflags '-s -w' -o ${PWD}/build/ppc64_power8 $main_file
# upx --lzma -o ${PWD}/comp/ppc64_power8 ${PWD}/build/ppc64_power8
cp ${PWD}/build/ppc64_power8 ${PWD}/comp/ppc64_power8

GOARCH=ppc64 GOPPC64=power9 go build -a -ldflags '-s -w' -o ${PWD}/build/ppc64_power9 $main_file
# upx --lzma -o ${PWD}/comp/ppc64_power9 ${PWD}/build/ppc64_power9
cp ${PWD}/build/ppc64_power9 ${PWD}/comp/ppc64_power9

# GOARCH=ppc64le GOPPC64=power8 go build -a -ldflags '-s -w' -o ${PWD}/build/ppc64le_power8 $main_file
# upx --lzma -o ${PWD}/comp/ppc64le_power8 ${PWD}/build/ppc64le_power8

# GOARCH=ppc64le GOPPC64=power9 go build -a -ldflags '-s -w' -o ${PWD}/build/ppc64le_power9 $main_file
# upx --lzma -o ${PWD}/comp/ppc64le_power9 ${PWD}/build/ppc64le_power9

GOARCH=mips GOMIPS=hardfloat go build -a -ldflags '-s -w' -o ${PWD}/build/mips_hardfloat $main_file
upx --lzma -o ${PWD}/comp/mips_hardfloat ${PWD}/build/mips_hardfloat

GOARCH=mips GOMIPS=softfloat go build -a -ldflags '-s -w' -o ${PWD}/build/mips_softfloat $main_file
upx --lzma -o ${PWD}/comp/mips_softfloat ${PWD}/build/mips_softfloat

GOARCH=mipsle GOMIPS=hardfloat go build -a -ldflags '-s -w' -o ${PWD}/build/mipsle_hardfloat $main_file
upx --lzma -o ${PWD}/comp/mipsle_hardfloat ${PWD}/build/mipsle_hardfloat

GOARCH=mipsle GOMIPS=softfloat go build -a -ldflags '-s -w' -o ${PWD}/build/mipsle_softfloat $main_file
upx --lzma -o ${PWD}/comp/mipsle_softfloat ${PWD}/build/mipsle_softfloat

GOARCH=mips64 GOMIPS64=hardfloat go build -a -ldflags '-s -w' -o ${PWD}/build/mips64_hardfloat $main_file
# upx --lzma -o ${PWD}/comp/mips64_hardfloat ${PWD}/build/mips64_hardfloat
cp ${PWD}/build/mips64_hardfloat ${PWD}/comp/mips64_hardfloat

GOARCH=mips64 GOMIPS64=softfloat go build -a -ldflags '-s -w' -o ${PWD}/build/mips64_softfloat $main_file
# upx --lzma -o ${PWD}/comp/mips64_softfloat ${PWD}/build/mips64_softfloat
cp ${PWD}/build/mips64_softfloat ${PWD}/comp/mips64_softfloat

GOARCH=mips64le GOMIPS64=hardfloat go build -a -ldflags '-s -w' -o ${PWD}/build/mips64le_hardfloat $main_file
# upx --lzma -o ${PWD}/comp/mips64le_hardfloat ${PWD}/build/mips64le_hardfloat
cp ${PWD}/build/mips64le_hardfloat ${PWD}/comp/mips64le_hardfloat

GOARCH=mips64le GOMIPS64=softfloat go build -a -ldflags '-s -w' -o ${PWD}/build/mips64le_softfloat $main_file
# upx --lzma -o ${PWD}/comp/mips64le_softfloat ${PWD}/build/mips64le_softfloat
cp ${PWD}/build/mips64le_softfloat ${PWD}/comp/mips64le_softfloat

GOARCH=s390x go build -a -ldflags '-s -w' -o ${PWD}/build/s390x $main_file
# upx --lzma -o ${PWD}/comp/s390x ${PWD}/build/s390x
cp ${PWD}/build/s390x ${PWD}/comp/s390x
