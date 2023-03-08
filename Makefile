
setup: homebrew swiftformat swiftlint

homebrew:
	@which brew || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

swiftformat:
	@which swiftformat || brew install swiftformat

format: setup
	swiftformat GeoMap --swiftversion 5

swiftlint:
	@which swiftlint || brew install swiftlint

lint: setup
	swiftlint GeoMap
