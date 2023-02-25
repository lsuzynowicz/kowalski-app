#!/bin/bash

if [ $# -lt 1 ]; then
	cmd=""
else
	cmd="$1"
fi

case "$cmd" in
	start)
		./node_modules/.bin/ng serve
	;;
	lint)
		./node_modules/.bin/ng lint
	;;
	test)
		./node_modules/.bin/ng lint && \
		./node_modules/.bin/ng test
	;;
	build)
		./node_modules/.bin/ng build
	;;
	sw)
		$0 build
		echo "Open: http://localhost:8080/"
		http-server --cors -c-1 dist/`ls dist/`
	;;
	add)
		./node_modules/.bin/ng generate component $2
	;;
	push)
		git commit -a && \
		git pull && \
		git push
	;;
	*)
		echo "Usage: $0 [command]"
	;;
esac
