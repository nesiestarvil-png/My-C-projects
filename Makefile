EXE = circuit_analyzer

all: $(EXE)

$(EXE): circuit_analyzer.c
	gcc circuit_analyzer.c -o $(EXE) -lm

clean:
	rm -f $(EXE)

test-series-safe: $(EXE)
	bash tests/test_series_safe.sh

test-parallel-safe: $(EXE)
	bash tests/test_parallel_safe.sh

test-warning: $(EXE)
	bash tests/test_warning.sh

test-dangerous: $(EXE)
	bash tests/test_dangerous.sh

test-invalid-connection: $(EXE)
	bash tests/test_invalid_connection.sh

test-structure:
	bash tests/test_structure.sh

test: test-series-safe test-parallel-safe test-warning test-dangerous test-invalid-connection test-structure
