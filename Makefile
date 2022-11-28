.DEFAULT_GOAL := help

ALL_TESTS = nvim --headless -c "PlenaryBustedDirectory lua/tests/ {minimal_init='lua/tests/testing_config.vim'; timeout=500}"

.PHONY: help
help: ## This help menu
	@grep -E '^\S+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %s\n", $$1, $$2}'

.PHONY: test
test: ## Run tests
	@$(ALL_TESTS)

.PHONY: test-watch
test-watch: ## Run tests in watch mode
	- @$(ALL_TESTS)
	@while true; do \
		inotifywait -qq -r -e create,modify,move,delete ./; \
		printf "\n[ . . . Re-running tests . . . ]\n"; \
		$(ALL_TESTS); \
	done
