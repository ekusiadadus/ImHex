.phony

build:
	cmake -b ./build .

git-clone:
	git clone https://github.com/WerWolv/ImHex --recurse-submodules