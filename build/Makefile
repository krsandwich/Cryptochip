#=========================================================================
# Makefile
#=========================================================================
# Generator : /home/users/krzanich/mflowgen/mflowgen/backends/make_backend.py

SHELL=/usr/bin/env bash -euo pipefail

# $1 -- $dst
# $2 -- $src
# $3 -- $stamp

define cpdir
	rm -rf ./$1
	cp -aL $2 $1 || true
	chmod -R +w $1
	touch $3
endef

# $1 -- $dst
# $2 -- $src
# $3 -- $stamp

define cpdir-and-parameterize
	rm -rf ./$1
	cp -aL $2 $1 || true
	chmod -R +w $1
	cp .mflowgen/$1/configure.yml $1
	touch $3
endef

# $1 -- $dst
# $2 -- $src
# $3 -- $stamp

define mkdir-and-symlink
	rm -rf ./$1
	mkdir -p $1
	cd $1 && ln -sf ../$2/* . && cd ..
	rm $1/configure.yml && cp .mflowgen/$1/configure.yml $1
	touch $3
endef

# $1 -- $dst_dir
# $2 -- $dst
# $3 -- $src
# $4 -- $stamp

define symlink
	mkdir -p $1
	cd $1 && ln -sf $3 $2 && touch $4
endef

# $1 -- $stamp

define stamp
	touch $1
endef

# Default

default: constraints info rtl skywater-130nm testbench rtl-sim gen-saif-rtl synopsys-dc-synthesis cadence-innovus-flowsetup cadence-innovus-init cadence-innovus-power cadence-innovus-place cadence-innovus-cts cadence-innovus-postcts_hold cadence-innovus-route cadence-innovus-postroute cadence-innovus-signoff mentor-calibre-gdsmerge open-magic-def2spice synopsys-pt-timing-signoff synopsys-ptpx-rtl gl-sim open-magic-drc open-netgen-lvs gen-saif-gl synopsys-ptpx-gl

# ------------------------------------------------------------------------
# constraints
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 0-constraints/.prebuilt)","")
0-constraints/.stamp:
	$(call cpdir-and-parameterize,0-constraints,../design/constraints,0-constraints/.stamp)
endif

# collect inputs

# execute

ifeq ("$(wildcard 0-constraints/.prebuilt)","")

define 0_constraints_commands_rule
	mkdir -p 0-constraints/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t constraints && chmod +x .mflowgen/0-constraints/mflowgen-run && cp -f .mflowgen/0-constraints/mflowgen-run 0-constraints && if [[ -e .mflowgen/0-constraints/mflowgen-debug ]]; then chmod +x .mflowgen/0-constraints/mflowgen-debug && cp -f .mflowgen/0-constraints/mflowgen-debug 0-constraints; fi && if [[ -e .mflowgen/0-constraints/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/0-constraints/mflowgen-check-preconditions.py && cp -f .mflowgen/0-constraints/mflowgen-check-preconditions.py 0-constraints; fi && if [[ -e .mflowgen/0-constraints/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/0-constraints/mflowgen-check-postconditions.py && cp -f .mflowgen/0-constraints/mflowgen-check-postconditions.py 0-constraints; fi && cd 0-constraints && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 0-constraints/outputs/*
endef

0-constraints/.execstamp: 0-constraints/.stamp
	$(call 0_constraints_commands_rule)
	touch $@

0-constraints/outputs/.execstamp.constraints.tcl: 0-constraints/.execstamp
	touch $@

endif

# collect outputs

0-constraints/outputs/.stamp.constraints.tcl: 0-constraints/.execstamp 0-constraints/outputs/.execstamp.constraints.tcl
	$(call stamp,0-constraints/outputs/.stamp.constraints.tcl)

# post-conditions

define 0_constraints_post_conditions_commands_rule
	cd 0-constraints && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

0-constraints/.postconditions.stamp: 0-constraints/.execstamp 0-constraints/outputs/.execstamp.constraints.tcl 0-constraints/outputs/.stamp.constraints.tcl
	$(call 0_constraints_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: constraints

constraints: 0-constraints/.execstamp 0-constraints/.postconditions.stamp 0-constraints/outputs/.execstamp.constraints.tcl 0-constraints/outputs/.stamp.constraints.tcl

.PHONY: 0

0: 0-constraints/.execstamp 0-constraints/.postconditions.stamp 0-constraints/outputs/.execstamp.constraints.tcl 0-constraints/outputs/.stamp.constraints.tcl

# debug

# ------------------------------------------------------------------------
# info
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 1-info/.prebuilt)","")
1-info/.stamp:
	$(call cpdir-and-parameterize,1-info,../../mflowgen/steps/info,1-info/.stamp)
endif

# collect inputs

# execute

ifeq ("$(wildcard 1-info/.prebuilt)","")

define 1_info_commands_rule
	mkdir -p 1-info/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t info && chmod +x .mflowgen/1-info/mflowgen-run && cp -f .mflowgen/1-info/mflowgen-run 1-info && if [[ -e .mflowgen/1-info/mflowgen-debug ]]; then chmod +x .mflowgen/1-info/mflowgen-debug && cp -f .mflowgen/1-info/mflowgen-debug 1-info; fi && if [[ -e .mflowgen/1-info/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/1-info/mflowgen-check-preconditions.py && cp -f .mflowgen/1-info/mflowgen-check-preconditions.py 1-info; fi && if [[ -e .mflowgen/1-info/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/1-info/mflowgen-check-postconditions.py && cp -f .mflowgen/1-info/mflowgen-check-postconditions.py 1-info; fi && cd 1-info && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 1-info/outputs/*
endef

1-info/.execstamp: 1-info/.stamp
	$(call 1_info_commands_rule)

1-info/.execstamp.execute-phony: 1-info/.execstamp
	touch $@

endif

# collect outputs

# post-conditions

define 1_info_post_conditions_commands_rule
	cd 1-info && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

1-info/.postconditions.stamp: 1-info/.execstamp 1-info/.execstamp.execute-phony
	$(call 1_info_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: info

info: 1-info/.execstamp 1-info/.execstamp.execute-phony 1-info/.postconditions.stamp

.PHONY: 1

1: 1-info/.execstamp 1-info/.execstamp.execute-phony 1-info/.postconditions.stamp

# debug

# ------------------------------------------------------------------------
# rtl
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 2-rtl/.prebuilt)","")
2-rtl/.stamp:
	$(call cpdir-and-parameterize,2-rtl,../design/rtl,2-rtl/.stamp)
endif

# collect inputs

# execute

ifeq ("$(wildcard 2-rtl/.prebuilt)","")

define 2_rtl_commands_rule
	mkdir -p 2-rtl/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t rtl && chmod +x .mflowgen/2-rtl/mflowgen-run && cp -f .mflowgen/2-rtl/mflowgen-run 2-rtl && if [[ -e .mflowgen/2-rtl/mflowgen-debug ]]; then chmod +x .mflowgen/2-rtl/mflowgen-debug && cp -f .mflowgen/2-rtl/mflowgen-debug 2-rtl; fi && if [[ -e .mflowgen/2-rtl/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/2-rtl/mflowgen-check-preconditions.py && cp -f .mflowgen/2-rtl/mflowgen-check-preconditions.py 2-rtl; fi && if [[ -e .mflowgen/2-rtl/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/2-rtl/mflowgen-check-postconditions.py && cp -f .mflowgen/2-rtl/mflowgen-check-postconditions.py 2-rtl; fi && cd 2-rtl && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 2-rtl/outputs/*
endef

2-rtl/.execstamp: 2-rtl/.stamp
	$(call 2_rtl_commands_rule)
	touch $@

2-rtl/outputs/.execstamp.design.v: 2-rtl/.execstamp
	touch $@

endif

# collect outputs

2-rtl/outputs/.stamp.design.v: 2-rtl/.execstamp 2-rtl/outputs/.execstamp.design.v
	$(call stamp,2-rtl/outputs/.stamp.design.v)

# post-conditions

define 2_rtl_post_conditions_commands_rule
	cd 2-rtl && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

2-rtl/.postconditions.stamp: 2-rtl/.execstamp 2-rtl/outputs/.execstamp.design.v 2-rtl/outputs/.stamp.design.v
	$(call 2_rtl_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: rtl

rtl: 2-rtl/.execstamp 2-rtl/.postconditions.stamp 2-rtl/outputs/.execstamp.design.v 2-rtl/outputs/.stamp.design.v

.PHONY: 2

2: 2-rtl/.execstamp 2-rtl/.postconditions.stamp 2-rtl/outputs/.execstamp.design.v 2-rtl/outputs/.stamp.design.v

# debug

# ------------------------------------------------------------------------
# skywater-130nm
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 3-skywater-130nm/.prebuilt)","")
3-skywater-130nm/.stamp:
	$(call cpdir-and-parameterize,3-skywater-130nm,../../../../../afs/ir.stanford.edu/class/ee272/skywater-130nm-adk,3-skywater-130nm/.stamp)
endif

# collect inputs

# execute

ifeq ("$(wildcard 3-skywater-130nm/.prebuilt)","")

define 3_skywater_130nm_commands_rule
	mkdir -p 3-skywater-130nm/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t skywater-130nm && chmod +x .mflowgen/3-skywater-130nm/mflowgen-run && cp -f .mflowgen/3-skywater-130nm/mflowgen-run 3-skywater-130nm && if [[ -e .mflowgen/3-skywater-130nm/mflowgen-debug ]]; then chmod +x .mflowgen/3-skywater-130nm/mflowgen-debug && cp -f .mflowgen/3-skywater-130nm/mflowgen-debug 3-skywater-130nm; fi && if [[ -e .mflowgen/3-skywater-130nm/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/3-skywater-130nm/mflowgen-check-preconditions.py && cp -f .mflowgen/3-skywater-130nm/mflowgen-check-preconditions.py 3-skywater-130nm; fi && if [[ -e .mflowgen/3-skywater-130nm/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/3-skywater-130nm/mflowgen-check-postconditions.py && cp -f .mflowgen/3-skywater-130nm/mflowgen-check-postconditions.py 3-skywater-130nm; fi && cd 3-skywater-130nm && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 3-skywater-130nm/outputs/*
endef

3-skywater-130nm/.execstamp: 3-skywater-130nm/.stamp
	$(call 3_skywater_130nm_commands_rule)
	touch $@

3-skywater-130nm/outputs/.execstamp.adk: 3-skywater-130nm/.execstamp
	touch $@

endif

# collect outputs

3-skywater-130nm/outputs/.stamp.adk: 3-skywater-130nm/.execstamp 3-skywater-130nm/outputs/.execstamp.adk
	$(call stamp,3-skywater-130nm/outputs/.stamp.adk)

# post-conditions

define 3_skywater_130nm_post_conditions_commands_rule
	cd 3-skywater-130nm && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

3-skywater-130nm/.postconditions.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
	$(call 3_skywater_130nm_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: skywater-130nm

skywater-130nm: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk

.PHONY: 3

3: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk

# debug

# ------------------------------------------------------------------------
# testbench
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 4-testbench/.prebuilt)","")
4-testbench/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
4-testbench/.stamp:
	$(call cpdir-and-parameterize,4-testbench,../design/testbench,4-testbench/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 4-testbench/.prebuilt)","")
4-testbench/inputs/.stamp.adk: 4-testbench/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,4-testbench/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

# execute

ifeq ("$(wildcard 4-testbench/.prebuilt)","")

define 4_testbench_commands_rule
	mkdir -p 4-testbench/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t testbench && chmod +x .mflowgen/4-testbench/mflowgen-run && cp -f .mflowgen/4-testbench/mflowgen-run 4-testbench && if [[ -e .mflowgen/4-testbench/mflowgen-debug ]]; then chmod +x .mflowgen/4-testbench/mflowgen-debug && cp -f .mflowgen/4-testbench/mflowgen-debug 4-testbench; fi && if [[ -e .mflowgen/4-testbench/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/4-testbench/mflowgen-check-preconditions.py && cp -f .mflowgen/4-testbench/mflowgen-check-preconditions.py 4-testbench; fi && if [[ -e .mflowgen/4-testbench/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/4-testbench/mflowgen-check-postconditions.py && cp -f .mflowgen/4-testbench/mflowgen-check-postconditions.py 4-testbench; fi && cd 4-testbench && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 4-testbench/outputs/*
endef

4-testbench/.execstamp: 4-testbench/.stamp 4-testbench/inputs/.stamp.adk
	$(call 4_testbench_commands_rule)
	touch $@

4-testbench/outputs/.execstamp.testbench.sv: 4-testbench/.execstamp
	touch $@
4-testbench/outputs/.execstamp.test_vectors.txt: 4-testbench/.execstamp
	touch $@
4-testbench/outputs/.execstamp.design.args: 4-testbench/.execstamp
	touch $@
4-testbench/outputs/.execstamp.design.args.gls: 4-testbench/.execstamp
	touch $@

endif

# collect outputs

4-testbench/outputs/.stamp.testbench.sv: 4-testbench/.execstamp 4-testbench/outputs/.execstamp.design.args 4-testbench/outputs/.execstamp.design.args.gls 4-testbench/outputs/.execstamp.test_vectors.txt 4-testbench/outputs/.execstamp.testbench.sv
	$(call stamp,4-testbench/outputs/.stamp.testbench.sv)

4-testbench/outputs/.stamp.test_vectors.txt: 4-testbench/.execstamp 4-testbench/outputs/.execstamp.design.args 4-testbench/outputs/.execstamp.design.args.gls 4-testbench/outputs/.execstamp.test_vectors.txt 4-testbench/outputs/.execstamp.testbench.sv
	$(call stamp,4-testbench/outputs/.stamp.test_vectors.txt)

4-testbench/outputs/.stamp.design.args: 4-testbench/.execstamp 4-testbench/outputs/.execstamp.design.args 4-testbench/outputs/.execstamp.design.args.gls 4-testbench/outputs/.execstamp.test_vectors.txt 4-testbench/outputs/.execstamp.testbench.sv
	$(call stamp,4-testbench/outputs/.stamp.design.args)

4-testbench/outputs/.stamp.design.args.gls: 4-testbench/.execstamp 4-testbench/outputs/.execstamp.design.args 4-testbench/outputs/.execstamp.design.args.gls 4-testbench/outputs/.execstamp.test_vectors.txt 4-testbench/outputs/.execstamp.testbench.sv
	$(call stamp,4-testbench/outputs/.stamp.design.args.gls)

# post-conditions

define 4_testbench_post_conditions_commands_rule
	cd 4-testbench && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

4-testbench/.postconditions.stamp: 4-testbench/.execstamp 4-testbench/outputs/.execstamp.design.args 4-testbench/outputs/.execstamp.design.args.gls 4-testbench/outputs/.execstamp.test_vectors.txt 4-testbench/outputs/.execstamp.testbench.sv 4-testbench/outputs/.stamp.design.args 4-testbench/outputs/.stamp.design.args.gls 4-testbench/outputs/.stamp.test_vectors.txt 4-testbench/outputs/.stamp.testbench.sv
	$(call 4_testbench_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: testbench

testbench: 4-testbench/.execstamp 4-testbench/.postconditions.stamp 4-testbench/outputs/.execstamp.design.args 4-testbench/outputs/.execstamp.design.args.gls 4-testbench/outputs/.execstamp.test_vectors.txt 4-testbench/outputs/.execstamp.testbench.sv 4-testbench/outputs/.stamp.design.args 4-testbench/outputs/.stamp.design.args.gls 4-testbench/outputs/.stamp.test_vectors.txt 4-testbench/outputs/.stamp.testbench.sv

.PHONY: 4

4: 4-testbench/.execstamp 4-testbench/.postconditions.stamp 4-testbench/outputs/.execstamp.design.args 4-testbench/outputs/.execstamp.design.args.gls 4-testbench/outputs/.execstamp.test_vectors.txt 4-testbench/outputs/.execstamp.testbench.sv 4-testbench/outputs/.stamp.design.args 4-testbench/outputs/.stamp.design.args.gls 4-testbench/outputs/.stamp.test_vectors.txt 4-testbench/outputs/.stamp.testbench.sv

# debug

# ------------------------------------------------------------------------
# rtl-sim
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 5-rtl-sim/.prebuilt)","")
5-rtl-sim/.stamp: 2-rtl/.execstamp 2-rtl/.postconditions.stamp 2-rtl/outputs/.execstamp.design.v 2-rtl/outputs/.stamp.design.v
5-rtl-sim/.stamp: 4-testbench/.execstamp 4-testbench/.postconditions.stamp 4-testbench/outputs/.execstamp.design.args 4-testbench/outputs/.execstamp.design.args.gls 4-testbench/outputs/.execstamp.test_vectors.txt 4-testbench/outputs/.execstamp.testbench.sv 4-testbench/outputs/.stamp.design.args 4-testbench/outputs/.stamp.design.args.gls 4-testbench/outputs/.stamp.test_vectors.txt 4-testbench/outputs/.stamp.testbench.sv
5-rtl-sim/.stamp:
	$(call cpdir-and-parameterize,5-rtl-sim,../design/synopsys-vcs-sim,5-rtl-sim/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 5-rtl-sim/.prebuilt)","")
5-rtl-sim/inputs/.stamp.design.args: 5-rtl-sim/.stamp 4-testbench/outputs/.stamp.design.args
	$(call symlink,5-rtl-sim/inputs,design.args,../../4-testbench/outputs/design.args,.stamp.design.args)
endif

ifeq ("$(wildcard 5-rtl-sim/.prebuilt)","")
5-rtl-sim/inputs/.stamp.design.v: 5-rtl-sim/.stamp 2-rtl/outputs/.stamp.design.v
	$(call symlink,5-rtl-sim/inputs,design.v,../../2-rtl/outputs/design.v,.stamp.design.v)
endif

ifeq ("$(wildcard 5-rtl-sim/.prebuilt)","")
5-rtl-sim/inputs/.stamp.test_vectors.txt: 5-rtl-sim/.stamp 4-testbench/outputs/.stamp.test_vectors.txt
	$(call symlink,5-rtl-sim/inputs,test_vectors.txt,../../4-testbench/outputs/test_vectors.txt,.stamp.test_vectors.txt)
endif

ifeq ("$(wildcard 5-rtl-sim/.prebuilt)","")
5-rtl-sim/inputs/.stamp.testbench.sv: 5-rtl-sim/.stamp 4-testbench/outputs/.stamp.testbench.sv
	$(call symlink,5-rtl-sim/inputs,testbench.sv,../../4-testbench/outputs/testbench.sv,.stamp.testbench.sv)
endif

# execute

ifeq ("$(wildcard 5-rtl-sim/.prebuilt)","")

define 5_rtl_sim_commands_rule
	mkdir -p 5-rtl-sim/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t rtl-sim && chmod +x .mflowgen/5-rtl-sim/mflowgen-run && cp -f .mflowgen/5-rtl-sim/mflowgen-run 5-rtl-sim && if [[ -e .mflowgen/5-rtl-sim/mflowgen-debug ]]; then chmod +x .mflowgen/5-rtl-sim/mflowgen-debug && cp -f .mflowgen/5-rtl-sim/mflowgen-debug 5-rtl-sim; fi && if [[ -e .mflowgen/5-rtl-sim/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/5-rtl-sim/mflowgen-check-preconditions.py && cp -f .mflowgen/5-rtl-sim/mflowgen-check-preconditions.py 5-rtl-sim; fi && if [[ -e .mflowgen/5-rtl-sim/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/5-rtl-sim/mflowgen-check-postconditions.py && cp -f .mflowgen/5-rtl-sim/mflowgen-check-postconditions.py 5-rtl-sim; fi && cd 5-rtl-sim && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 5-rtl-sim/outputs/*
endef

5-rtl-sim/.execstamp: 5-rtl-sim/.stamp 5-rtl-sim/inputs/.stamp.design.args 5-rtl-sim/inputs/.stamp.design.v 5-rtl-sim/inputs/.stamp.test_vectors.txt 5-rtl-sim/inputs/.stamp.testbench.sv
	$(call 5_rtl_sim_commands_rule)
	touch $@

5-rtl-sim/outputs/.execstamp.design.vpd: 5-rtl-sim/.execstamp
	touch $@

endif

# collect outputs

5-rtl-sim/outputs/.stamp.design.vpd: 5-rtl-sim/.execstamp 5-rtl-sim/outputs/.execstamp.design.vpd
	$(call stamp,5-rtl-sim/outputs/.stamp.design.vpd)

# post-conditions

define 5_rtl_sim_post_conditions_commands_rule
	cd 5-rtl-sim && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

5-rtl-sim/.postconditions.stamp: 5-rtl-sim/.execstamp 5-rtl-sim/outputs/.execstamp.design.vpd 5-rtl-sim/outputs/.stamp.design.vpd
	$(call 5_rtl_sim_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: rtl-sim

rtl-sim: 5-rtl-sim/.execstamp 5-rtl-sim/.postconditions.stamp 5-rtl-sim/outputs/.execstamp.design.vpd 5-rtl-sim/outputs/.stamp.design.vpd

.PHONY: 5

5: 5-rtl-sim/.execstamp 5-rtl-sim/.postconditions.stamp 5-rtl-sim/outputs/.execstamp.design.vpd 5-rtl-sim/outputs/.stamp.design.vpd

# debug

# ------------------------------------------------------------------------
# gen-saif-rtl
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 6-gen-saif-rtl/.prebuilt)","")
6-gen-saif-rtl/.stamp: 5-rtl-sim/.execstamp 5-rtl-sim/.postconditions.stamp 5-rtl-sim/outputs/.execstamp.design.vpd 5-rtl-sim/outputs/.stamp.design.vpd
6-gen-saif-rtl/.stamp:
	$(call cpdir-and-parameterize,6-gen-saif-rtl,../../mflowgen/steps/synopsys-vcd2saif-convert,6-gen-saif-rtl/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 6-gen-saif-rtl/.prebuilt)","")
6-gen-saif-rtl/inputs/.stamp.run.vcd: 6-gen-saif-rtl/.stamp 5-rtl-sim/outputs/.stamp.design.vpd
	$(call symlink,6-gen-saif-rtl/inputs,run.vcd,../../5-rtl-sim/outputs/design.vpd,.stamp.run.vcd)
endif

# execute

ifeq ("$(wildcard 6-gen-saif-rtl/.prebuilt)","")

define 6_gen_saif_rtl_commands_rule
	mkdir -p 6-gen-saif-rtl/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t gen-saif-rtl && chmod +x .mflowgen/6-gen-saif-rtl/mflowgen-run && cp -f .mflowgen/6-gen-saif-rtl/mflowgen-run 6-gen-saif-rtl && if [[ -e .mflowgen/6-gen-saif-rtl/mflowgen-debug ]]; then chmod +x .mflowgen/6-gen-saif-rtl/mflowgen-debug && cp -f .mflowgen/6-gen-saif-rtl/mflowgen-debug 6-gen-saif-rtl; fi && if [[ -e .mflowgen/6-gen-saif-rtl/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/6-gen-saif-rtl/mflowgen-check-preconditions.py && cp -f .mflowgen/6-gen-saif-rtl/mflowgen-check-preconditions.py 6-gen-saif-rtl; fi && if [[ -e .mflowgen/6-gen-saif-rtl/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/6-gen-saif-rtl/mflowgen-check-postconditions.py && cp -f .mflowgen/6-gen-saif-rtl/mflowgen-check-postconditions.py 6-gen-saif-rtl; fi && cd 6-gen-saif-rtl && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 6-gen-saif-rtl/outputs/*
endef

6-gen-saif-rtl/.execstamp: 6-gen-saif-rtl/.stamp 6-gen-saif-rtl/inputs/.stamp.run.vcd
	$(call 6_gen_saif_rtl_commands_rule)
	touch $@

6-gen-saif-rtl/outputs/.execstamp.run.saif: 6-gen-saif-rtl/.execstamp
	touch $@

endif

# collect outputs

6-gen-saif-rtl/outputs/.stamp.run.saif: 6-gen-saif-rtl/.execstamp 6-gen-saif-rtl/outputs/.execstamp.run.saif
	$(call stamp,6-gen-saif-rtl/outputs/.stamp.run.saif)

# post-conditions

define 6_gen_saif_rtl_post_conditions_commands_rule
	cd 6-gen-saif-rtl && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

6-gen-saif-rtl/.postconditions.stamp: 6-gen-saif-rtl/.execstamp 6-gen-saif-rtl/outputs/.execstamp.run.saif 6-gen-saif-rtl/outputs/.stamp.run.saif
	$(call 6_gen_saif_rtl_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: gen-saif-rtl

gen-saif-rtl: 6-gen-saif-rtl/.execstamp 6-gen-saif-rtl/.postconditions.stamp 6-gen-saif-rtl/outputs/.execstamp.run.saif 6-gen-saif-rtl/outputs/.stamp.run.saif

.PHONY: 6

6: 6-gen-saif-rtl/.execstamp 6-gen-saif-rtl/.postconditions.stamp 6-gen-saif-rtl/outputs/.execstamp.run.saif 6-gen-saif-rtl/outputs/.stamp.run.saif

# debug

# ------------------------------------------------------------------------
# synopsys-dc-synthesis
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 7-synopsys-dc-synthesis/.prebuilt)","")
7-synopsys-dc-synthesis/.stamp: 0-constraints/.execstamp 0-constraints/.postconditions.stamp 0-constraints/outputs/.execstamp.constraints.tcl 0-constraints/outputs/.stamp.constraints.tcl
7-synopsys-dc-synthesis/.stamp: 2-rtl/.execstamp 2-rtl/.postconditions.stamp 2-rtl/outputs/.execstamp.design.v 2-rtl/outputs/.stamp.design.v
7-synopsys-dc-synthesis/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
7-synopsys-dc-synthesis/.stamp: 6-gen-saif-rtl/.execstamp 6-gen-saif-rtl/.postconditions.stamp 6-gen-saif-rtl/outputs/.execstamp.run.saif 6-gen-saif-rtl/outputs/.stamp.run.saif
7-synopsys-dc-synthesis/.stamp:
	$(call cpdir-and-parameterize,7-synopsys-dc-synthesis,../../mflowgen/steps/synopsys-dc-synthesis,7-synopsys-dc-synthesis/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 7-synopsys-dc-synthesis/.prebuilt)","")
7-synopsys-dc-synthesis/inputs/.stamp.adk: 7-synopsys-dc-synthesis/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,7-synopsys-dc-synthesis/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 7-synopsys-dc-synthesis/.prebuilt)","")
7-synopsys-dc-synthesis/inputs/.stamp.constraints.tcl: 7-synopsys-dc-synthesis/.stamp 0-constraints/outputs/.stamp.constraints.tcl
	$(call symlink,7-synopsys-dc-synthesis/inputs,constraints.tcl,../../0-constraints/outputs/constraints.tcl,.stamp.constraints.tcl)
endif

ifeq ("$(wildcard 7-synopsys-dc-synthesis/.prebuilt)","")
7-synopsys-dc-synthesis/inputs/.stamp.design.v: 7-synopsys-dc-synthesis/.stamp 2-rtl/outputs/.stamp.design.v
	$(call symlink,7-synopsys-dc-synthesis/inputs,design.v,../../2-rtl/outputs/design.v,.stamp.design.v)
endif

ifeq ("$(wildcard 7-synopsys-dc-synthesis/.prebuilt)","")
7-synopsys-dc-synthesis/inputs/.stamp.run.saif: 7-synopsys-dc-synthesis/.stamp 6-gen-saif-rtl/outputs/.stamp.run.saif
	$(call symlink,7-synopsys-dc-synthesis/inputs,run.saif,../../6-gen-saif-rtl/outputs/run.saif,.stamp.run.saif)
endif

# execute

ifeq ("$(wildcard 7-synopsys-dc-synthesis/.prebuilt)","")

define 7_synopsys_dc_synthesis_commands_rule
	mkdir -p 7-synopsys-dc-synthesis/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t synopsys-dc-synthesis && chmod +x .mflowgen/7-synopsys-dc-synthesis/mflowgen-run && cp -f .mflowgen/7-synopsys-dc-synthesis/mflowgen-run 7-synopsys-dc-synthesis && if [[ -e .mflowgen/7-synopsys-dc-synthesis/mflowgen-debug ]]; then chmod +x .mflowgen/7-synopsys-dc-synthesis/mflowgen-debug && cp -f .mflowgen/7-synopsys-dc-synthesis/mflowgen-debug 7-synopsys-dc-synthesis; fi && if [[ -e .mflowgen/7-synopsys-dc-synthesis/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/7-synopsys-dc-synthesis/mflowgen-check-preconditions.py && cp -f .mflowgen/7-synopsys-dc-synthesis/mflowgen-check-preconditions.py 7-synopsys-dc-synthesis; fi && if [[ -e .mflowgen/7-synopsys-dc-synthesis/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/7-synopsys-dc-synthesis/mflowgen-check-postconditions.py && cp -f .mflowgen/7-synopsys-dc-synthesis/mflowgen-check-postconditions.py 7-synopsys-dc-synthesis; fi && cd 7-synopsys-dc-synthesis && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 7-synopsys-dc-synthesis/outputs/*
endef

7-synopsys-dc-synthesis/.execstamp: 7-synopsys-dc-synthesis/.stamp 7-synopsys-dc-synthesis/inputs/.stamp.adk 7-synopsys-dc-synthesis/inputs/.stamp.constraints.tcl 7-synopsys-dc-synthesis/inputs/.stamp.design.v 7-synopsys-dc-synthesis/inputs/.stamp.run.saif
	$(call 7_synopsys_dc_synthesis_commands_rule)
	touch $@

7-synopsys-dc-synthesis/outputs/.execstamp.design.v: 7-synopsys-dc-synthesis/.execstamp
	touch $@
7-synopsys-dc-synthesis/outputs/.execstamp.design.sdc: 7-synopsys-dc-synthesis/.execstamp
	touch $@
7-synopsys-dc-synthesis/outputs/.execstamp.design.namemap: 7-synopsys-dc-synthesis/.execstamp
	touch $@
7-synopsys-dc-synthesis/outputs/.execstamp.design.svf: 7-synopsys-dc-synthesis/.execstamp
	touch $@

endif

# collect outputs

7-synopsys-dc-synthesis/outputs/.stamp.design.v: 7-synopsys-dc-synthesis/.execstamp 7-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 7-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 7-synopsys-dc-synthesis/outputs/.execstamp.design.svf 7-synopsys-dc-synthesis/outputs/.execstamp.design.v
	$(call stamp,7-synopsys-dc-synthesis/outputs/.stamp.design.v)

7-synopsys-dc-synthesis/outputs/.stamp.design.sdc: 7-synopsys-dc-synthesis/.execstamp 7-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 7-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 7-synopsys-dc-synthesis/outputs/.execstamp.design.svf 7-synopsys-dc-synthesis/outputs/.execstamp.design.v
	$(call stamp,7-synopsys-dc-synthesis/outputs/.stamp.design.sdc)

7-synopsys-dc-synthesis/outputs/.stamp.design.namemap: 7-synopsys-dc-synthesis/.execstamp 7-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 7-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 7-synopsys-dc-synthesis/outputs/.execstamp.design.svf 7-synopsys-dc-synthesis/outputs/.execstamp.design.v
	$(call stamp,7-synopsys-dc-synthesis/outputs/.stamp.design.namemap)

7-synopsys-dc-synthesis/outputs/.stamp.design.svf: 7-synopsys-dc-synthesis/.execstamp 7-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 7-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 7-synopsys-dc-synthesis/outputs/.execstamp.design.svf 7-synopsys-dc-synthesis/outputs/.execstamp.design.v
	$(call stamp,7-synopsys-dc-synthesis/outputs/.stamp.design.svf)

# post-conditions

define 7_synopsys_dc_synthesis_post_conditions_commands_rule
	cd 7-synopsys-dc-synthesis && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

7-synopsys-dc-synthesis/.postconditions.stamp: 7-synopsys-dc-synthesis/.execstamp 7-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 7-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 7-synopsys-dc-synthesis/outputs/.execstamp.design.svf 7-synopsys-dc-synthesis/outputs/.execstamp.design.v 7-synopsys-dc-synthesis/outputs/.stamp.design.namemap 7-synopsys-dc-synthesis/outputs/.stamp.design.sdc 7-synopsys-dc-synthesis/outputs/.stamp.design.svf 7-synopsys-dc-synthesis/outputs/.stamp.design.v
	$(call 7_synopsys_dc_synthesis_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: synopsys-dc-synthesis

synopsys-dc-synthesis: 7-synopsys-dc-synthesis/.execstamp 7-synopsys-dc-synthesis/.postconditions.stamp 7-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 7-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 7-synopsys-dc-synthesis/outputs/.execstamp.design.svf 7-synopsys-dc-synthesis/outputs/.execstamp.design.v 7-synopsys-dc-synthesis/outputs/.stamp.design.namemap 7-synopsys-dc-synthesis/outputs/.stamp.design.sdc 7-synopsys-dc-synthesis/outputs/.stamp.design.svf 7-synopsys-dc-synthesis/outputs/.stamp.design.v

.PHONY: 7

7: 7-synopsys-dc-synthesis/.execstamp 7-synopsys-dc-synthesis/.postconditions.stamp 7-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 7-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 7-synopsys-dc-synthesis/outputs/.execstamp.design.svf 7-synopsys-dc-synthesis/outputs/.execstamp.design.v 7-synopsys-dc-synthesis/outputs/.stamp.design.namemap 7-synopsys-dc-synthesis/outputs/.stamp.design.sdc 7-synopsys-dc-synthesis/outputs/.stamp.design.svf 7-synopsys-dc-synthesis/outputs/.stamp.design.v

# debug

define 7_debug_rule
	cd 7-synopsys-dc-synthesis && ./mflowgen-debug 2>&1 | tee mflowgen-debug.log
endef

debug-synopsys-dc-synthesis: 
	$(call 7_debug_rule)

.PHONY: debug-7

debug-7: debug-synopsys-dc-synthesis

# ------------------------------------------------------------------------
# cadence-innovus-flowsetup
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 8-cadence-innovus-flowsetup/.prebuilt)","")
8-cadence-innovus-flowsetup/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
8-cadence-innovus-flowsetup/.stamp: 7-synopsys-dc-synthesis/.execstamp 7-synopsys-dc-synthesis/.postconditions.stamp 7-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 7-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 7-synopsys-dc-synthesis/outputs/.execstamp.design.svf 7-synopsys-dc-synthesis/outputs/.execstamp.design.v 7-synopsys-dc-synthesis/outputs/.stamp.design.namemap 7-synopsys-dc-synthesis/outputs/.stamp.design.sdc 7-synopsys-dc-synthesis/outputs/.stamp.design.svf 7-synopsys-dc-synthesis/outputs/.stamp.design.v
8-cadence-innovus-flowsetup/.stamp:
	$(call cpdir-and-parameterize,8-cadence-innovus-flowsetup,../../mflowgen/steps/cadence-innovus-flowsetup,8-cadence-innovus-flowsetup/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 8-cadence-innovus-flowsetup/.prebuilt)","")
8-cadence-innovus-flowsetup/inputs/.stamp.adk: 8-cadence-innovus-flowsetup/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,8-cadence-innovus-flowsetup/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 8-cadence-innovus-flowsetup/.prebuilt)","")
8-cadence-innovus-flowsetup/inputs/.stamp.design.sdc: 8-cadence-innovus-flowsetup/.stamp 7-synopsys-dc-synthesis/outputs/.stamp.design.sdc
	$(call symlink,8-cadence-innovus-flowsetup/inputs,design.sdc,../../7-synopsys-dc-synthesis/outputs/design.sdc,.stamp.design.sdc)
endif

ifeq ("$(wildcard 8-cadence-innovus-flowsetup/.prebuilt)","")
8-cadence-innovus-flowsetup/inputs/.stamp.design.v: 8-cadence-innovus-flowsetup/.stamp 7-synopsys-dc-synthesis/outputs/.stamp.design.v
	$(call symlink,8-cadence-innovus-flowsetup/inputs,design.v,../../7-synopsys-dc-synthesis/outputs/design.v,.stamp.design.v)
endif

# execute

ifeq ("$(wildcard 8-cadence-innovus-flowsetup/.prebuilt)","")

define 8_cadence_innovus_flowsetup_commands_rule
	mkdir -p 8-cadence-innovus-flowsetup/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-flowsetup && chmod +x .mflowgen/8-cadence-innovus-flowsetup/mflowgen-run && cp -f .mflowgen/8-cadence-innovus-flowsetup/mflowgen-run 8-cadence-innovus-flowsetup && if [[ -e .mflowgen/8-cadence-innovus-flowsetup/mflowgen-debug ]]; then chmod +x .mflowgen/8-cadence-innovus-flowsetup/mflowgen-debug && cp -f .mflowgen/8-cadence-innovus-flowsetup/mflowgen-debug 8-cadence-innovus-flowsetup; fi && if [[ -e .mflowgen/8-cadence-innovus-flowsetup/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/8-cadence-innovus-flowsetup/mflowgen-check-preconditions.py && cp -f .mflowgen/8-cadence-innovus-flowsetup/mflowgen-check-preconditions.py 8-cadence-innovus-flowsetup; fi && if [[ -e .mflowgen/8-cadence-innovus-flowsetup/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/8-cadence-innovus-flowsetup/mflowgen-check-postconditions.py && cp -f .mflowgen/8-cadence-innovus-flowsetup/mflowgen-check-postconditions.py 8-cadence-innovus-flowsetup; fi && cd 8-cadence-innovus-flowsetup && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 8-cadence-innovus-flowsetup/outputs/*
endef

8-cadence-innovus-flowsetup/.execstamp: 8-cadence-innovus-flowsetup/.stamp 8-cadence-innovus-flowsetup/inputs/.stamp.adk 8-cadence-innovus-flowsetup/inputs/.stamp.design.sdc 8-cadence-innovus-flowsetup/inputs/.stamp.design.v
	$(call 8_cadence_innovus_flowsetup_commands_rule)
	touch $@

8-cadence-innovus-flowsetup/outputs/.execstamp.innovus-foundation-flow: 8-cadence-innovus-flowsetup/.execstamp
	touch $@

endif

# collect outputs

8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow: 8-cadence-innovus-flowsetup/.execstamp 8-cadence-innovus-flowsetup/outputs/.execstamp.innovus-foundation-flow
	$(call stamp,8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow)

# post-conditions

define 8_cadence_innovus_flowsetup_post_conditions_commands_rule
	cd 8-cadence-innovus-flowsetup && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

8-cadence-innovus-flowsetup/.postconditions.stamp: 8-cadence-innovus-flowsetup/.execstamp 8-cadence-innovus-flowsetup/outputs/.execstamp.innovus-foundation-flow 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow
	$(call 8_cadence_innovus_flowsetup_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: cadence-innovus-flowsetup

cadence-innovus-flowsetup: 8-cadence-innovus-flowsetup/.execstamp 8-cadence-innovus-flowsetup/.postconditions.stamp 8-cadence-innovus-flowsetup/outputs/.execstamp.innovus-foundation-flow 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow

.PHONY: 8

8: 8-cadence-innovus-flowsetup/.execstamp 8-cadence-innovus-flowsetup/.postconditions.stamp 8-cadence-innovus-flowsetup/outputs/.execstamp.innovus-foundation-flow 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow

# debug

# ------------------------------------------------------------------------
# cadence-innovus-init
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 9-cadence-innovus-init/.prebuilt)","")
9-cadence-innovus-init/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
9-cadence-innovus-init/.stamp: 7-synopsys-dc-synthesis/.execstamp 7-synopsys-dc-synthesis/.postconditions.stamp 7-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 7-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 7-synopsys-dc-synthesis/outputs/.execstamp.design.svf 7-synopsys-dc-synthesis/outputs/.execstamp.design.v 7-synopsys-dc-synthesis/outputs/.stamp.design.namemap 7-synopsys-dc-synthesis/outputs/.stamp.design.sdc 7-synopsys-dc-synthesis/outputs/.stamp.design.svf 7-synopsys-dc-synthesis/outputs/.stamp.design.v
9-cadence-innovus-init/.stamp: 8-cadence-innovus-flowsetup/.execstamp 8-cadence-innovus-flowsetup/.postconditions.stamp 8-cadence-innovus-flowsetup/outputs/.execstamp.innovus-foundation-flow 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow
9-cadence-innovus-init/.stamp:
	$(call cpdir-and-parameterize,9-cadence-innovus-init,../../mflowgen/steps/cadence-innovus-init,9-cadence-innovus-init/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 9-cadence-innovus-init/.prebuilt)","")
9-cadence-innovus-init/inputs/.stamp.adk: 9-cadence-innovus-init/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,9-cadence-innovus-init/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 9-cadence-innovus-init/.prebuilt)","")
9-cadence-innovus-init/inputs/.stamp.design.sdc: 9-cadence-innovus-init/.stamp 7-synopsys-dc-synthesis/outputs/.stamp.design.sdc
	$(call symlink,9-cadence-innovus-init/inputs,design.sdc,../../7-synopsys-dc-synthesis/outputs/design.sdc,.stamp.design.sdc)
endif

ifeq ("$(wildcard 9-cadence-innovus-init/.prebuilt)","")
9-cadence-innovus-init/inputs/.stamp.design.v: 9-cadence-innovus-init/.stamp 7-synopsys-dc-synthesis/outputs/.stamp.design.v
	$(call symlink,9-cadence-innovus-init/inputs,design.v,../../7-synopsys-dc-synthesis/outputs/design.v,.stamp.design.v)
endif

ifeq ("$(wildcard 9-cadence-innovus-init/.prebuilt)","")
9-cadence-innovus-init/inputs/.stamp.innovus-foundation-flow: 9-cadence-innovus-init/.stamp 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow
	$(call symlink,9-cadence-innovus-init/inputs,innovus-foundation-flow,../../8-cadence-innovus-flowsetup/outputs/innovus-foundation-flow,.stamp.innovus-foundation-flow)
endif

# execute

ifeq ("$(wildcard 9-cadence-innovus-init/.prebuilt)","")

define 9_cadence_innovus_init_commands_rule
	mkdir -p 9-cadence-innovus-init/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-init && chmod +x .mflowgen/9-cadence-innovus-init/mflowgen-run && cp -f .mflowgen/9-cadence-innovus-init/mflowgen-run 9-cadence-innovus-init && if [[ -e .mflowgen/9-cadence-innovus-init/mflowgen-debug ]]; then chmod +x .mflowgen/9-cadence-innovus-init/mflowgen-debug && cp -f .mflowgen/9-cadence-innovus-init/mflowgen-debug 9-cadence-innovus-init; fi && if [[ -e .mflowgen/9-cadence-innovus-init/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/9-cadence-innovus-init/mflowgen-check-preconditions.py && cp -f .mflowgen/9-cadence-innovus-init/mflowgen-check-preconditions.py 9-cadence-innovus-init; fi && if [[ -e .mflowgen/9-cadence-innovus-init/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/9-cadence-innovus-init/mflowgen-check-postconditions.py && cp -f .mflowgen/9-cadence-innovus-init/mflowgen-check-postconditions.py 9-cadence-innovus-init; fi && cd 9-cadence-innovus-init && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 9-cadence-innovus-init/outputs/*
endef

9-cadence-innovus-init/.execstamp: 9-cadence-innovus-init/.stamp 9-cadence-innovus-init/inputs/.stamp.adk 9-cadence-innovus-init/inputs/.stamp.design.sdc 9-cadence-innovus-init/inputs/.stamp.design.v 9-cadence-innovus-init/inputs/.stamp.innovus-foundation-flow
	$(call 9_cadence_innovus_init_commands_rule)
	touch $@

9-cadence-innovus-init/outputs/.execstamp.design.checkpoint: 9-cadence-innovus-init/.execstamp
	touch $@

endif

# collect outputs

9-cadence-innovus-init/outputs/.stamp.design.checkpoint: 9-cadence-innovus-init/.execstamp 9-cadence-innovus-init/outputs/.execstamp.design.checkpoint
	$(call stamp,9-cadence-innovus-init/outputs/.stamp.design.checkpoint)

# post-conditions

define 9_cadence_innovus_init_post_conditions_commands_rule
	cd 9-cadence-innovus-init && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

9-cadence-innovus-init/.postconditions.stamp: 9-cadence-innovus-init/.execstamp 9-cadence-innovus-init/outputs/.execstamp.design.checkpoint 9-cadence-innovus-init/outputs/.stamp.design.checkpoint
	$(call 9_cadence_innovus_init_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: cadence-innovus-init

cadence-innovus-init: 9-cadence-innovus-init/.execstamp 9-cadence-innovus-init/.postconditions.stamp 9-cadence-innovus-init/outputs/.execstamp.design.checkpoint 9-cadence-innovus-init/outputs/.stamp.design.checkpoint

.PHONY: 9

9: 9-cadence-innovus-init/.execstamp 9-cadence-innovus-init/.postconditions.stamp 9-cadence-innovus-init/outputs/.execstamp.design.checkpoint 9-cadence-innovus-init/outputs/.stamp.design.checkpoint

# debug

define 9_debug_rule
	cd 9-cadence-innovus-init && ./mflowgen-debug 2>&1 | tee mflowgen-debug.log
endef

debug-cadence-innovus-init: 
	$(call 9_debug_rule)

.PHONY: debug-9

debug-9: debug-cadence-innovus-init

# ------------------------------------------------------------------------
# cadence-innovus-power
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 10-cadence-innovus-power/.prebuilt)","")
10-cadence-innovus-power/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
10-cadence-innovus-power/.stamp: 7-synopsys-dc-synthesis/.execstamp 7-synopsys-dc-synthesis/.postconditions.stamp 7-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 7-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 7-synopsys-dc-synthesis/outputs/.execstamp.design.svf 7-synopsys-dc-synthesis/outputs/.execstamp.design.v 7-synopsys-dc-synthesis/outputs/.stamp.design.namemap 7-synopsys-dc-synthesis/outputs/.stamp.design.sdc 7-synopsys-dc-synthesis/outputs/.stamp.design.svf 7-synopsys-dc-synthesis/outputs/.stamp.design.v
10-cadence-innovus-power/.stamp: 8-cadence-innovus-flowsetup/.execstamp 8-cadence-innovus-flowsetup/.postconditions.stamp 8-cadence-innovus-flowsetup/outputs/.execstamp.innovus-foundation-flow 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow
10-cadence-innovus-power/.stamp: 9-cadence-innovus-init/.execstamp 9-cadence-innovus-init/.postconditions.stamp 9-cadence-innovus-init/outputs/.execstamp.design.checkpoint 9-cadence-innovus-init/outputs/.stamp.design.checkpoint
10-cadence-innovus-power/.stamp:
	$(call cpdir-and-parameterize,10-cadence-innovus-power,../design/cadence-innovus-power,10-cadence-innovus-power/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 10-cadence-innovus-power/.prebuilt)","")
10-cadence-innovus-power/inputs/.stamp.adk: 10-cadence-innovus-power/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,10-cadence-innovus-power/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 10-cadence-innovus-power/.prebuilt)","")
10-cadence-innovus-power/inputs/.stamp.design.checkpoint: 10-cadence-innovus-power/.stamp 9-cadence-innovus-init/outputs/.stamp.design.checkpoint
	$(call symlink,10-cadence-innovus-power/inputs,design.checkpoint,../../9-cadence-innovus-init/outputs/design.checkpoint,.stamp.design.checkpoint)
endif

ifeq ("$(wildcard 10-cadence-innovus-power/.prebuilt)","")
10-cadence-innovus-power/inputs/.stamp.design.sdc: 10-cadence-innovus-power/.stamp 7-synopsys-dc-synthesis/outputs/.stamp.design.sdc
	$(call symlink,10-cadence-innovus-power/inputs,design.sdc,../../7-synopsys-dc-synthesis/outputs/design.sdc,.stamp.design.sdc)
endif

ifeq ("$(wildcard 10-cadence-innovus-power/.prebuilt)","")
10-cadence-innovus-power/inputs/.stamp.innovus-foundation-flow: 10-cadence-innovus-power/.stamp 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow
	$(call symlink,10-cadence-innovus-power/inputs,innovus-foundation-flow,../../8-cadence-innovus-flowsetup/outputs/innovus-foundation-flow,.stamp.innovus-foundation-flow)
endif

# execute

ifeq ("$(wildcard 10-cadence-innovus-power/.prebuilt)","")

define 10_cadence_innovus_power_commands_rule
	mkdir -p 10-cadence-innovus-power/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-power && chmod +x .mflowgen/10-cadence-innovus-power/mflowgen-run && cp -f .mflowgen/10-cadence-innovus-power/mflowgen-run 10-cadence-innovus-power && if [[ -e .mflowgen/10-cadence-innovus-power/mflowgen-debug ]]; then chmod +x .mflowgen/10-cadence-innovus-power/mflowgen-debug && cp -f .mflowgen/10-cadence-innovus-power/mflowgen-debug 10-cadence-innovus-power; fi && if [[ -e .mflowgen/10-cadence-innovus-power/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/10-cadence-innovus-power/mflowgen-check-preconditions.py && cp -f .mflowgen/10-cadence-innovus-power/mflowgen-check-preconditions.py 10-cadence-innovus-power; fi && if [[ -e .mflowgen/10-cadence-innovus-power/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/10-cadence-innovus-power/mflowgen-check-postconditions.py && cp -f .mflowgen/10-cadence-innovus-power/mflowgen-check-postconditions.py 10-cadence-innovus-power; fi && cd 10-cadence-innovus-power && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 10-cadence-innovus-power/outputs/*
endef

10-cadence-innovus-power/.execstamp: 10-cadence-innovus-power/.stamp 10-cadence-innovus-power/inputs/.stamp.adk 10-cadence-innovus-power/inputs/.stamp.design.checkpoint 10-cadence-innovus-power/inputs/.stamp.design.sdc 10-cadence-innovus-power/inputs/.stamp.innovus-foundation-flow
	$(call 10_cadence_innovus_power_commands_rule)
	touch $@

10-cadence-innovus-power/outputs/.execstamp.design.checkpoint: 10-cadence-innovus-power/.execstamp
	touch $@

endif

# collect outputs

10-cadence-innovus-power/outputs/.stamp.design.checkpoint: 10-cadence-innovus-power/.execstamp 10-cadence-innovus-power/outputs/.execstamp.design.checkpoint
	$(call stamp,10-cadence-innovus-power/outputs/.stamp.design.checkpoint)

# post-conditions

define 10_cadence_innovus_power_post_conditions_commands_rule
	cd 10-cadence-innovus-power && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

10-cadence-innovus-power/.postconditions.stamp: 10-cadence-innovus-power/.execstamp 10-cadence-innovus-power/outputs/.execstamp.design.checkpoint 10-cadence-innovus-power/outputs/.stamp.design.checkpoint
	$(call 10_cadence_innovus_power_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: cadence-innovus-power

cadence-innovus-power: 10-cadence-innovus-power/.execstamp 10-cadence-innovus-power/.postconditions.stamp 10-cadence-innovus-power/outputs/.execstamp.design.checkpoint 10-cadence-innovus-power/outputs/.stamp.design.checkpoint

.PHONY: 10

10: 10-cadence-innovus-power/.execstamp 10-cadence-innovus-power/.postconditions.stamp 10-cadence-innovus-power/outputs/.execstamp.design.checkpoint 10-cadence-innovus-power/outputs/.stamp.design.checkpoint

# debug

define 10_debug_rule
	cd 10-cadence-innovus-power && ./mflowgen-debug 2>&1 | tee mflowgen-debug.log
endef

debug-cadence-innovus-power: 
	$(call 10_debug_rule)

.PHONY: debug-10

debug-10: debug-cadence-innovus-power

# ------------------------------------------------------------------------
# cadence-innovus-place
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 11-cadence-innovus-place/.prebuilt)","")
11-cadence-innovus-place/.stamp: 10-cadence-innovus-power/.execstamp 10-cadence-innovus-power/.postconditions.stamp 10-cadence-innovus-power/outputs/.execstamp.design.checkpoint 10-cadence-innovus-power/outputs/.stamp.design.checkpoint
11-cadence-innovus-place/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
11-cadence-innovus-place/.stamp: 7-synopsys-dc-synthesis/.execstamp 7-synopsys-dc-synthesis/.postconditions.stamp 7-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 7-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 7-synopsys-dc-synthesis/outputs/.execstamp.design.svf 7-synopsys-dc-synthesis/outputs/.execstamp.design.v 7-synopsys-dc-synthesis/outputs/.stamp.design.namemap 7-synopsys-dc-synthesis/outputs/.stamp.design.sdc 7-synopsys-dc-synthesis/outputs/.stamp.design.svf 7-synopsys-dc-synthesis/outputs/.stamp.design.v
11-cadence-innovus-place/.stamp: 8-cadence-innovus-flowsetup/.execstamp 8-cadence-innovus-flowsetup/.postconditions.stamp 8-cadence-innovus-flowsetup/outputs/.execstamp.innovus-foundation-flow 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow
11-cadence-innovus-place/.stamp:
	$(call cpdir-and-parameterize,11-cadence-innovus-place,../../mflowgen/steps/cadence-innovus-place,11-cadence-innovus-place/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 11-cadence-innovus-place/.prebuilt)","")
11-cadence-innovus-place/inputs/.stamp.adk: 11-cadence-innovus-place/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,11-cadence-innovus-place/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 11-cadence-innovus-place/.prebuilt)","")
11-cadence-innovus-place/inputs/.stamp.design.checkpoint: 11-cadence-innovus-place/.stamp 10-cadence-innovus-power/outputs/.stamp.design.checkpoint
	$(call symlink,11-cadence-innovus-place/inputs,design.checkpoint,../../10-cadence-innovus-power/outputs/design.checkpoint,.stamp.design.checkpoint)
endif

ifeq ("$(wildcard 11-cadence-innovus-place/.prebuilt)","")
11-cadence-innovus-place/inputs/.stamp.design.sdc: 11-cadence-innovus-place/.stamp 7-synopsys-dc-synthesis/outputs/.stamp.design.sdc
	$(call symlink,11-cadence-innovus-place/inputs,design.sdc,../../7-synopsys-dc-synthesis/outputs/design.sdc,.stamp.design.sdc)
endif

ifeq ("$(wildcard 11-cadence-innovus-place/.prebuilt)","")
11-cadence-innovus-place/inputs/.stamp.innovus-foundation-flow: 11-cadence-innovus-place/.stamp 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow
	$(call symlink,11-cadence-innovus-place/inputs,innovus-foundation-flow,../../8-cadence-innovus-flowsetup/outputs/innovus-foundation-flow,.stamp.innovus-foundation-flow)
endif

# execute

ifeq ("$(wildcard 11-cadence-innovus-place/.prebuilt)","")

define 11_cadence_innovus_place_commands_rule
	mkdir -p 11-cadence-innovus-place/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-place && chmod +x .mflowgen/11-cadence-innovus-place/mflowgen-run && cp -f .mflowgen/11-cadence-innovus-place/mflowgen-run 11-cadence-innovus-place && if [[ -e .mflowgen/11-cadence-innovus-place/mflowgen-debug ]]; then chmod +x .mflowgen/11-cadence-innovus-place/mflowgen-debug && cp -f .mflowgen/11-cadence-innovus-place/mflowgen-debug 11-cadence-innovus-place; fi && if [[ -e .mflowgen/11-cadence-innovus-place/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/11-cadence-innovus-place/mflowgen-check-preconditions.py && cp -f .mflowgen/11-cadence-innovus-place/mflowgen-check-preconditions.py 11-cadence-innovus-place; fi && if [[ -e .mflowgen/11-cadence-innovus-place/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/11-cadence-innovus-place/mflowgen-check-postconditions.py && cp -f .mflowgen/11-cadence-innovus-place/mflowgen-check-postconditions.py 11-cadence-innovus-place; fi && cd 11-cadence-innovus-place && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 11-cadence-innovus-place/outputs/*
endef

11-cadence-innovus-place/.execstamp: 11-cadence-innovus-place/.stamp 11-cadence-innovus-place/inputs/.stamp.adk 11-cadence-innovus-place/inputs/.stamp.design.checkpoint 11-cadence-innovus-place/inputs/.stamp.design.sdc 11-cadence-innovus-place/inputs/.stamp.innovus-foundation-flow
	$(call 11_cadence_innovus_place_commands_rule)
	touch $@

11-cadence-innovus-place/outputs/.execstamp.design.checkpoint: 11-cadence-innovus-place/.execstamp
	touch $@

endif

# collect outputs

11-cadence-innovus-place/outputs/.stamp.design.checkpoint: 11-cadence-innovus-place/.execstamp 11-cadence-innovus-place/outputs/.execstamp.design.checkpoint
	$(call stamp,11-cadence-innovus-place/outputs/.stamp.design.checkpoint)

# post-conditions

define 11_cadence_innovus_place_post_conditions_commands_rule
	cd 11-cadence-innovus-place && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

11-cadence-innovus-place/.postconditions.stamp: 11-cadence-innovus-place/.execstamp 11-cadence-innovus-place/outputs/.execstamp.design.checkpoint 11-cadence-innovus-place/outputs/.stamp.design.checkpoint
	$(call 11_cadence_innovus_place_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: cadence-innovus-place

cadence-innovus-place: 11-cadence-innovus-place/.execstamp 11-cadence-innovus-place/.postconditions.stamp 11-cadence-innovus-place/outputs/.execstamp.design.checkpoint 11-cadence-innovus-place/outputs/.stamp.design.checkpoint

.PHONY: 11

11: 11-cadence-innovus-place/.execstamp 11-cadence-innovus-place/.postconditions.stamp 11-cadence-innovus-place/outputs/.execstamp.design.checkpoint 11-cadence-innovus-place/outputs/.stamp.design.checkpoint

# debug

define 11_debug_rule
	cd 11-cadence-innovus-place && ./mflowgen-debug 2>&1 | tee mflowgen-debug.log
endef

debug-cadence-innovus-place: 
	$(call 11_debug_rule)

.PHONY: debug-11

debug-11: debug-cadence-innovus-place

# ------------------------------------------------------------------------
# cadence-innovus-cts
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 12-cadence-innovus-cts/.prebuilt)","")
12-cadence-innovus-cts/.stamp: 11-cadence-innovus-place/.execstamp 11-cadence-innovus-place/.postconditions.stamp 11-cadence-innovus-place/outputs/.execstamp.design.checkpoint 11-cadence-innovus-place/outputs/.stamp.design.checkpoint
12-cadence-innovus-cts/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
12-cadence-innovus-cts/.stamp: 7-synopsys-dc-synthesis/.execstamp 7-synopsys-dc-synthesis/.postconditions.stamp 7-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 7-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 7-synopsys-dc-synthesis/outputs/.execstamp.design.svf 7-synopsys-dc-synthesis/outputs/.execstamp.design.v 7-synopsys-dc-synthesis/outputs/.stamp.design.namemap 7-synopsys-dc-synthesis/outputs/.stamp.design.sdc 7-synopsys-dc-synthesis/outputs/.stamp.design.svf 7-synopsys-dc-synthesis/outputs/.stamp.design.v
12-cadence-innovus-cts/.stamp: 8-cadence-innovus-flowsetup/.execstamp 8-cadence-innovus-flowsetup/.postconditions.stamp 8-cadence-innovus-flowsetup/outputs/.execstamp.innovus-foundation-flow 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow
12-cadence-innovus-cts/.stamp:
	$(call cpdir-and-parameterize,12-cadence-innovus-cts,../../mflowgen/steps/cadence-innovus-cts,12-cadence-innovus-cts/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 12-cadence-innovus-cts/.prebuilt)","")
12-cadence-innovus-cts/inputs/.stamp.adk: 12-cadence-innovus-cts/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,12-cadence-innovus-cts/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 12-cadence-innovus-cts/.prebuilt)","")
12-cadence-innovus-cts/inputs/.stamp.design.checkpoint: 12-cadence-innovus-cts/.stamp 11-cadence-innovus-place/outputs/.stamp.design.checkpoint
	$(call symlink,12-cadence-innovus-cts/inputs,design.checkpoint,../../11-cadence-innovus-place/outputs/design.checkpoint,.stamp.design.checkpoint)
endif

ifeq ("$(wildcard 12-cadence-innovus-cts/.prebuilt)","")
12-cadence-innovus-cts/inputs/.stamp.design.sdc: 12-cadence-innovus-cts/.stamp 7-synopsys-dc-synthesis/outputs/.stamp.design.sdc
	$(call symlink,12-cadence-innovus-cts/inputs,design.sdc,../../7-synopsys-dc-synthesis/outputs/design.sdc,.stamp.design.sdc)
endif

ifeq ("$(wildcard 12-cadence-innovus-cts/.prebuilt)","")
12-cadence-innovus-cts/inputs/.stamp.innovus-foundation-flow: 12-cadence-innovus-cts/.stamp 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow
	$(call symlink,12-cadence-innovus-cts/inputs,innovus-foundation-flow,../../8-cadence-innovus-flowsetup/outputs/innovus-foundation-flow,.stamp.innovus-foundation-flow)
endif

# execute

ifeq ("$(wildcard 12-cadence-innovus-cts/.prebuilt)","")

define 12_cadence_innovus_cts_commands_rule
	mkdir -p 12-cadence-innovus-cts/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-cts && chmod +x .mflowgen/12-cadence-innovus-cts/mflowgen-run && cp -f .mflowgen/12-cadence-innovus-cts/mflowgen-run 12-cadence-innovus-cts && if [[ -e .mflowgen/12-cadence-innovus-cts/mflowgen-debug ]]; then chmod +x .mflowgen/12-cadence-innovus-cts/mflowgen-debug && cp -f .mflowgen/12-cadence-innovus-cts/mflowgen-debug 12-cadence-innovus-cts; fi && if [[ -e .mflowgen/12-cadence-innovus-cts/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/12-cadence-innovus-cts/mflowgen-check-preconditions.py && cp -f .mflowgen/12-cadence-innovus-cts/mflowgen-check-preconditions.py 12-cadence-innovus-cts; fi && if [[ -e .mflowgen/12-cadence-innovus-cts/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/12-cadence-innovus-cts/mflowgen-check-postconditions.py && cp -f .mflowgen/12-cadence-innovus-cts/mflowgen-check-postconditions.py 12-cadence-innovus-cts; fi && cd 12-cadence-innovus-cts && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 12-cadence-innovus-cts/outputs/*
endef

12-cadence-innovus-cts/.execstamp: 12-cadence-innovus-cts/.stamp 12-cadence-innovus-cts/inputs/.stamp.adk 12-cadence-innovus-cts/inputs/.stamp.design.checkpoint 12-cadence-innovus-cts/inputs/.stamp.design.sdc 12-cadence-innovus-cts/inputs/.stamp.innovus-foundation-flow
	$(call 12_cadence_innovus_cts_commands_rule)
	touch $@

12-cadence-innovus-cts/outputs/.execstamp.design.checkpoint: 12-cadence-innovus-cts/.execstamp
	touch $@

endif

# collect outputs

12-cadence-innovus-cts/outputs/.stamp.design.checkpoint: 12-cadence-innovus-cts/.execstamp 12-cadence-innovus-cts/outputs/.execstamp.design.checkpoint
	$(call stamp,12-cadence-innovus-cts/outputs/.stamp.design.checkpoint)

# post-conditions

define 12_cadence_innovus_cts_post_conditions_commands_rule
	cd 12-cadence-innovus-cts && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

12-cadence-innovus-cts/.postconditions.stamp: 12-cadence-innovus-cts/.execstamp 12-cadence-innovus-cts/outputs/.execstamp.design.checkpoint 12-cadence-innovus-cts/outputs/.stamp.design.checkpoint
	$(call 12_cadence_innovus_cts_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: cadence-innovus-cts

cadence-innovus-cts: 12-cadence-innovus-cts/.execstamp 12-cadence-innovus-cts/.postconditions.stamp 12-cadence-innovus-cts/outputs/.execstamp.design.checkpoint 12-cadence-innovus-cts/outputs/.stamp.design.checkpoint

.PHONY: 12

12: 12-cadence-innovus-cts/.execstamp 12-cadence-innovus-cts/.postconditions.stamp 12-cadence-innovus-cts/outputs/.execstamp.design.checkpoint 12-cadence-innovus-cts/outputs/.stamp.design.checkpoint

# debug

define 12_debug_rule
	cd 12-cadence-innovus-cts && ./mflowgen-debug 2>&1 | tee mflowgen-debug.log
endef

debug-cadence-innovus-cts: 
	$(call 12_debug_rule)

.PHONY: debug-12

debug-12: debug-cadence-innovus-cts

# ------------------------------------------------------------------------
# cadence-innovus-postcts_hold
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 13-cadence-innovus-postcts_hold/.prebuilt)","")
13-cadence-innovus-postcts_hold/.stamp: 12-cadence-innovus-cts/.execstamp 12-cadence-innovus-cts/.postconditions.stamp 12-cadence-innovus-cts/outputs/.execstamp.design.checkpoint 12-cadence-innovus-cts/outputs/.stamp.design.checkpoint
13-cadence-innovus-postcts_hold/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
13-cadence-innovus-postcts_hold/.stamp: 8-cadence-innovus-flowsetup/.execstamp 8-cadence-innovus-flowsetup/.postconditions.stamp 8-cadence-innovus-flowsetup/outputs/.execstamp.innovus-foundation-flow 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow
13-cadence-innovus-postcts_hold/.stamp:
	$(call cpdir-and-parameterize,13-cadence-innovus-postcts_hold,../../mflowgen/steps/cadence-innovus-postcts_hold,13-cadence-innovus-postcts_hold/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 13-cadence-innovus-postcts_hold/.prebuilt)","")
13-cadence-innovus-postcts_hold/inputs/.stamp.adk: 13-cadence-innovus-postcts_hold/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,13-cadence-innovus-postcts_hold/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 13-cadence-innovus-postcts_hold/.prebuilt)","")
13-cadence-innovus-postcts_hold/inputs/.stamp.design.checkpoint: 13-cadence-innovus-postcts_hold/.stamp 12-cadence-innovus-cts/outputs/.stamp.design.checkpoint
	$(call symlink,13-cadence-innovus-postcts_hold/inputs,design.checkpoint,../../12-cadence-innovus-cts/outputs/design.checkpoint,.stamp.design.checkpoint)
endif

ifeq ("$(wildcard 13-cadence-innovus-postcts_hold/.prebuilt)","")
13-cadence-innovus-postcts_hold/inputs/.stamp.innovus-foundation-flow: 13-cadence-innovus-postcts_hold/.stamp 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow
	$(call symlink,13-cadence-innovus-postcts_hold/inputs,innovus-foundation-flow,../../8-cadence-innovus-flowsetup/outputs/innovus-foundation-flow,.stamp.innovus-foundation-flow)
endif

# execute

ifeq ("$(wildcard 13-cadence-innovus-postcts_hold/.prebuilt)","")

define 13_cadence_innovus_postcts_hold_commands_rule
	mkdir -p 13-cadence-innovus-postcts_hold/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-postcts_hold && chmod +x .mflowgen/13-cadence-innovus-postcts_hold/mflowgen-run && cp -f .mflowgen/13-cadence-innovus-postcts_hold/mflowgen-run 13-cadence-innovus-postcts_hold && if [[ -e .mflowgen/13-cadence-innovus-postcts_hold/mflowgen-debug ]]; then chmod +x .mflowgen/13-cadence-innovus-postcts_hold/mflowgen-debug && cp -f .mflowgen/13-cadence-innovus-postcts_hold/mflowgen-debug 13-cadence-innovus-postcts_hold; fi && if [[ -e .mflowgen/13-cadence-innovus-postcts_hold/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/13-cadence-innovus-postcts_hold/mflowgen-check-preconditions.py && cp -f .mflowgen/13-cadence-innovus-postcts_hold/mflowgen-check-preconditions.py 13-cadence-innovus-postcts_hold; fi && if [[ -e .mflowgen/13-cadence-innovus-postcts_hold/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/13-cadence-innovus-postcts_hold/mflowgen-check-postconditions.py && cp -f .mflowgen/13-cadence-innovus-postcts_hold/mflowgen-check-postconditions.py 13-cadence-innovus-postcts_hold; fi && cd 13-cadence-innovus-postcts_hold && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 13-cadence-innovus-postcts_hold/outputs/*
endef

13-cadence-innovus-postcts_hold/.execstamp: 13-cadence-innovus-postcts_hold/.stamp 13-cadence-innovus-postcts_hold/inputs/.stamp.adk 13-cadence-innovus-postcts_hold/inputs/.stamp.design.checkpoint 13-cadence-innovus-postcts_hold/inputs/.stamp.innovus-foundation-flow
	$(call 13_cadence_innovus_postcts_hold_commands_rule)
	touch $@

13-cadence-innovus-postcts_hold/outputs/.execstamp.design.checkpoint: 13-cadence-innovus-postcts_hold/.execstamp
	touch $@

endif

# collect outputs

13-cadence-innovus-postcts_hold/outputs/.stamp.design.checkpoint: 13-cadence-innovus-postcts_hold/.execstamp 13-cadence-innovus-postcts_hold/outputs/.execstamp.design.checkpoint
	$(call stamp,13-cadence-innovus-postcts_hold/outputs/.stamp.design.checkpoint)

# post-conditions

define 13_cadence_innovus_postcts_hold_post_conditions_commands_rule
	cd 13-cadence-innovus-postcts_hold && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

13-cadence-innovus-postcts_hold/.postconditions.stamp: 13-cadence-innovus-postcts_hold/.execstamp 13-cadence-innovus-postcts_hold/outputs/.execstamp.design.checkpoint 13-cadence-innovus-postcts_hold/outputs/.stamp.design.checkpoint
	$(call 13_cadence_innovus_postcts_hold_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: cadence-innovus-postcts_hold

cadence-innovus-postcts_hold: 13-cadence-innovus-postcts_hold/.execstamp 13-cadence-innovus-postcts_hold/.postconditions.stamp 13-cadence-innovus-postcts_hold/outputs/.execstamp.design.checkpoint 13-cadence-innovus-postcts_hold/outputs/.stamp.design.checkpoint

.PHONY: 13

13: 13-cadence-innovus-postcts_hold/.execstamp 13-cadence-innovus-postcts_hold/.postconditions.stamp 13-cadence-innovus-postcts_hold/outputs/.execstamp.design.checkpoint 13-cadence-innovus-postcts_hold/outputs/.stamp.design.checkpoint

# debug

define 13_debug_rule
	cd 13-cadence-innovus-postcts_hold && ./mflowgen-debug 2>&1 | tee mflowgen-debug.log
endef

debug-cadence-innovus-postcts_hold: 
	$(call 13_debug_rule)

.PHONY: debug-13

debug-13: debug-cadence-innovus-postcts_hold

# ------------------------------------------------------------------------
# cadence-innovus-route
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 14-cadence-innovus-route/.prebuilt)","")
14-cadence-innovus-route/.stamp: 13-cadence-innovus-postcts_hold/.execstamp 13-cadence-innovus-postcts_hold/.postconditions.stamp 13-cadence-innovus-postcts_hold/outputs/.execstamp.design.checkpoint 13-cadence-innovus-postcts_hold/outputs/.stamp.design.checkpoint
14-cadence-innovus-route/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
14-cadence-innovus-route/.stamp: 8-cadence-innovus-flowsetup/.execstamp 8-cadence-innovus-flowsetup/.postconditions.stamp 8-cadence-innovus-flowsetup/outputs/.execstamp.innovus-foundation-flow 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow
14-cadence-innovus-route/.stamp:
	$(call cpdir-and-parameterize,14-cadence-innovus-route,../../mflowgen/steps/cadence-innovus-route,14-cadence-innovus-route/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 14-cadence-innovus-route/.prebuilt)","")
14-cadence-innovus-route/inputs/.stamp.adk: 14-cadence-innovus-route/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,14-cadence-innovus-route/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 14-cadence-innovus-route/.prebuilt)","")
14-cadence-innovus-route/inputs/.stamp.design.checkpoint: 14-cadence-innovus-route/.stamp 13-cadence-innovus-postcts_hold/outputs/.stamp.design.checkpoint
	$(call symlink,14-cadence-innovus-route/inputs,design.checkpoint,../../13-cadence-innovus-postcts_hold/outputs/design.checkpoint,.stamp.design.checkpoint)
endif

ifeq ("$(wildcard 14-cadence-innovus-route/.prebuilt)","")
14-cadence-innovus-route/inputs/.stamp.innovus-foundation-flow: 14-cadence-innovus-route/.stamp 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow
	$(call symlink,14-cadence-innovus-route/inputs,innovus-foundation-flow,../../8-cadence-innovus-flowsetup/outputs/innovus-foundation-flow,.stamp.innovus-foundation-flow)
endif

# execute

ifeq ("$(wildcard 14-cadence-innovus-route/.prebuilt)","")

define 14_cadence_innovus_route_commands_rule
	mkdir -p 14-cadence-innovus-route/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-route && chmod +x .mflowgen/14-cadence-innovus-route/mflowgen-run && cp -f .mflowgen/14-cadence-innovus-route/mflowgen-run 14-cadence-innovus-route && if [[ -e .mflowgen/14-cadence-innovus-route/mflowgen-debug ]]; then chmod +x .mflowgen/14-cadence-innovus-route/mflowgen-debug && cp -f .mflowgen/14-cadence-innovus-route/mflowgen-debug 14-cadence-innovus-route; fi && if [[ -e .mflowgen/14-cadence-innovus-route/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/14-cadence-innovus-route/mflowgen-check-preconditions.py && cp -f .mflowgen/14-cadence-innovus-route/mflowgen-check-preconditions.py 14-cadence-innovus-route; fi && if [[ -e .mflowgen/14-cadence-innovus-route/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/14-cadence-innovus-route/mflowgen-check-postconditions.py && cp -f .mflowgen/14-cadence-innovus-route/mflowgen-check-postconditions.py 14-cadence-innovus-route; fi && cd 14-cadence-innovus-route && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 14-cadence-innovus-route/outputs/*
endef

14-cadence-innovus-route/.execstamp: 14-cadence-innovus-route/.stamp 14-cadence-innovus-route/inputs/.stamp.adk 14-cadence-innovus-route/inputs/.stamp.design.checkpoint 14-cadence-innovus-route/inputs/.stamp.innovus-foundation-flow
	$(call 14_cadence_innovus_route_commands_rule)
	touch $@

14-cadence-innovus-route/outputs/.execstamp.design.checkpoint: 14-cadence-innovus-route/.execstamp
	touch $@

endif

# collect outputs

14-cadence-innovus-route/outputs/.stamp.design.checkpoint: 14-cadence-innovus-route/.execstamp 14-cadence-innovus-route/outputs/.execstamp.design.checkpoint
	$(call stamp,14-cadence-innovus-route/outputs/.stamp.design.checkpoint)

# post-conditions

define 14_cadence_innovus_route_post_conditions_commands_rule
	cd 14-cadence-innovus-route && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

14-cadence-innovus-route/.postconditions.stamp: 14-cadence-innovus-route/.execstamp 14-cadence-innovus-route/outputs/.execstamp.design.checkpoint 14-cadence-innovus-route/outputs/.stamp.design.checkpoint
	$(call 14_cadence_innovus_route_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: cadence-innovus-route

cadence-innovus-route: 14-cadence-innovus-route/.execstamp 14-cadence-innovus-route/.postconditions.stamp 14-cadence-innovus-route/outputs/.execstamp.design.checkpoint 14-cadence-innovus-route/outputs/.stamp.design.checkpoint

.PHONY: 14

14: 14-cadence-innovus-route/.execstamp 14-cadence-innovus-route/.postconditions.stamp 14-cadence-innovus-route/outputs/.execstamp.design.checkpoint 14-cadence-innovus-route/outputs/.stamp.design.checkpoint

# debug

define 14_debug_rule
	cd 14-cadence-innovus-route && ./mflowgen-debug 2>&1 | tee mflowgen-debug.log
endef

debug-cadence-innovus-route: 
	$(call 14_debug_rule)

.PHONY: debug-14

debug-14: debug-cadence-innovus-route

# ------------------------------------------------------------------------
# cadence-innovus-postroute
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 15-cadence-innovus-postroute/.prebuilt)","")
15-cadence-innovus-postroute/.stamp: 14-cadence-innovus-route/.execstamp 14-cadence-innovus-route/.postconditions.stamp 14-cadence-innovus-route/outputs/.execstamp.design.checkpoint 14-cadence-innovus-route/outputs/.stamp.design.checkpoint
15-cadence-innovus-postroute/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
15-cadence-innovus-postroute/.stamp: 8-cadence-innovus-flowsetup/.execstamp 8-cadence-innovus-flowsetup/.postconditions.stamp 8-cadence-innovus-flowsetup/outputs/.execstamp.innovus-foundation-flow 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow
15-cadence-innovus-postroute/.stamp:
	$(call cpdir-and-parameterize,15-cadence-innovus-postroute,../../mflowgen/steps/cadence-innovus-postroute,15-cadence-innovus-postroute/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 15-cadence-innovus-postroute/.prebuilt)","")
15-cadence-innovus-postroute/inputs/.stamp.adk: 15-cadence-innovus-postroute/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,15-cadence-innovus-postroute/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 15-cadence-innovus-postroute/.prebuilt)","")
15-cadence-innovus-postroute/inputs/.stamp.design.checkpoint: 15-cadence-innovus-postroute/.stamp 14-cadence-innovus-route/outputs/.stamp.design.checkpoint
	$(call symlink,15-cadence-innovus-postroute/inputs,design.checkpoint,../../14-cadence-innovus-route/outputs/design.checkpoint,.stamp.design.checkpoint)
endif

ifeq ("$(wildcard 15-cadence-innovus-postroute/.prebuilt)","")
15-cadence-innovus-postroute/inputs/.stamp.innovus-foundation-flow: 15-cadence-innovus-postroute/.stamp 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow
	$(call symlink,15-cadence-innovus-postroute/inputs,innovus-foundation-flow,../../8-cadence-innovus-flowsetup/outputs/innovus-foundation-flow,.stamp.innovus-foundation-flow)
endif

# execute

ifeq ("$(wildcard 15-cadence-innovus-postroute/.prebuilt)","")

define 15_cadence_innovus_postroute_commands_rule
	mkdir -p 15-cadence-innovus-postroute/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-postroute && chmod +x .mflowgen/15-cadence-innovus-postroute/mflowgen-run && cp -f .mflowgen/15-cadence-innovus-postroute/mflowgen-run 15-cadence-innovus-postroute && if [[ -e .mflowgen/15-cadence-innovus-postroute/mflowgen-debug ]]; then chmod +x .mflowgen/15-cadence-innovus-postroute/mflowgen-debug && cp -f .mflowgen/15-cadence-innovus-postroute/mflowgen-debug 15-cadence-innovus-postroute; fi && if [[ -e .mflowgen/15-cadence-innovus-postroute/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/15-cadence-innovus-postroute/mflowgen-check-preconditions.py && cp -f .mflowgen/15-cadence-innovus-postroute/mflowgen-check-preconditions.py 15-cadence-innovus-postroute; fi && if [[ -e .mflowgen/15-cadence-innovus-postroute/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/15-cadence-innovus-postroute/mflowgen-check-postconditions.py && cp -f .mflowgen/15-cadence-innovus-postroute/mflowgen-check-postconditions.py 15-cadence-innovus-postroute; fi && cd 15-cadence-innovus-postroute && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 15-cadence-innovus-postroute/outputs/*
endef

15-cadence-innovus-postroute/.execstamp: 15-cadence-innovus-postroute/.stamp 15-cadence-innovus-postroute/inputs/.stamp.adk 15-cadence-innovus-postroute/inputs/.stamp.design.checkpoint 15-cadence-innovus-postroute/inputs/.stamp.innovus-foundation-flow
	$(call 15_cadence_innovus_postroute_commands_rule)
	touch $@

15-cadence-innovus-postroute/outputs/.execstamp.design.checkpoint: 15-cadence-innovus-postroute/.execstamp
	touch $@

endif

# collect outputs

15-cadence-innovus-postroute/outputs/.stamp.design.checkpoint: 15-cadence-innovus-postroute/.execstamp 15-cadence-innovus-postroute/outputs/.execstamp.design.checkpoint
	$(call stamp,15-cadence-innovus-postroute/outputs/.stamp.design.checkpoint)

# post-conditions

define 15_cadence_innovus_postroute_post_conditions_commands_rule
	cd 15-cadence-innovus-postroute && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

15-cadence-innovus-postroute/.postconditions.stamp: 15-cadence-innovus-postroute/.execstamp 15-cadence-innovus-postroute/outputs/.execstamp.design.checkpoint 15-cadence-innovus-postroute/outputs/.stamp.design.checkpoint
	$(call 15_cadence_innovus_postroute_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: cadence-innovus-postroute

cadence-innovus-postroute: 15-cadence-innovus-postroute/.execstamp 15-cadence-innovus-postroute/.postconditions.stamp 15-cadence-innovus-postroute/outputs/.execstamp.design.checkpoint 15-cadence-innovus-postroute/outputs/.stamp.design.checkpoint

.PHONY: 15

15: 15-cadence-innovus-postroute/.execstamp 15-cadence-innovus-postroute/.postconditions.stamp 15-cadence-innovus-postroute/outputs/.execstamp.design.checkpoint 15-cadence-innovus-postroute/outputs/.stamp.design.checkpoint

# debug

define 15_debug_rule
	cd 15-cadence-innovus-postroute && ./mflowgen-debug 2>&1 | tee mflowgen-debug.log
endef

debug-cadence-innovus-postroute: 
	$(call 15_debug_rule)

.PHONY: debug-15

debug-15: debug-cadence-innovus-postroute

# ------------------------------------------------------------------------
# cadence-innovus-signoff
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 16-cadence-innovus-signoff/.prebuilt)","")
16-cadence-innovus-signoff/.stamp: 15-cadence-innovus-postroute/.execstamp 15-cadence-innovus-postroute/.postconditions.stamp 15-cadence-innovus-postroute/outputs/.execstamp.design.checkpoint 15-cadence-innovus-postroute/outputs/.stamp.design.checkpoint
16-cadence-innovus-signoff/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
16-cadence-innovus-signoff/.stamp: 8-cadence-innovus-flowsetup/.execstamp 8-cadence-innovus-flowsetup/.postconditions.stamp 8-cadence-innovus-flowsetup/outputs/.execstamp.innovus-foundation-flow 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow
16-cadence-innovus-signoff/.stamp:
	$(call cpdir-and-parameterize,16-cadence-innovus-signoff,../design/cadence-innovus-signoff,16-cadence-innovus-signoff/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 16-cadence-innovus-signoff/.prebuilt)","")
16-cadence-innovus-signoff/inputs/.stamp.adk: 16-cadence-innovus-signoff/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,16-cadence-innovus-signoff/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 16-cadence-innovus-signoff/.prebuilt)","")
16-cadence-innovus-signoff/inputs/.stamp.design.checkpoint: 16-cadence-innovus-signoff/.stamp 15-cadence-innovus-postroute/outputs/.stamp.design.checkpoint
	$(call symlink,16-cadence-innovus-signoff/inputs,design.checkpoint,../../15-cadence-innovus-postroute/outputs/design.checkpoint,.stamp.design.checkpoint)
endif

ifeq ("$(wildcard 16-cadence-innovus-signoff/.prebuilt)","")
16-cadence-innovus-signoff/inputs/.stamp.innovus-foundation-flow: 16-cadence-innovus-signoff/.stamp 8-cadence-innovus-flowsetup/outputs/.stamp.innovus-foundation-flow
	$(call symlink,16-cadence-innovus-signoff/inputs,innovus-foundation-flow,../../8-cadence-innovus-flowsetup/outputs/innovus-foundation-flow,.stamp.innovus-foundation-flow)
endif

# execute

ifeq ("$(wildcard 16-cadence-innovus-signoff/.prebuilt)","")

define 16_cadence_innovus_signoff_commands_rule
	mkdir -p 16-cadence-innovus-signoff/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-signoff && chmod +x .mflowgen/16-cadence-innovus-signoff/mflowgen-run && cp -f .mflowgen/16-cadence-innovus-signoff/mflowgen-run 16-cadence-innovus-signoff && if [[ -e .mflowgen/16-cadence-innovus-signoff/mflowgen-debug ]]; then chmod +x .mflowgen/16-cadence-innovus-signoff/mflowgen-debug && cp -f .mflowgen/16-cadence-innovus-signoff/mflowgen-debug 16-cadence-innovus-signoff; fi && if [[ -e .mflowgen/16-cadence-innovus-signoff/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/16-cadence-innovus-signoff/mflowgen-check-preconditions.py && cp -f .mflowgen/16-cadence-innovus-signoff/mflowgen-check-preconditions.py 16-cadence-innovus-signoff; fi && if [[ -e .mflowgen/16-cadence-innovus-signoff/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/16-cadence-innovus-signoff/mflowgen-check-postconditions.py && cp -f .mflowgen/16-cadence-innovus-signoff/mflowgen-check-postconditions.py 16-cadence-innovus-signoff; fi && cd 16-cadence-innovus-signoff && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 16-cadence-innovus-signoff/outputs/*
endef

16-cadence-innovus-signoff/.execstamp: 16-cadence-innovus-signoff/.stamp 16-cadence-innovus-signoff/inputs/.stamp.adk 16-cadence-innovus-signoff/inputs/.stamp.design.checkpoint 16-cadence-innovus-signoff/inputs/.stamp.innovus-foundation-flow
	$(call 16_cadence_innovus_signoff_commands_rule)
	touch $@

16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint: 16-cadence-innovus-signoff/.execstamp
	touch $@
16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz: 16-cadence-innovus-signoff/.execstamp
	touch $@
16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds: 16-cadence-innovus-signoff/.execstamp
	touch $@
16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v: 16-cadence-innovus-signoff/.execstamp
	touch $@
16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v: 16-cadence-innovus-signoff/.execstamp
	touch $@
16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v: 16-cadence-innovus-signoff/.execstamp
	touch $@
16-cadence-innovus-signoff/outputs/.execstamp.design.lef: 16-cadence-innovus-signoff/.execstamp
	touch $@
16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz: 16-cadence-innovus-signoff/.execstamp
	touch $@
16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc: 16-cadence-innovus-signoff/.execstamp
	touch $@
16-cadence-innovus-signoff/outputs/.execstamp.design.sdf: 16-cadence-innovus-signoff/.execstamp
	touch $@
16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v: 16-cadence-innovus-signoff/.execstamp
	touch $@
16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz: 16-cadence-innovus-signoff/.execstamp
	touch $@
16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz: 16-cadence-innovus-signoff/.execstamp
	touch $@

endif

# collect outputs

16-cadence-innovus-signoff/outputs/.stamp.design.checkpoint: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v
	$(call stamp,16-cadence-innovus-signoff/outputs/.stamp.design.checkpoint)

16-cadence-innovus-signoff/outputs/.stamp.design.gds.gz: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v
	$(call stamp,16-cadence-innovus-signoff/outputs/.stamp.design.gds.gz)

16-cadence-innovus-signoff/outputs/.stamp.design-merged.gds: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v
	$(call stamp,16-cadence-innovus-signoff/outputs/.stamp.design-merged.gds)

16-cadence-innovus-signoff/outputs/.stamp.design.lvs.v: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v
	$(call stamp,16-cadence-innovus-signoff/outputs/.stamp.design.lvs.v)

16-cadence-innovus-signoff/outputs/.stamp.design.vcs.v: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v
	$(call stamp,16-cadence-innovus-signoff/outputs/.stamp.design.vcs.v)

16-cadence-innovus-signoff/outputs/.stamp.design.vcs.pg.v: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v
	$(call stamp,16-cadence-innovus-signoff/outputs/.stamp.design.vcs.pg.v)

16-cadence-innovus-signoff/outputs/.stamp.design.lef: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v
	$(call stamp,16-cadence-innovus-signoff/outputs/.stamp.design.lef)

16-cadence-innovus-signoff/outputs/.stamp.design.def.gz: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v
	$(call stamp,16-cadence-innovus-signoff/outputs/.stamp.design.def.gz)

16-cadence-innovus-signoff/outputs/.stamp.design.pt.sdc: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v
	$(call stamp,16-cadence-innovus-signoff/outputs/.stamp.design.pt.sdc)

16-cadence-innovus-signoff/outputs/.stamp.design.sdf: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v
	$(call stamp,16-cadence-innovus-signoff/outputs/.stamp.design.sdf)

16-cadence-innovus-signoff/outputs/.stamp.design.virtuoso.v: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v
	$(call stamp,16-cadence-innovus-signoff/outputs/.stamp.design.virtuoso.v)

16-cadence-innovus-signoff/outputs/.stamp.design.spef.gz: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v
	$(call stamp,16-cadence-innovus-signoff/outputs/.stamp.design.spef.gz)

16-cadence-innovus-signoff/outputs/.stamp.design.rcbest.spef.gz: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v
	$(call stamp,16-cadence-innovus-signoff/outputs/.stamp.design.rcbest.spef.gz)

# post-conditions

define 16_cadence_innovus_signoff_post_conditions_commands_rule
	cd 16-cadence-innovus-signoff && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

16-cadence-innovus-signoff/.postconditions.stamp: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v 16-cadence-innovus-signoff/outputs/.stamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.stamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.stamp.design.def.gz 16-cadence-innovus-signoff/outputs/.stamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.stamp.design.lef 16-cadence-innovus-signoff/outputs/.stamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.stamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.stamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.sdf 16-cadence-innovus-signoff/outputs/.stamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.stamp.design.virtuoso.v
	$(call 16_cadence_innovus_signoff_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: cadence-innovus-signoff

cadence-innovus-signoff: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/.postconditions.stamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v 16-cadence-innovus-signoff/outputs/.stamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.stamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.stamp.design.def.gz 16-cadence-innovus-signoff/outputs/.stamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.stamp.design.lef 16-cadence-innovus-signoff/outputs/.stamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.stamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.stamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.sdf 16-cadence-innovus-signoff/outputs/.stamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.stamp.design.virtuoso.v

.PHONY: 16

16: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/.postconditions.stamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v 16-cadence-innovus-signoff/outputs/.stamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.stamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.stamp.design.def.gz 16-cadence-innovus-signoff/outputs/.stamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.stamp.design.lef 16-cadence-innovus-signoff/outputs/.stamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.stamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.stamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.sdf 16-cadence-innovus-signoff/outputs/.stamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.stamp.design.virtuoso.v

# debug

define 16_debug_rule
	cd 16-cadence-innovus-signoff && ./mflowgen-debug 2>&1 | tee mflowgen-debug.log
endef

debug-cadence-innovus-signoff: 
	$(call 16_debug_rule)

.PHONY: debug-16

debug-16: debug-cadence-innovus-signoff

# ------------------------------------------------------------------------
# mentor-calibre-gdsmerge
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 17-mentor-calibre-gdsmerge/.prebuilt)","")
17-mentor-calibre-gdsmerge/.stamp: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/.postconditions.stamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v 16-cadence-innovus-signoff/outputs/.stamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.stamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.stamp.design.def.gz 16-cadence-innovus-signoff/outputs/.stamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.stamp.design.lef 16-cadence-innovus-signoff/outputs/.stamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.stamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.stamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.sdf 16-cadence-innovus-signoff/outputs/.stamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.stamp.design.virtuoso.v
17-mentor-calibre-gdsmerge/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
17-mentor-calibre-gdsmerge/.stamp:
	$(call cpdir-and-parameterize,17-mentor-calibre-gdsmerge,../../mflowgen/steps/mentor-calibre-gdsmerge,17-mentor-calibre-gdsmerge/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 17-mentor-calibre-gdsmerge/.prebuilt)","")
17-mentor-calibre-gdsmerge/inputs/.stamp.adk: 17-mentor-calibre-gdsmerge/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,17-mentor-calibre-gdsmerge/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 17-mentor-calibre-gdsmerge/.prebuilt)","")
17-mentor-calibre-gdsmerge/inputs/.stamp.design.gds.gz: 17-mentor-calibre-gdsmerge/.stamp 16-cadence-innovus-signoff/outputs/.stamp.design.gds.gz
	$(call symlink,17-mentor-calibre-gdsmerge/inputs,design.gds.gz,../../16-cadence-innovus-signoff/outputs/design.gds.gz,.stamp.design.gds.gz)
endif

# execute

ifeq ("$(wildcard 17-mentor-calibre-gdsmerge/.prebuilt)","")

define 17_mentor_calibre_gdsmerge_commands_rule
	mkdir -p 17-mentor-calibre-gdsmerge/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t mentor-calibre-gdsmerge && chmod +x .mflowgen/17-mentor-calibre-gdsmerge/mflowgen-run && cp -f .mflowgen/17-mentor-calibre-gdsmerge/mflowgen-run 17-mentor-calibre-gdsmerge && if [[ -e .mflowgen/17-mentor-calibre-gdsmerge/mflowgen-debug ]]; then chmod +x .mflowgen/17-mentor-calibre-gdsmerge/mflowgen-debug && cp -f .mflowgen/17-mentor-calibre-gdsmerge/mflowgen-debug 17-mentor-calibre-gdsmerge; fi && if [[ -e .mflowgen/17-mentor-calibre-gdsmerge/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/17-mentor-calibre-gdsmerge/mflowgen-check-preconditions.py && cp -f .mflowgen/17-mentor-calibre-gdsmerge/mflowgen-check-preconditions.py 17-mentor-calibre-gdsmerge; fi && if [[ -e .mflowgen/17-mentor-calibre-gdsmerge/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/17-mentor-calibre-gdsmerge/mflowgen-check-postconditions.py && cp -f .mflowgen/17-mentor-calibre-gdsmerge/mflowgen-check-postconditions.py 17-mentor-calibre-gdsmerge; fi && cd 17-mentor-calibre-gdsmerge && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 17-mentor-calibre-gdsmerge/outputs/*
endef

17-mentor-calibre-gdsmerge/.execstamp: 17-mentor-calibre-gdsmerge/.stamp 17-mentor-calibre-gdsmerge/inputs/.stamp.adk 17-mentor-calibre-gdsmerge/inputs/.stamp.design.gds.gz
	$(call 17_mentor_calibre_gdsmerge_commands_rule)
	touch $@

17-mentor-calibre-gdsmerge/outputs/.execstamp.design_merged.gds: 17-mentor-calibre-gdsmerge/.execstamp
	touch $@

endif

# collect outputs

17-mentor-calibre-gdsmerge/outputs/.stamp.design_merged.gds: 17-mentor-calibre-gdsmerge/.execstamp 17-mentor-calibre-gdsmerge/outputs/.execstamp.design_merged.gds
	$(call stamp,17-mentor-calibre-gdsmerge/outputs/.stamp.design_merged.gds)

# post-conditions

define 17_mentor_calibre_gdsmerge_post_conditions_commands_rule
	cd 17-mentor-calibre-gdsmerge && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

17-mentor-calibre-gdsmerge/.postconditions.stamp: 17-mentor-calibre-gdsmerge/.execstamp 17-mentor-calibre-gdsmerge/outputs/.execstamp.design_merged.gds 17-mentor-calibre-gdsmerge/outputs/.stamp.design_merged.gds
	$(call 17_mentor_calibre_gdsmerge_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: mentor-calibre-gdsmerge

mentor-calibre-gdsmerge: 17-mentor-calibre-gdsmerge/.execstamp 17-mentor-calibre-gdsmerge/.postconditions.stamp 17-mentor-calibre-gdsmerge/outputs/.execstamp.design_merged.gds 17-mentor-calibre-gdsmerge/outputs/.stamp.design_merged.gds

.PHONY: 17

17: 17-mentor-calibre-gdsmerge/.execstamp 17-mentor-calibre-gdsmerge/.postconditions.stamp 17-mentor-calibre-gdsmerge/outputs/.execstamp.design_merged.gds 17-mentor-calibre-gdsmerge/outputs/.stamp.design_merged.gds

# debug

define 17_debug_rule
	cd 17-mentor-calibre-gdsmerge && ./mflowgen-debug 2>&1 | tee mflowgen-debug.log
endef

debug-mentor-calibre-gdsmerge: 
	$(call 17_debug_rule)

.PHONY: debug-17

debug-17: debug-mentor-calibre-gdsmerge

# ------------------------------------------------------------------------
# open-magic-def2spice
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 18-open-magic-def2spice/.prebuilt)","")
18-open-magic-def2spice/.stamp: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/.postconditions.stamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v 16-cadence-innovus-signoff/outputs/.stamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.stamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.stamp.design.def.gz 16-cadence-innovus-signoff/outputs/.stamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.stamp.design.lef 16-cadence-innovus-signoff/outputs/.stamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.stamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.stamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.sdf 16-cadence-innovus-signoff/outputs/.stamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.stamp.design.virtuoso.v
18-open-magic-def2spice/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
18-open-magic-def2spice/.stamp:
	$(call cpdir-and-parameterize,18-open-magic-def2spice,../design/open-magic-def2spice,18-open-magic-def2spice/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 18-open-magic-def2spice/.prebuilt)","")
18-open-magic-def2spice/inputs/.stamp.adk: 18-open-magic-def2spice/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,18-open-magic-def2spice/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 18-open-magic-def2spice/.prebuilt)","")
18-open-magic-def2spice/inputs/.stamp.design.def.gz: 18-open-magic-def2spice/.stamp 16-cadence-innovus-signoff/outputs/.stamp.design.def.gz
	$(call symlink,18-open-magic-def2spice/inputs,design.def.gz,../../16-cadence-innovus-signoff/outputs/design.def.gz,.stamp.design.def.gz)
endif

# execute

ifeq ("$(wildcard 18-open-magic-def2spice/.prebuilt)","")

define 18_open_magic_def2spice_commands_rule
	mkdir -p 18-open-magic-def2spice/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t open-magic-def2spice && chmod +x .mflowgen/18-open-magic-def2spice/mflowgen-run && cp -f .mflowgen/18-open-magic-def2spice/mflowgen-run 18-open-magic-def2spice && if [[ -e .mflowgen/18-open-magic-def2spice/mflowgen-debug ]]; then chmod +x .mflowgen/18-open-magic-def2spice/mflowgen-debug && cp -f .mflowgen/18-open-magic-def2spice/mflowgen-debug 18-open-magic-def2spice; fi && if [[ -e .mflowgen/18-open-magic-def2spice/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/18-open-magic-def2spice/mflowgen-check-preconditions.py && cp -f .mflowgen/18-open-magic-def2spice/mflowgen-check-preconditions.py 18-open-magic-def2spice; fi && if [[ -e .mflowgen/18-open-magic-def2spice/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/18-open-magic-def2spice/mflowgen-check-postconditions.py && cp -f .mflowgen/18-open-magic-def2spice/mflowgen-check-postconditions.py 18-open-magic-def2spice; fi && cd 18-open-magic-def2spice && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 18-open-magic-def2spice/outputs/*
endef

18-open-magic-def2spice/.execstamp: 18-open-magic-def2spice/.stamp 18-open-magic-def2spice/inputs/.stamp.adk 18-open-magic-def2spice/inputs/.stamp.design.def.gz
	$(call 18_open_magic_def2spice_commands_rule)
	touch $@

18-open-magic-def2spice/outputs/.execstamp.design_extracted.spice: 18-open-magic-def2spice/.execstamp
	touch $@

endif

# collect outputs

18-open-magic-def2spice/outputs/.stamp.design_extracted.spice: 18-open-magic-def2spice/.execstamp 18-open-magic-def2spice/outputs/.execstamp.design_extracted.spice
	$(call stamp,18-open-magic-def2spice/outputs/.stamp.design_extracted.spice)

# post-conditions

define 18_open_magic_def2spice_post_conditions_commands_rule
	cd 18-open-magic-def2spice && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

18-open-magic-def2spice/.postconditions.stamp: 18-open-magic-def2spice/.execstamp 18-open-magic-def2spice/outputs/.execstamp.design_extracted.spice 18-open-magic-def2spice/outputs/.stamp.design_extracted.spice
	$(call 18_open_magic_def2spice_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: open-magic-def2spice

open-magic-def2spice: 18-open-magic-def2spice/.execstamp 18-open-magic-def2spice/.postconditions.stamp 18-open-magic-def2spice/outputs/.execstamp.design_extracted.spice 18-open-magic-def2spice/outputs/.stamp.design_extracted.spice

.PHONY: 18

18: 18-open-magic-def2spice/.execstamp 18-open-magic-def2spice/.postconditions.stamp 18-open-magic-def2spice/outputs/.execstamp.design_extracted.spice 18-open-magic-def2spice/outputs/.stamp.design_extracted.spice

# debug

# ------------------------------------------------------------------------
# synopsys-pt-timing-signoff
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 19-synopsys-pt-timing-signoff/.prebuilt)","")
19-synopsys-pt-timing-signoff/.stamp: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/.postconditions.stamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v 16-cadence-innovus-signoff/outputs/.stamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.stamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.stamp.design.def.gz 16-cadence-innovus-signoff/outputs/.stamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.stamp.design.lef 16-cadence-innovus-signoff/outputs/.stamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.stamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.stamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.sdf 16-cadence-innovus-signoff/outputs/.stamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.stamp.design.virtuoso.v
19-synopsys-pt-timing-signoff/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
19-synopsys-pt-timing-signoff/.stamp:
	$(call cpdir-and-parameterize,19-synopsys-pt-timing-signoff,../../mflowgen/steps/synopsys-pt-timing-signoff,19-synopsys-pt-timing-signoff/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 19-synopsys-pt-timing-signoff/.prebuilt)","")
19-synopsys-pt-timing-signoff/inputs/.stamp.adk: 19-synopsys-pt-timing-signoff/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,19-synopsys-pt-timing-signoff/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 19-synopsys-pt-timing-signoff/.prebuilt)","")
19-synopsys-pt-timing-signoff/inputs/.stamp.design.pt.sdc: 19-synopsys-pt-timing-signoff/.stamp 16-cadence-innovus-signoff/outputs/.stamp.design.pt.sdc
	$(call symlink,19-synopsys-pt-timing-signoff/inputs,design.pt.sdc,../../16-cadence-innovus-signoff/outputs/design.pt.sdc,.stamp.design.pt.sdc)
endif

ifeq ("$(wildcard 19-synopsys-pt-timing-signoff/.prebuilt)","")
19-synopsys-pt-timing-signoff/inputs/.stamp.design.spef.gz: 19-synopsys-pt-timing-signoff/.stamp 16-cadence-innovus-signoff/outputs/.stamp.design.spef.gz
	$(call symlink,19-synopsys-pt-timing-signoff/inputs,design.spef.gz,../../16-cadence-innovus-signoff/outputs/design.spef.gz,.stamp.design.spef.gz)
endif

ifeq ("$(wildcard 19-synopsys-pt-timing-signoff/.prebuilt)","")
19-synopsys-pt-timing-signoff/inputs/.stamp.design.vcs.v: 19-synopsys-pt-timing-signoff/.stamp 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.v
	$(call symlink,19-synopsys-pt-timing-signoff/inputs,design.vcs.v,../../16-cadence-innovus-signoff/outputs/design.vcs.v,.stamp.design.vcs.v)
endif

# execute

ifeq ("$(wildcard 19-synopsys-pt-timing-signoff/.prebuilt)","")

define 19_synopsys_pt_timing_signoff_commands_rule
	mkdir -p 19-synopsys-pt-timing-signoff/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t synopsys-pt-timing-signoff && chmod +x .mflowgen/19-synopsys-pt-timing-signoff/mflowgen-run && cp -f .mflowgen/19-synopsys-pt-timing-signoff/mflowgen-run 19-synopsys-pt-timing-signoff && if [[ -e .mflowgen/19-synopsys-pt-timing-signoff/mflowgen-debug ]]; then chmod +x .mflowgen/19-synopsys-pt-timing-signoff/mflowgen-debug && cp -f .mflowgen/19-synopsys-pt-timing-signoff/mflowgen-debug 19-synopsys-pt-timing-signoff; fi && if [[ -e .mflowgen/19-synopsys-pt-timing-signoff/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/19-synopsys-pt-timing-signoff/mflowgen-check-preconditions.py && cp -f .mflowgen/19-synopsys-pt-timing-signoff/mflowgen-check-preconditions.py 19-synopsys-pt-timing-signoff; fi && if [[ -e .mflowgen/19-synopsys-pt-timing-signoff/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/19-synopsys-pt-timing-signoff/mflowgen-check-postconditions.py && cp -f .mflowgen/19-synopsys-pt-timing-signoff/mflowgen-check-postconditions.py 19-synopsys-pt-timing-signoff; fi && cd 19-synopsys-pt-timing-signoff && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 19-synopsys-pt-timing-signoff/outputs/*
endef

19-synopsys-pt-timing-signoff/.execstamp: 19-synopsys-pt-timing-signoff/.stamp 19-synopsys-pt-timing-signoff/inputs/.stamp.adk 19-synopsys-pt-timing-signoff/inputs/.stamp.design.pt.sdc 19-synopsys-pt-timing-signoff/inputs/.stamp.design.spef.gz 19-synopsys-pt-timing-signoff/inputs/.stamp.design.vcs.v
	$(call 19_synopsys_pt_timing_signoff_commands_rule)
	touch $@

19-synopsys-pt-timing-signoff/outputs/.execstamp.design.sdf: 19-synopsys-pt-timing-signoff/.execstamp
	touch $@

endif

# collect outputs

19-synopsys-pt-timing-signoff/outputs/.stamp.design.sdf: 19-synopsys-pt-timing-signoff/.execstamp 19-synopsys-pt-timing-signoff/outputs/.execstamp.design.sdf
	$(call stamp,19-synopsys-pt-timing-signoff/outputs/.stamp.design.sdf)

# post-conditions

define 19_synopsys_pt_timing_signoff_post_conditions_commands_rule
	cd 19-synopsys-pt-timing-signoff && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

19-synopsys-pt-timing-signoff/.postconditions.stamp: 19-synopsys-pt-timing-signoff/.execstamp 19-synopsys-pt-timing-signoff/outputs/.execstamp.design.sdf 19-synopsys-pt-timing-signoff/outputs/.stamp.design.sdf
	$(call 19_synopsys_pt_timing_signoff_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: synopsys-pt-timing-signoff

synopsys-pt-timing-signoff: 19-synopsys-pt-timing-signoff/.execstamp 19-synopsys-pt-timing-signoff/.postconditions.stamp 19-synopsys-pt-timing-signoff/outputs/.execstamp.design.sdf 19-synopsys-pt-timing-signoff/outputs/.stamp.design.sdf

.PHONY: 19

19: 19-synopsys-pt-timing-signoff/.execstamp 19-synopsys-pt-timing-signoff/.postconditions.stamp 19-synopsys-pt-timing-signoff/outputs/.execstamp.design.sdf 19-synopsys-pt-timing-signoff/outputs/.stamp.design.sdf

# debug

# ------------------------------------------------------------------------
# synopsys-ptpx-rtl
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 20-synopsys-ptpx-rtl/.prebuilt)","")
20-synopsys-ptpx-rtl/.stamp: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/.postconditions.stamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v 16-cadence-innovus-signoff/outputs/.stamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.stamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.stamp.design.def.gz 16-cadence-innovus-signoff/outputs/.stamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.stamp.design.lef 16-cadence-innovus-signoff/outputs/.stamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.stamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.stamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.sdf 16-cadence-innovus-signoff/outputs/.stamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.stamp.design.virtuoso.v
20-synopsys-ptpx-rtl/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
20-synopsys-ptpx-rtl/.stamp: 6-gen-saif-rtl/.execstamp 6-gen-saif-rtl/.postconditions.stamp 6-gen-saif-rtl/outputs/.execstamp.run.saif 6-gen-saif-rtl/outputs/.stamp.run.saif
20-synopsys-ptpx-rtl/.stamp: 7-synopsys-dc-synthesis/.execstamp 7-synopsys-dc-synthesis/.postconditions.stamp 7-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 7-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 7-synopsys-dc-synthesis/outputs/.execstamp.design.svf 7-synopsys-dc-synthesis/outputs/.execstamp.design.v 7-synopsys-dc-synthesis/outputs/.stamp.design.namemap 7-synopsys-dc-synthesis/outputs/.stamp.design.sdc 7-synopsys-dc-synthesis/outputs/.stamp.design.svf 7-synopsys-dc-synthesis/outputs/.stamp.design.v
20-synopsys-ptpx-rtl/.stamp:
	$(call cpdir-and-parameterize,20-synopsys-ptpx-rtl,../design/synopsys-ptpx-rtl,20-synopsys-ptpx-rtl/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 20-synopsys-ptpx-rtl/.prebuilt)","")
20-synopsys-ptpx-rtl/inputs/.stamp.adk: 20-synopsys-ptpx-rtl/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,20-synopsys-ptpx-rtl/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 20-synopsys-ptpx-rtl/.prebuilt)","")
20-synopsys-ptpx-rtl/inputs/.stamp.design.namemap: 20-synopsys-ptpx-rtl/.stamp 7-synopsys-dc-synthesis/outputs/.stamp.design.namemap
	$(call symlink,20-synopsys-ptpx-rtl/inputs,design.namemap,../../7-synopsys-dc-synthesis/outputs/design.namemap,.stamp.design.namemap)
endif

ifeq ("$(wildcard 20-synopsys-ptpx-rtl/.prebuilt)","")
20-synopsys-ptpx-rtl/inputs/.stamp.design.pt.sdc: 20-synopsys-ptpx-rtl/.stamp 16-cadence-innovus-signoff/outputs/.stamp.design.pt.sdc
	$(call symlink,20-synopsys-ptpx-rtl/inputs,design.pt.sdc,../../16-cadence-innovus-signoff/outputs/design.pt.sdc,.stamp.design.pt.sdc)
endif

ifeq ("$(wildcard 20-synopsys-ptpx-rtl/.prebuilt)","")
20-synopsys-ptpx-rtl/inputs/.stamp.design.spef.gz: 20-synopsys-ptpx-rtl/.stamp 16-cadence-innovus-signoff/outputs/.stamp.design.spef.gz
	$(call symlink,20-synopsys-ptpx-rtl/inputs,design.spef.gz,../../16-cadence-innovus-signoff/outputs/design.spef.gz,.stamp.design.spef.gz)
endif

ifeq ("$(wildcard 20-synopsys-ptpx-rtl/.prebuilt)","")
20-synopsys-ptpx-rtl/inputs/.stamp.design.vcs.v: 20-synopsys-ptpx-rtl/.stamp 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.v
	$(call symlink,20-synopsys-ptpx-rtl/inputs,design.vcs.v,../../16-cadence-innovus-signoff/outputs/design.vcs.v,.stamp.design.vcs.v)
endif

ifeq ("$(wildcard 20-synopsys-ptpx-rtl/.prebuilt)","")
20-synopsys-ptpx-rtl/inputs/.stamp.run.saif: 20-synopsys-ptpx-rtl/.stamp 6-gen-saif-rtl/outputs/.stamp.run.saif
	$(call symlink,20-synopsys-ptpx-rtl/inputs,run.saif,../../6-gen-saif-rtl/outputs/run.saif,.stamp.run.saif)
endif

# execute

ifeq ("$(wildcard 20-synopsys-ptpx-rtl/.prebuilt)","")

define 20_synopsys_ptpx_rtl_commands_rule
	mkdir -p 20-synopsys-ptpx-rtl/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t synopsys-ptpx-rtl && chmod +x .mflowgen/20-synopsys-ptpx-rtl/mflowgen-run && cp -f .mflowgen/20-synopsys-ptpx-rtl/mflowgen-run 20-synopsys-ptpx-rtl && if [[ -e .mflowgen/20-synopsys-ptpx-rtl/mflowgen-debug ]]; then chmod +x .mflowgen/20-synopsys-ptpx-rtl/mflowgen-debug && cp -f .mflowgen/20-synopsys-ptpx-rtl/mflowgen-debug 20-synopsys-ptpx-rtl; fi && if [[ -e .mflowgen/20-synopsys-ptpx-rtl/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/20-synopsys-ptpx-rtl/mflowgen-check-preconditions.py && cp -f .mflowgen/20-synopsys-ptpx-rtl/mflowgen-check-preconditions.py 20-synopsys-ptpx-rtl; fi && if [[ -e .mflowgen/20-synopsys-ptpx-rtl/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/20-synopsys-ptpx-rtl/mflowgen-check-postconditions.py && cp -f .mflowgen/20-synopsys-ptpx-rtl/mflowgen-check-postconditions.py 20-synopsys-ptpx-rtl; fi && cd 20-synopsys-ptpx-rtl && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 20-synopsys-ptpx-rtl/outputs/*
endef

20-synopsys-ptpx-rtl/.execstamp: 20-synopsys-ptpx-rtl/.stamp 20-synopsys-ptpx-rtl/inputs/.stamp.adk 20-synopsys-ptpx-rtl/inputs/.stamp.design.namemap 20-synopsys-ptpx-rtl/inputs/.stamp.design.pt.sdc 20-synopsys-ptpx-rtl/inputs/.stamp.design.spef.gz 20-synopsys-ptpx-rtl/inputs/.stamp.design.vcs.v 20-synopsys-ptpx-rtl/inputs/.stamp.run.saif
	$(call 20_synopsys_ptpx_rtl_commands_rule)
	touch $@

20-synopsys-ptpx-rtl/outputs/.execstamp.design.pwr.rpt: 20-synopsys-ptpx-rtl/.execstamp
	touch $@
20-synopsys-ptpx-rtl/outputs/.execstamp.design.pwr.hier.rpt: 20-synopsys-ptpx-rtl/.execstamp
	touch $@
20-synopsys-ptpx-rtl/outputs/.execstamp.design.sw.rpt: 20-synopsys-ptpx-rtl/.execstamp
	touch $@

endif

# collect outputs

20-synopsys-ptpx-rtl/outputs/.stamp.design.pwr.rpt: 20-synopsys-ptpx-rtl/.execstamp 20-synopsys-ptpx-rtl/outputs/.execstamp.design.pwr.hier.rpt 20-synopsys-ptpx-rtl/outputs/.execstamp.design.pwr.rpt 20-synopsys-ptpx-rtl/outputs/.execstamp.design.sw.rpt
	$(call stamp,20-synopsys-ptpx-rtl/outputs/.stamp.design.pwr.rpt)

20-synopsys-ptpx-rtl/outputs/.stamp.design.pwr.hier.rpt: 20-synopsys-ptpx-rtl/.execstamp 20-synopsys-ptpx-rtl/outputs/.execstamp.design.pwr.hier.rpt 20-synopsys-ptpx-rtl/outputs/.execstamp.design.pwr.rpt 20-synopsys-ptpx-rtl/outputs/.execstamp.design.sw.rpt
	$(call stamp,20-synopsys-ptpx-rtl/outputs/.stamp.design.pwr.hier.rpt)

20-synopsys-ptpx-rtl/outputs/.stamp.design.sw.rpt: 20-synopsys-ptpx-rtl/.execstamp 20-synopsys-ptpx-rtl/outputs/.execstamp.design.pwr.hier.rpt 20-synopsys-ptpx-rtl/outputs/.execstamp.design.pwr.rpt 20-synopsys-ptpx-rtl/outputs/.execstamp.design.sw.rpt
	$(call stamp,20-synopsys-ptpx-rtl/outputs/.stamp.design.sw.rpt)

# post-conditions

define 20_synopsys_ptpx_rtl_post_conditions_commands_rule
	cd 20-synopsys-ptpx-rtl && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

20-synopsys-ptpx-rtl/.postconditions.stamp: 20-synopsys-ptpx-rtl/.execstamp 20-synopsys-ptpx-rtl/outputs/.execstamp.design.pwr.hier.rpt 20-synopsys-ptpx-rtl/outputs/.execstamp.design.pwr.rpt 20-synopsys-ptpx-rtl/outputs/.execstamp.design.sw.rpt 20-synopsys-ptpx-rtl/outputs/.stamp.design.pwr.hier.rpt 20-synopsys-ptpx-rtl/outputs/.stamp.design.pwr.rpt 20-synopsys-ptpx-rtl/outputs/.stamp.design.sw.rpt
	$(call 20_synopsys_ptpx_rtl_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: synopsys-ptpx-rtl

synopsys-ptpx-rtl: 20-synopsys-ptpx-rtl/.execstamp 20-synopsys-ptpx-rtl/.postconditions.stamp 20-synopsys-ptpx-rtl/outputs/.execstamp.design.pwr.hier.rpt 20-synopsys-ptpx-rtl/outputs/.execstamp.design.pwr.rpt 20-synopsys-ptpx-rtl/outputs/.execstamp.design.sw.rpt 20-synopsys-ptpx-rtl/outputs/.stamp.design.pwr.hier.rpt 20-synopsys-ptpx-rtl/outputs/.stamp.design.pwr.rpt 20-synopsys-ptpx-rtl/outputs/.stamp.design.sw.rpt

.PHONY: 20

20: 20-synopsys-ptpx-rtl/.execstamp 20-synopsys-ptpx-rtl/.postconditions.stamp 20-synopsys-ptpx-rtl/outputs/.execstamp.design.pwr.hier.rpt 20-synopsys-ptpx-rtl/outputs/.execstamp.design.pwr.rpt 20-synopsys-ptpx-rtl/outputs/.execstamp.design.sw.rpt 20-synopsys-ptpx-rtl/outputs/.stamp.design.pwr.hier.rpt 20-synopsys-ptpx-rtl/outputs/.stamp.design.pwr.rpt 20-synopsys-ptpx-rtl/outputs/.stamp.design.sw.rpt

# debug

# ------------------------------------------------------------------------
# gl-sim
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 21-gl-sim/.prebuilt)","")
21-gl-sim/.stamp: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/.postconditions.stamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v 16-cadence-innovus-signoff/outputs/.stamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.stamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.stamp.design.def.gz 16-cadence-innovus-signoff/outputs/.stamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.stamp.design.lef 16-cadence-innovus-signoff/outputs/.stamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.stamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.stamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.sdf 16-cadence-innovus-signoff/outputs/.stamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.stamp.design.virtuoso.v
21-gl-sim/.stamp: 19-synopsys-pt-timing-signoff/.execstamp 19-synopsys-pt-timing-signoff/.postconditions.stamp 19-synopsys-pt-timing-signoff/outputs/.execstamp.design.sdf 19-synopsys-pt-timing-signoff/outputs/.stamp.design.sdf
21-gl-sim/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
21-gl-sim/.stamp: 4-testbench/.execstamp 4-testbench/.postconditions.stamp 4-testbench/outputs/.execstamp.design.args 4-testbench/outputs/.execstamp.design.args.gls 4-testbench/outputs/.execstamp.test_vectors.txt 4-testbench/outputs/.execstamp.testbench.sv 4-testbench/outputs/.stamp.design.args 4-testbench/outputs/.stamp.design.args.gls 4-testbench/outputs/.stamp.test_vectors.txt 4-testbench/outputs/.stamp.testbench.sv
21-gl-sim/.stamp:
	$(call cpdir-and-parameterize,21-gl-sim,../design/synopsys-vcs-sim,21-gl-sim/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 21-gl-sim/.prebuilt)","")
21-gl-sim/inputs/.stamp.adk: 21-gl-sim/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,21-gl-sim/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 21-gl-sim/.prebuilt)","")
21-gl-sim/inputs/.stamp.design.args: 21-gl-sim/.stamp 4-testbench/outputs/.stamp.design.args.gls
	$(call symlink,21-gl-sim/inputs,design.args,../../4-testbench/outputs/design.args.gls,.stamp.design.args)
endif

ifeq ("$(wildcard 21-gl-sim/.prebuilt)","")
21-gl-sim/inputs/.stamp.design.sdf: 21-gl-sim/.stamp 19-synopsys-pt-timing-signoff/outputs/.stamp.design.sdf
	$(call symlink,21-gl-sim/inputs,design.sdf,../../19-synopsys-pt-timing-signoff/outputs/design.sdf,.stamp.design.sdf)
endif

ifeq ("$(wildcard 21-gl-sim/.prebuilt)","")
21-gl-sim/inputs/.stamp.design.vcs.v: 21-gl-sim/.stamp 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.pg.v
	$(call symlink,21-gl-sim/inputs,design.vcs.v,../../16-cadence-innovus-signoff/outputs/design.vcs.pg.v,.stamp.design.vcs.v)
endif

ifeq ("$(wildcard 21-gl-sim/.prebuilt)","")
21-gl-sim/inputs/.stamp.test_vectors.txt: 21-gl-sim/.stamp 4-testbench/outputs/.stamp.test_vectors.txt
	$(call symlink,21-gl-sim/inputs,test_vectors.txt,../../4-testbench/outputs/test_vectors.txt,.stamp.test_vectors.txt)
endif

ifeq ("$(wildcard 21-gl-sim/.prebuilt)","")
21-gl-sim/inputs/.stamp.testbench.sv: 21-gl-sim/.stamp 4-testbench/outputs/.stamp.testbench.sv
	$(call symlink,21-gl-sim/inputs,testbench.sv,../../4-testbench/outputs/testbench.sv,.stamp.testbench.sv)
endif

# execute

ifeq ("$(wildcard 21-gl-sim/.prebuilt)","")

define 21_gl_sim_commands_rule
	mkdir -p 21-gl-sim/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t gl-sim && chmod +x .mflowgen/21-gl-sim/mflowgen-run && cp -f .mflowgen/21-gl-sim/mflowgen-run 21-gl-sim && if [[ -e .mflowgen/21-gl-sim/mflowgen-debug ]]; then chmod +x .mflowgen/21-gl-sim/mflowgen-debug && cp -f .mflowgen/21-gl-sim/mflowgen-debug 21-gl-sim; fi && if [[ -e .mflowgen/21-gl-sim/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/21-gl-sim/mflowgen-check-preconditions.py && cp -f .mflowgen/21-gl-sim/mflowgen-check-preconditions.py 21-gl-sim; fi && if [[ -e .mflowgen/21-gl-sim/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/21-gl-sim/mflowgen-check-postconditions.py && cp -f .mflowgen/21-gl-sim/mflowgen-check-postconditions.py 21-gl-sim; fi && cd 21-gl-sim && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 21-gl-sim/outputs/*
endef

21-gl-sim/.execstamp: 21-gl-sim/.stamp 21-gl-sim/inputs/.stamp.adk 21-gl-sim/inputs/.stamp.design.args 21-gl-sim/inputs/.stamp.design.sdf 21-gl-sim/inputs/.stamp.design.vcs.v 21-gl-sim/inputs/.stamp.test_vectors.txt 21-gl-sim/inputs/.stamp.testbench.sv
	$(call 21_gl_sim_commands_rule)
	touch $@

21-gl-sim/outputs/.execstamp.design.vpd: 21-gl-sim/.execstamp
	touch $@

endif

# collect outputs

21-gl-sim/outputs/.stamp.design.vpd: 21-gl-sim/.execstamp 21-gl-sim/outputs/.execstamp.design.vpd
	$(call stamp,21-gl-sim/outputs/.stamp.design.vpd)

# post-conditions

define 21_gl_sim_post_conditions_commands_rule
	cd 21-gl-sim && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

21-gl-sim/.postconditions.stamp: 21-gl-sim/.execstamp 21-gl-sim/outputs/.execstamp.design.vpd 21-gl-sim/outputs/.stamp.design.vpd
	$(call 21_gl_sim_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: gl-sim

gl-sim: 21-gl-sim/.execstamp 21-gl-sim/.postconditions.stamp 21-gl-sim/outputs/.execstamp.design.vpd 21-gl-sim/outputs/.stamp.design.vpd

.PHONY: 21

21: 21-gl-sim/.execstamp 21-gl-sim/.postconditions.stamp 21-gl-sim/outputs/.execstamp.design.vpd 21-gl-sim/outputs/.stamp.design.vpd

# debug

# ------------------------------------------------------------------------
# open-magic-drc
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 22-open-magic-drc/.prebuilt)","")
22-open-magic-drc/.stamp: 17-mentor-calibre-gdsmerge/.execstamp 17-mentor-calibre-gdsmerge/.postconditions.stamp 17-mentor-calibre-gdsmerge/outputs/.execstamp.design_merged.gds 17-mentor-calibre-gdsmerge/outputs/.stamp.design_merged.gds
22-open-magic-drc/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
22-open-magic-drc/.stamp:
	$(call cpdir-and-parameterize,22-open-magic-drc,../design/open-magic-drc,22-open-magic-drc/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 22-open-magic-drc/.prebuilt)","")
22-open-magic-drc/inputs/.stamp.adk: 22-open-magic-drc/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,22-open-magic-drc/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 22-open-magic-drc/.prebuilt)","")
22-open-magic-drc/inputs/.stamp.design_merged.gds: 22-open-magic-drc/.stamp 17-mentor-calibre-gdsmerge/outputs/.stamp.design_merged.gds
	$(call symlink,22-open-magic-drc/inputs,design_merged.gds,../../17-mentor-calibre-gdsmerge/outputs/design_merged.gds,.stamp.design_merged.gds)
endif

# execute

ifeq ("$(wildcard 22-open-magic-drc/.prebuilt)","")

define 22_open_magic_drc_commands_rule
	mkdir -p 22-open-magic-drc/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t open-magic-drc && chmod +x .mflowgen/22-open-magic-drc/mflowgen-run && cp -f .mflowgen/22-open-magic-drc/mflowgen-run 22-open-magic-drc && if [[ -e .mflowgen/22-open-magic-drc/mflowgen-debug ]]; then chmod +x .mflowgen/22-open-magic-drc/mflowgen-debug && cp -f .mflowgen/22-open-magic-drc/mflowgen-debug 22-open-magic-drc; fi && if [[ -e .mflowgen/22-open-magic-drc/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/22-open-magic-drc/mflowgen-check-preconditions.py && cp -f .mflowgen/22-open-magic-drc/mflowgen-check-preconditions.py 22-open-magic-drc; fi && if [[ -e .mflowgen/22-open-magic-drc/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/22-open-magic-drc/mflowgen-check-postconditions.py && cp -f .mflowgen/22-open-magic-drc/mflowgen-check-postconditions.py 22-open-magic-drc; fi && cd 22-open-magic-drc && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 22-open-magic-drc/outputs/*
endef

22-open-magic-drc/.execstamp: 22-open-magic-drc/.stamp 22-open-magic-drc/inputs/.stamp.adk 22-open-magic-drc/inputs/.stamp.design_merged.gds
	$(call 22_open_magic_drc_commands_rule)
	touch $@

22-open-magic-drc/outputs/.execstamp.drc_results.log: 22-open-magic-drc/.execstamp
	touch $@

endif

# collect outputs

22-open-magic-drc/outputs/.stamp.drc_results.log: 22-open-magic-drc/.execstamp 22-open-magic-drc/outputs/.execstamp.drc_results.log
	$(call stamp,22-open-magic-drc/outputs/.stamp.drc_results.log)

# post-conditions

define 22_open_magic_drc_post_conditions_commands_rule
	cd 22-open-magic-drc && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

22-open-magic-drc/.postconditions.stamp: 22-open-magic-drc/.execstamp 22-open-magic-drc/outputs/.execstamp.drc_results.log 22-open-magic-drc/outputs/.stamp.drc_results.log
	$(call 22_open_magic_drc_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: open-magic-drc

open-magic-drc: 22-open-magic-drc/.execstamp 22-open-magic-drc/.postconditions.stamp 22-open-magic-drc/outputs/.execstamp.drc_results.log 22-open-magic-drc/outputs/.stamp.drc_results.log

.PHONY: 22

22: 22-open-magic-drc/.execstamp 22-open-magic-drc/.postconditions.stamp 22-open-magic-drc/outputs/.execstamp.drc_results.log 22-open-magic-drc/outputs/.stamp.drc_results.log

# debug

# ------------------------------------------------------------------------
# open-netgen-lvs
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 23-open-netgen-lvs/.prebuilt)","")
23-open-netgen-lvs/.stamp: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/.postconditions.stamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v 16-cadence-innovus-signoff/outputs/.stamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.stamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.stamp.design.def.gz 16-cadence-innovus-signoff/outputs/.stamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.stamp.design.lef 16-cadence-innovus-signoff/outputs/.stamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.stamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.stamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.sdf 16-cadence-innovus-signoff/outputs/.stamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.stamp.design.virtuoso.v
23-open-netgen-lvs/.stamp: 18-open-magic-def2spice/.execstamp 18-open-magic-def2spice/.postconditions.stamp 18-open-magic-def2spice/outputs/.execstamp.design_extracted.spice 18-open-magic-def2spice/outputs/.stamp.design_extracted.spice
23-open-netgen-lvs/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
23-open-netgen-lvs/.stamp:
	$(call cpdir-and-parameterize,23-open-netgen-lvs,../design/open-netgen-lvs,23-open-netgen-lvs/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 23-open-netgen-lvs/.prebuilt)","")
23-open-netgen-lvs/inputs/.stamp.adk: 23-open-netgen-lvs/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,23-open-netgen-lvs/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 23-open-netgen-lvs/.prebuilt)","")
23-open-netgen-lvs/inputs/.stamp.design.lvs.v: 23-open-netgen-lvs/.stamp 16-cadence-innovus-signoff/outputs/.stamp.design.lvs.v
	$(call symlink,23-open-netgen-lvs/inputs,design.lvs.v,../../16-cadence-innovus-signoff/outputs/design.lvs.v,.stamp.design.lvs.v)
endif

ifeq ("$(wildcard 23-open-netgen-lvs/.prebuilt)","")
23-open-netgen-lvs/inputs/.stamp.design_extracted.spice: 23-open-netgen-lvs/.stamp 18-open-magic-def2spice/outputs/.stamp.design_extracted.spice
	$(call symlink,23-open-netgen-lvs/inputs,design_extracted.spice,../../18-open-magic-def2spice/outputs/design_extracted.spice,.stamp.design_extracted.spice)
endif

# execute

ifeq ("$(wildcard 23-open-netgen-lvs/.prebuilt)","")

define 23_open_netgen_lvs_commands_rule
	mkdir -p 23-open-netgen-lvs/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t open-netgen-lvs && chmod +x .mflowgen/23-open-netgen-lvs/mflowgen-run && cp -f .mflowgen/23-open-netgen-lvs/mflowgen-run 23-open-netgen-lvs && if [[ -e .mflowgen/23-open-netgen-lvs/mflowgen-debug ]]; then chmod +x .mflowgen/23-open-netgen-lvs/mflowgen-debug && cp -f .mflowgen/23-open-netgen-lvs/mflowgen-debug 23-open-netgen-lvs; fi && if [[ -e .mflowgen/23-open-netgen-lvs/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/23-open-netgen-lvs/mflowgen-check-preconditions.py && cp -f .mflowgen/23-open-netgen-lvs/mflowgen-check-preconditions.py 23-open-netgen-lvs; fi && if [[ -e .mflowgen/23-open-netgen-lvs/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/23-open-netgen-lvs/mflowgen-check-postconditions.py && cp -f .mflowgen/23-open-netgen-lvs/mflowgen-check-postconditions.py 23-open-netgen-lvs; fi && cd 23-open-netgen-lvs && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 23-open-netgen-lvs/outputs/*
endef

23-open-netgen-lvs/.execstamp: 23-open-netgen-lvs/.stamp 23-open-netgen-lvs/inputs/.stamp.adk 23-open-netgen-lvs/inputs/.stamp.design.lvs.v 23-open-netgen-lvs/inputs/.stamp.design_extracted.spice
	$(call 23_open_netgen_lvs_commands_rule)
	touch $@

23-open-netgen-lvs/outputs/.execstamp.lvs_results.log: 23-open-netgen-lvs/.execstamp
	touch $@

endif

# collect outputs

23-open-netgen-lvs/outputs/.stamp.lvs_results.log: 23-open-netgen-lvs/.execstamp 23-open-netgen-lvs/outputs/.execstamp.lvs_results.log
	$(call stamp,23-open-netgen-lvs/outputs/.stamp.lvs_results.log)

# post-conditions

define 23_open_netgen_lvs_post_conditions_commands_rule
	cd 23-open-netgen-lvs && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

23-open-netgen-lvs/.postconditions.stamp: 23-open-netgen-lvs/.execstamp 23-open-netgen-lvs/outputs/.execstamp.lvs_results.log 23-open-netgen-lvs/outputs/.stamp.lvs_results.log
	$(call 23_open_netgen_lvs_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: open-netgen-lvs

open-netgen-lvs: 23-open-netgen-lvs/.execstamp 23-open-netgen-lvs/.postconditions.stamp 23-open-netgen-lvs/outputs/.execstamp.lvs_results.log 23-open-netgen-lvs/outputs/.stamp.lvs_results.log

.PHONY: 23

23: 23-open-netgen-lvs/.execstamp 23-open-netgen-lvs/.postconditions.stamp 23-open-netgen-lvs/outputs/.execstamp.lvs_results.log 23-open-netgen-lvs/outputs/.stamp.lvs_results.log

# debug

# ------------------------------------------------------------------------
# gen-saif-gl
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 24-gen-saif-gl/.prebuilt)","")
24-gen-saif-gl/.stamp: 21-gl-sim/.execstamp 21-gl-sim/.postconditions.stamp 21-gl-sim/outputs/.execstamp.design.vpd 21-gl-sim/outputs/.stamp.design.vpd
24-gen-saif-gl/.stamp:
	$(call cpdir-and-parameterize,24-gen-saif-gl,../../mflowgen/steps/synopsys-vcd2saif-convert,24-gen-saif-gl/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 24-gen-saif-gl/.prebuilt)","")
24-gen-saif-gl/inputs/.stamp.run.vcd: 24-gen-saif-gl/.stamp 21-gl-sim/outputs/.stamp.design.vpd
	$(call symlink,24-gen-saif-gl/inputs,run.vcd,../../21-gl-sim/outputs/design.vpd,.stamp.run.vcd)
endif

# execute

ifeq ("$(wildcard 24-gen-saif-gl/.prebuilt)","")

define 24_gen_saif_gl_commands_rule
	mkdir -p 24-gen-saif-gl/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t gen-saif-gl && chmod +x .mflowgen/24-gen-saif-gl/mflowgen-run && cp -f .mflowgen/24-gen-saif-gl/mflowgen-run 24-gen-saif-gl && if [[ -e .mflowgen/24-gen-saif-gl/mflowgen-debug ]]; then chmod +x .mflowgen/24-gen-saif-gl/mflowgen-debug && cp -f .mflowgen/24-gen-saif-gl/mflowgen-debug 24-gen-saif-gl; fi && if [[ -e .mflowgen/24-gen-saif-gl/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/24-gen-saif-gl/mflowgen-check-preconditions.py && cp -f .mflowgen/24-gen-saif-gl/mflowgen-check-preconditions.py 24-gen-saif-gl; fi && if [[ -e .mflowgen/24-gen-saif-gl/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/24-gen-saif-gl/mflowgen-check-postconditions.py && cp -f .mflowgen/24-gen-saif-gl/mflowgen-check-postconditions.py 24-gen-saif-gl; fi && cd 24-gen-saif-gl && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 24-gen-saif-gl/outputs/*
endef

24-gen-saif-gl/.execstamp: 24-gen-saif-gl/.stamp 24-gen-saif-gl/inputs/.stamp.run.vcd
	$(call 24_gen_saif_gl_commands_rule)
	touch $@

24-gen-saif-gl/outputs/.execstamp.run.saif: 24-gen-saif-gl/.execstamp
	touch $@

endif

# collect outputs

24-gen-saif-gl/outputs/.stamp.run.saif: 24-gen-saif-gl/.execstamp 24-gen-saif-gl/outputs/.execstamp.run.saif
	$(call stamp,24-gen-saif-gl/outputs/.stamp.run.saif)

# post-conditions

define 24_gen_saif_gl_post_conditions_commands_rule
	cd 24-gen-saif-gl && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

24-gen-saif-gl/.postconditions.stamp: 24-gen-saif-gl/.execstamp 24-gen-saif-gl/outputs/.execstamp.run.saif 24-gen-saif-gl/outputs/.stamp.run.saif
	$(call 24_gen_saif_gl_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: gen-saif-gl

gen-saif-gl: 24-gen-saif-gl/.execstamp 24-gen-saif-gl/.postconditions.stamp 24-gen-saif-gl/outputs/.execstamp.run.saif 24-gen-saif-gl/outputs/.stamp.run.saif

.PHONY: 24

24: 24-gen-saif-gl/.execstamp 24-gen-saif-gl/.postconditions.stamp 24-gen-saif-gl/outputs/.execstamp.run.saif 24-gen-saif-gl/outputs/.stamp.run.saif

# debug

# ------------------------------------------------------------------------
# synopsys-ptpx-gl
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 25-synopsys-ptpx-gl/.prebuilt)","")
25-synopsys-ptpx-gl/.stamp: 16-cadence-innovus-signoff/.execstamp 16-cadence-innovus-signoff/.postconditions.stamp 16-cadence-innovus-signoff/outputs/.execstamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.execstamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.execstamp.design.def.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.lef 16-cadence-innovus-signoff/outputs/.execstamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.execstamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.sdf 16-cadence-innovus-signoff/outputs/.execstamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.execstamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.execstamp.design.virtuoso.v 16-cadence-innovus-signoff/outputs/.stamp.design-merged.gds 16-cadence-innovus-signoff/outputs/.stamp.design.checkpoint 16-cadence-innovus-signoff/outputs/.stamp.design.def.gz 16-cadence-innovus-signoff/outputs/.stamp.design.gds.gz 16-cadence-innovus-signoff/outputs/.stamp.design.lef 16-cadence-innovus-signoff/outputs/.stamp.design.lvs.v 16-cadence-innovus-signoff/outputs/.stamp.design.pt.sdc 16-cadence-innovus-signoff/outputs/.stamp.design.rcbest.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.sdf 16-cadence-innovus-signoff/outputs/.stamp.design.spef.gz 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.pg.v 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.v 16-cadence-innovus-signoff/outputs/.stamp.design.virtuoso.v
25-synopsys-ptpx-gl/.stamp: 24-gen-saif-gl/.execstamp 24-gen-saif-gl/.postconditions.stamp 24-gen-saif-gl/outputs/.execstamp.run.saif 24-gen-saif-gl/outputs/.stamp.run.saif
25-synopsys-ptpx-gl/.stamp: 3-skywater-130nm/.execstamp 3-skywater-130nm/.postconditions.stamp 3-skywater-130nm/outputs/.execstamp.adk 3-skywater-130nm/outputs/.stamp.adk
25-synopsys-ptpx-gl/.stamp:
	$(call cpdir-and-parameterize,25-synopsys-ptpx-gl,../../mflowgen/steps/synopsys-ptpx-gl,25-synopsys-ptpx-gl/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 25-synopsys-ptpx-gl/.prebuilt)","")
25-synopsys-ptpx-gl/inputs/.stamp.adk: 25-synopsys-ptpx-gl/.stamp 3-skywater-130nm/outputs/.stamp.adk
	$(call symlink,25-synopsys-ptpx-gl/inputs,adk,../../3-skywater-130nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 25-synopsys-ptpx-gl/.prebuilt)","")
25-synopsys-ptpx-gl/inputs/.stamp.design.pt.sdc: 25-synopsys-ptpx-gl/.stamp 16-cadence-innovus-signoff/outputs/.stamp.design.pt.sdc
	$(call symlink,25-synopsys-ptpx-gl/inputs,design.pt.sdc,../../16-cadence-innovus-signoff/outputs/design.pt.sdc,.stamp.design.pt.sdc)
endif

ifeq ("$(wildcard 25-synopsys-ptpx-gl/.prebuilt)","")
25-synopsys-ptpx-gl/inputs/.stamp.design.spef.gz: 25-synopsys-ptpx-gl/.stamp 16-cadence-innovus-signoff/outputs/.stamp.design.spef.gz
	$(call symlink,25-synopsys-ptpx-gl/inputs,design.spef.gz,../../16-cadence-innovus-signoff/outputs/design.spef.gz,.stamp.design.spef.gz)
endif

ifeq ("$(wildcard 25-synopsys-ptpx-gl/.prebuilt)","")
25-synopsys-ptpx-gl/inputs/.stamp.design.vcs.v: 25-synopsys-ptpx-gl/.stamp 16-cadence-innovus-signoff/outputs/.stamp.design.vcs.v
	$(call symlink,25-synopsys-ptpx-gl/inputs,design.vcs.v,../../16-cadence-innovus-signoff/outputs/design.vcs.v,.stamp.design.vcs.v)
endif

ifeq ("$(wildcard 25-synopsys-ptpx-gl/.prebuilt)","")
25-synopsys-ptpx-gl/inputs/.stamp.run.saif: 25-synopsys-ptpx-gl/.stamp 24-gen-saif-gl/outputs/.stamp.run.saif
	$(call symlink,25-synopsys-ptpx-gl/inputs,run.saif,../../24-gen-saif-gl/outputs/run.saif,.stamp.run.saif)
endif

# execute

ifeq ("$(wildcard 25-synopsys-ptpx-gl/.prebuilt)","")

define 25_synopsys_ptpx_gl_commands_rule
	mkdir -p 25-synopsys-ptpx-gl/outputs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t synopsys-ptpx-gl && chmod +x .mflowgen/25-synopsys-ptpx-gl/mflowgen-run && cp -f .mflowgen/25-synopsys-ptpx-gl/mflowgen-run 25-synopsys-ptpx-gl && if [[ -e .mflowgen/25-synopsys-ptpx-gl/mflowgen-debug ]]; then chmod +x .mflowgen/25-synopsys-ptpx-gl/mflowgen-debug && cp -f .mflowgen/25-synopsys-ptpx-gl/mflowgen-debug 25-synopsys-ptpx-gl; fi && if [[ -e .mflowgen/25-synopsys-ptpx-gl/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/25-synopsys-ptpx-gl/mflowgen-check-preconditions.py && cp -f .mflowgen/25-synopsys-ptpx-gl/mflowgen-check-preconditions.py 25-synopsys-ptpx-gl; fi && if [[ -e .mflowgen/25-synopsys-ptpx-gl/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/25-synopsys-ptpx-gl/mflowgen-check-postconditions.py && cp -f .mflowgen/25-synopsys-ptpx-gl/mflowgen-check-postconditions.py 25-synopsys-ptpx-gl; fi && cd 25-synopsys-ptpx-gl && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 25-synopsys-ptpx-gl/outputs/*
endef

25-synopsys-ptpx-gl/.execstamp: 25-synopsys-ptpx-gl/.stamp 25-synopsys-ptpx-gl/inputs/.stamp.adk 25-synopsys-ptpx-gl/inputs/.stamp.design.pt.sdc 25-synopsys-ptpx-gl/inputs/.stamp.design.spef.gz 25-synopsys-ptpx-gl/inputs/.stamp.design.vcs.v 25-synopsys-ptpx-gl/inputs/.stamp.run.saif
	$(call 25_synopsys_ptpx_gl_commands_rule)

25-synopsys-ptpx-gl/.execstamp.execute-phony: 25-synopsys-ptpx-gl/.execstamp
	touch $@

endif

# collect outputs

# post-conditions

define 25_synopsys_ptpx_gl_post_conditions_commands_rule
	cd 25-synopsys-ptpx-gl && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

25-synopsys-ptpx-gl/.postconditions.stamp: 25-synopsys-ptpx-gl/.execstamp 25-synopsys-ptpx-gl/.execstamp.execute-phony
	$(call 25_synopsys_ptpx_gl_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: synopsys-ptpx-gl

synopsys-ptpx-gl: 25-synopsys-ptpx-gl/.execstamp 25-synopsys-ptpx-gl/.execstamp.execute-phony 25-synopsys-ptpx-gl/.postconditions.stamp

.PHONY: 25

25: 25-synopsys-ptpx-gl/.execstamp 25-synopsys-ptpx-gl/.execstamp.execute-phony 25-synopsys-ptpx-gl/.postconditions.stamp

# debug

# ------------------------------------------------------------------------
# Misc
# ------------------------------------------------------------------------

# Clean

.PHONY: clean-all

clean-all:
	@find . -maxdepth 1 ! -name Makefile ! -name .mflowgen\* ! -name \. ! -name \.\. -exec rm -rf {} +

.PHONY: clean-0

clean-0:
	rm -rf ./0-constraints

.PHONY: clean-constraints

clean-constraints: clean-0

.PHONY: clean-1

clean-1:
	rm -rf ./1-info

.PHONY: clean-info

clean-info: clean-1

.PHONY: clean-10

clean-10:
	rm -rf ./10-cadence-innovus-power

.PHONY: clean-cadence-innovus-power

clean-cadence-innovus-power: clean-10

.PHONY: clean-11

clean-11:
	rm -rf ./11-cadence-innovus-place

.PHONY: clean-cadence-innovus-place

clean-cadence-innovus-place: clean-11

.PHONY: clean-12

clean-12:
	rm -rf ./12-cadence-innovus-cts

.PHONY: clean-cadence-innovus-cts

clean-cadence-innovus-cts: clean-12

.PHONY: clean-13

clean-13:
	rm -rf ./13-cadence-innovus-postcts_hold

.PHONY: clean-cadence-innovus-postcts_hold

clean-cadence-innovus-postcts_hold: clean-13

.PHONY: clean-14

clean-14:
	rm -rf ./14-cadence-innovus-route

.PHONY: clean-cadence-innovus-route

clean-cadence-innovus-route: clean-14

.PHONY: clean-15

clean-15:
	rm -rf ./15-cadence-innovus-postroute

.PHONY: clean-cadence-innovus-postroute

clean-cadence-innovus-postroute: clean-15

.PHONY: clean-16

clean-16:
	rm -rf ./16-cadence-innovus-signoff

.PHONY: clean-cadence-innovus-signoff

clean-cadence-innovus-signoff: clean-16

.PHONY: clean-17

clean-17:
	rm -rf ./17-mentor-calibre-gdsmerge

.PHONY: clean-mentor-calibre-gdsmerge

clean-mentor-calibre-gdsmerge: clean-17

.PHONY: clean-18

clean-18:
	rm -rf ./18-open-magic-def2spice

.PHONY: clean-open-magic-def2spice

clean-open-magic-def2spice: clean-18

.PHONY: clean-19

clean-19:
	rm -rf ./19-synopsys-pt-timing-signoff

.PHONY: clean-synopsys-pt-timing-signoff

clean-synopsys-pt-timing-signoff: clean-19

.PHONY: clean-2

clean-2:
	rm -rf ./2-rtl

.PHONY: clean-rtl

clean-rtl: clean-2

.PHONY: clean-20

clean-20:
	rm -rf ./20-synopsys-ptpx-rtl

.PHONY: clean-synopsys-ptpx-rtl

clean-synopsys-ptpx-rtl: clean-20

.PHONY: clean-21

clean-21:
	rm -rf ./21-gl-sim

.PHONY: clean-gl-sim

clean-gl-sim: clean-21

.PHONY: clean-22

clean-22:
	rm -rf ./22-open-magic-drc

.PHONY: clean-open-magic-drc

clean-open-magic-drc: clean-22

.PHONY: clean-23

clean-23:
	rm -rf ./23-open-netgen-lvs

.PHONY: clean-open-netgen-lvs

clean-open-netgen-lvs: clean-23

.PHONY: clean-24

clean-24:
	rm -rf ./24-gen-saif-gl

.PHONY: clean-gen-saif-gl

clean-gen-saif-gl: clean-24

.PHONY: clean-25

clean-25:
	rm -rf ./25-synopsys-ptpx-gl

.PHONY: clean-synopsys-ptpx-gl

clean-synopsys-ptpx-gl: clean-25

.PHONY: clean-3

clean-3:
	rm -rf ./3-skywater-130nm

.PHONY: clean-skywater-130nm

clean-skywater-130nm: clean-3

.PHONY: clean-4

clean-4:
	rm -rf ./4-testbench

.PHONY: clean-testbench

clean-testbench: clean-4

.PHONY: clean-5

clean-5:
	rm -rf ./5-rtl-sim

.PHONY: clean-rtl-sim

clean-rtl-sim: clean-5

.PHONY: clean-6

clean-6:
	rm -rf ./6-gen-saif-rtl

.PHONY: clean-gen-saif-rtl

clean-gen-saif-rtl: clean-6

.PHONY: clean-7

clean-7:
	rm -rf ./7-synopsys-dc-synthesis

.PHONY: clean-synopsys-dc-synthesis

clean-synopsys-dc-synthesis: clean-7

.PHONY: clean-8

clean-8:
	rm -rf ./8-cadence-innovus-flowsetup

.PHONY: clean-cadence-innovus-flowsetup

clean-cadence-innovus-flowsetup: clean-8

.PHONY: clean-9

clean-9:
	rm -rf ./9-cadence-innovus-init

.PHONY: clean-cadence-innovus-init

clean-cadence-innovus-init: clean-9

# Diff

.PHONY: diff-0

diff-0:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../design/constraints 0-constraints | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../design/constraints.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 0-constraints.*' && echo || true

.PHONY: diff-1

diff-1:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/info 1-info | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/info.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 1-info.*' && echo || true

.PHONY: diff-2

diff-2:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../design/rtl 2-rtl | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../design/rtl.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 2-rtl.*' && echo || true

.PHONY: diff-3

diff-3:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../../../../afs/ir.stanford.edu/class/ee272/skywater-130nm-adk 3-skywater-130nm | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../../../../afs/ir.stanford.edu/class/ee272/skywater-130nm-adk.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 3-skywater-130nm.*' && echo || true

.PHONY: diff-4

diff-4:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../design/testbench 4-testbench | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../design/testbench.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 4-testbench.*' && echo || true

.PHONY: diff-5

diff-5:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../design/synopsys-vcs-sim 5-rtl-sim | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../design/synopsys-vcs-sim.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 5-rtl-sim.*' && echo || true

.PHONY: diff-6

diff-6:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/synopsys-vcd2saif-convert 6-gen-saif-rtl | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/synopsys-vcd2saif-convert.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 6-gen-saif-rtl.*' && echo || true

.PHONY: diff-7

diff-7:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/synopsys-dc-synthesis 7-synopsys-dc-synthesis | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/synopsys-dc-synthesis.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 7-synopsys-dc-synthesis.*' && echo || true

.PHONY: diff-8

diff-8:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/cadence-innovus-flowsetup 8-cadence-innovus-flowsetup | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/cadence-innovus-flowsetup.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 8-cadence-innovus-flowsetup.*' && echo || true

.PHONY: diff-9

diff-9:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/cadence-innovus-init 9-cadence-innovus-init | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/cadence-innovus-init.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 9-cadence-innovus-init.*' && echo || true

.PHONY: diff-10

diff-10:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../design/cadence-innovus-power 10-cadence-innovus-power | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../design/cadence-innovus-power.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 10-cadence-innovus-power.*' && echo || true

.PHONY: diff-11

diff-11:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/cadence-innovus-place 11-cadence-innovus-place | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/cadence-innovus-place.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 11-cadence-innovus-place.*' && echo || true

.PHONY: diff-12

diff-12:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/cadence-innovus-cts 12-cadence-innovus-cts | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/cadence-innovus-cts.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 12-cadence-innovus-cts.*' && echo || true

.PHONY: diff-13

diff-13:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/cadence-innovus-postcts_hold 13-cadence-innovus-postcts_hold | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/cadence-innovus-postcts_hold.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 13-cadence-innovus-postcts_hold.*' && echo || true

.PHONY: diff-14

diff-14:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/cadence-innovus-route 14-cadence-innovus-route | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/cadence-innovus-route.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 14-cadence-innovus-route.*' && echo || true

.PHONY: diff-15

diff-15:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/cadence-innovus-postroute 15-cadence-innovus-postroute | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/cadence-innovus-postroute.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 15-cadence-innovus-postroute.*' && echo || true

.PHONY: diff-16

diff-16:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../design/cadence-innovus-signoff 16-cadence-innovus-signoff | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../design/cadence-innovus-signoff.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 16-cadence-innovus-signoff.*' && echo || true

.PHONY: diff-17

diff-17:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/mentor-calibre-gdsmerge 17-mentor-calibre-gdsmerge | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/mentor-calibre-gdsmerge.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 17-mentor-calibre-gdsmerge.*' && echo || true

.PHONY: diff-18

diff-18:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../design/open-magic-def2spice 18-open-magic-def2spice | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../design/open-magic-def2spice.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 18-open-magic-def2spice.*' && echo || true

.PHONY: diff-19

diff-19:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/synopsys-pt-timing-signoff 19-synopsys-pt-timing-signoff | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/synopsys-pt-timing-signoff.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 19-synopsys-pt-timing-signoff.*' && echo || true

.PHONY: diff-20

diff-20:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../design/synopsys-ptpx-rtl 20-synopsys-ptpx-rtl | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../design/synopsys-ptpx-rtl.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 20-synopsys-ptpx-rtl.*' && echo || true

.PHONY: diff-21

diff-21:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../design/synopsys-vcs-sim 21-gl-sim | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../design/synopsys-vcs-sim.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 21-gl-sim.*' && echo || true

.PHONY: diff-22

diff-22:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../design/open-magic-drc 22-open-magic-drc | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../design/open-magic-drc.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 22-open-magic-drc.*' && echo || true

.PHONY: diff-23

diff-23:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../design/open-netgen-lvs 23-open-netgen-lvs | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../design/open-netgen-lvs.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 23-open-netgen-lvs.*' && echo || true

.PHONY: diff-24

diff-24:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/synopsys-vcd2saif-convert 24-gen-saif-gl | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/synopsys-vcd2saif-convert.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 24-gen-saif-gl.*' && echo || true

.PHONY: diff-25

diff-25:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../mflowgen/steps/synopsys-ptpx-gl 25-synopsys-ptpx-gl | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../mflowgen/steps/synopsys-ptpx-gl.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 25-synopsys-ptpx-gl.*' && echo || true

# Info

.PHONY: info-0

info-0:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t constraints && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/0-constraints/configure.yml

.PHONY: info-1

info-1:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t info && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/1-info/configure.yml

.PHONY: info-2

info-2:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t rtl && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/2-rtl/configure.yml

.PHONY: info-3

info-3:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t skywater-130nm && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/3-skywater-130nm/configure.yml

.PHONY: info-4

info-4:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t testbench && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/4-testbench/configure.yml

.PHONY: info-5

info-5:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t rtl-sim && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/5-rtl-sim/configure.yml

.PHONY: info-6

info-6:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t gen-saif-rtl && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/6-gen-saif-rtl/configure.yml

.PHONY: info-7

info-7:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t synopsys-dc-synthesis && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/7-synopsys-dc-synthesis/configure.yml

.PHONY: info-8

info-8:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-flowsetup && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/8-cadence-innovus-flowsetup/configure.yml

.PHONY: info-9

info-9:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-init && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/9-cadence-innovus-init/configure.yml

.PHONY: info-10

info-10:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-power && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/10-cadence-innovus-power/configure.yml

.PHONY: info-11

info-11:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-place && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/11-cadence-innovus-place/configure.yml

.PHONY: info-12

info-12:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-cts && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/12-cadence-innovus-cts/configure.yml

.PHONY: info-13

info-13:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-postcts_hold && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/13-cadence-innovus-postcts_hold/configure.yml

.PHONY: info-14

info-14:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-route && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/14-cadence-innovus-route/configure.yml

.PHONY: info-15

info-15:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-postroute && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/15-cadence-innovus-postroute/configure.yml

.PHONY: info-16

info-16:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t cadence-innovus-signoff && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/16-cadence-innovus-signoff/configure.yml

.PHONY: info-17

info-17:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t mentor-calibre-gdsmerge && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/17-mentor-calibre-gdsmerge/configure.yml

.PHONY: info-18

info-18:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t open-magic-def2spice && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/18-open-magic-def2spice/configure.yml

.PHONY: info-19

info-19:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t synopsys-pt-timing-signoff && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/19-synopsys-pt-timing-signoff/configure.yml

.PHONY: info-20

info-20:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t synopsys-ptpx-rtl && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/20-synopsys-ptpx-rtl/configure.yml

.PHONY: info-21

info-21:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t gl-sim && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/21-gl-sim/configure.yml

.PHONY: info-22

info-22:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t open-magic-drc && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/22-open-magic-drc/configure.yml

.PHONY: info-23

info-23:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t open-netgen-lvs && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/23-open-netgen-lvs/configure.yml

.PHONY: info-24

info-24:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t gen-saif-gl && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/24-gen-saif-gl/configure.yml

.PHONY: info-25

info-25:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-letters -c -t synopsys-ptpx-gl && /home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/25-synopsys-ptpx-gl/configure.yml

# Runtimes

.PHONY: runtimes

runtimes:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-runtimes

# List

.PHONY: list

list:
	@echo && echo Generic Targets: && echo && printf " - %s\\n" "list      -- List all steps" "status    -- Print build status for each step" "runtimes  -- Print runtimes for each step" "graph     -- Generate a PDF of the step dependency graph" "clean-all -- Remove all build directories" "clean-N   -- Clean target N" "info-N    -- Print configured info for step N" "diff-N    -- Diff target N" && echo && echo Targets: && echo && printf " - %s\\n" "  0 : constraints" "  1 : info" "  2 : rtl" "  3 : skywater-130nm" "  4 : testbench" "  5 : rtl-sim" "  6 : gen-saif-rtl" "  7 : synopsys-dc-synthesis" "  8 : cadence-innovus-flowsetup" "  9 : cadence-innovus-init" " 10 : cadence-innovus-power" " 11 : cadence-innovus-place" " 12 : cadence-innovus-cts" " 13 : cadence-innovus-postcts_hold" " 14 : cadence-innovus-route" " 15 : cadence-innovus-postroute" " 16 : cadence-innovus-signoff" " 17 : mentor-calibre-gdsmerge" " 18 : open-magic-def2spice" " 19 : synopsys-pt-timing-signoff" " 20 : synopsys-ptpx-rtl" " 21 : gl-sim" " 22 : open-magic-drc" " 23 : open-netgen-lvs" " 24 : gen-saif-gl" " 25 : synopsys-ptpx-gl" && echo && echo Debug Targets: && echo && printf " - %s\\n" "debug-7  : debug-synopsys-dc-synthesis" "debug-9  : debug-cadence-innovus-init" "debug-10 : debug-cadence-innovus-power" "debug-11 : debug-cadence-innovus-place" "debug-12 : debug-cadence-innovus-cts" "debug-13 : debug-cadence-innovus-postcts_hold" "debug-14 : debug-cadence-innovus-route" "debug-15 : debug-cadence-innovus-postroute" "debug-16 : debug-cadence-innovus-signoff" "debug-17 : debug-mentor-calibre-gdsmerge" && echo

# Graph

.PHONY: graph

graph:
	dot -Tpdf .mflowgen/graph.dot > graph.pdf

# Status

.PHONY: status

status:
	@/home/users/krzanich/mflowgen/mflowgen/scripts/mflowgen-status --backend make -s 0-constraints,1-info,2-rtl,3-skywater-130nm,4-testbench,5-rtl-sim,6-gen-saif-rtl,7-synopsys-dc-synthesis,8-cadence-innovus-flowsetup,9-cadence-innovus-init,10-cadence-innovus-power,11-cadence-innovus-place,12-cadence-innovus-cts,13-cadence-innovus-postcts_hold,14-cadence-innovus-route,15-cadence-innovus-postroute,16-cadence-innovus-signoff,17-mentor-calibre-gdsmerge,18-open-magic-def2spice,19-synopsys-pt-timing-signoff,20-synopsys-ptpx-rtl,21-gl-sim,22-open-magic-drc,23-open-netgen-lvs,24-gen-saif-gl,25-synopsys-ptpx-gl

