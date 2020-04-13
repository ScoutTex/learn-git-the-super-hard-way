CHAPTERS=$(patsubst source/%,%,$(wildcard source/chapter*.md))

all: $(CHAPTERS)

docker:
	docker build -t learn-git-generate ./docker

chapter0.md: source/chapter0.md
chapter1.md: source/chapter1.md
chapter2.md: source/chapter1.md source/chapter2.md
chapter3.md: source/chapter3.md
chapter4.md: source/chapter4.md
chapter5.md: source/chapter5.md

$(CHAPTERS):
	./generate $^ >$@

clean:
	rm -f ./chapter*.md

.PHONY: all docker clean

.DELETE_ON_ERROR: $(CHAPTERS)
