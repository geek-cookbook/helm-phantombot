# Use this for local testing only - note: this does not build the docker image

CHART := .
CHARTNAME := phantombot
APPVERSION := $(shell git describe)

OUTPUTNAME := $(CHARTNAME)-$(CHARTVERSION).tgz
OUTPUTDIR := dest

all: lint test package

clean:
	rm -rf dest/

package: $(OUTPUTDIR)/$(OUTPUTNAME)

$(OUTPUTDIR)/:
	mkdir -p $@

$(OUTPUTDIR)/$(OUTPUTNAME): $(CHART) $(OUTPUTDIR)/
	helm package $< --app-version $(APPVERSION) --destination $(word 2, $^)

lint: $(CHART) ../../.ci/lint-config.yaml
	ct lint --lint-conf $(word 2, $^) --charts $<

test: $(CHART) ../../.ci/ct-config.yaml
	ct install --config $(word 2, $^) --charts $<
