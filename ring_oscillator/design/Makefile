run_tb: compile_tb
	./simv

compile_tb:
	vcs -full64 \
		-sverilog \
		-timescale=1ns/1ps \
		-debug_access+pp \
		-lca \
		lhca.sv \
		ring_oscillator.sv \
		rng_tb.sv \
		| tee output.log

clean:
	rm -rf ./simv
	rm -rf output.log
