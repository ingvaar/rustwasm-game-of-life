# ANSI color codes
COLOR_RESET := \033[0m
COLOR_GREEN := \033[92m
COLOR_YELLOW := \033[93m

# Variables
WasmTargetName := wasm32-unknown-unknown
WasmSourceDir := ./rust-wasm
WasmTargetDir := ./rust-wasm/target
FrontSourceDir := ./front
FrontDistDir := ./front/dist

# Targets and Commands
.PHONY: all build clean help serve

all: clean build

build:
	@echo -e "$(COLOR_GREEN)Building WebAssembly...$(COLOR_RESET)"
	@cd $(WasmSourceDir) && \
		wasm-pack build
	@echo -e "$(COLOR_GREEN)Building Frontend...$(COLOR_RESET)"
	@cd $(FrontSourceDir) && \
		yarn install && \
		yarn build

clean:
	@echo -e "$(COLOR_YELLOW)Cleaning up...$(COLOR_RESET)"
	@rm -rf $(WasmTargetDir)
	@rm -rf $(FrontDistDir)

serve:
	@echo -e "$(COLOR_GREEN)Starting Yarn development server...$(COLOR_RESET)"
	@cd $(FrontSourceDir) && \
		yarn start -C $(FrontSourceDir)

help:
	@echo "Available targets:"
	@echo "  all       - Clean and build"
	@echo "  build     - Build WebAssembly and Frontend"
	@echo "  clean     - Clean the project"
	@echo "  serve     - Start Yarn development server"
	@echo "  help      - Show this help message"
