.PHONY : build autobuild

docker:
	docker build -t latexmk .

autobuild:
	docker run --rm -it -v ${PWD}:/target latexmk -pdf -pvc thesis.tex

clean:
	docker run --rm -it -v ${PWD}:/target latexmk -c

