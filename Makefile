.PHONY: build test

# Environments
-include .env


define get_pubspec
$(shell yq -r ".$1" pubspec.yaml)
endef

#: list all targets
help:
	@grep -B1 -E "^[a-zA-Z0-9_%-]+:([^\=]|$$)" Makefile \
		| grep -v -- -- \
		| sed 'N;s/\n/###/' \
		| sed -n 's/^#: \(.*\)###\(.*\):.*/\2###\1/p' \
		| column -t -s '###'

#: code formatting
fmt:
	dart fix --apply
	dart format --fix lib/src/

#: analyzes the project's Dart source code
lint:
	dart analyze

#: flutter test
test:
	flutter test --coverage  --coverage-path test/lcov.info $(F_FLAGS)

#: build the package
publish:
	flutter pub publish --dry-run
