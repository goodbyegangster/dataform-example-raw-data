:.DEFAULT_GOAL := help

.PHONY: help
help:
	@printf "%-30s %-60s\n" "[Sub command]" "[Description]"
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %-60s\n", $$1, $$2}'

.PHONY: dataform-init-creds
dataform-init-creds: ## 認証情報ファイルを作成
	dataform init-creds

.PHONY: dataform-format
dataform-format: ## フォーマット
	dataform format

.PHONY: dataform-compile
dataform-compile: ## コンパイル
	dataform compile

.PHONY: dataform-run
dataform-run: ## 実行
	dataform run --tags=staging --include-deps --disable-assertions

.PHONY: dataform-test
dataform-test: ## テスト
	dataform test
