.PHONY: all clean


CWD = $(shell pwd)
THIRDPARTY = $(shell cd ../thirdparty && pwd)
THIRDPARTYSOURCE = $(shell cd ../thirdparty-sources && pwd)
STAGING = $(CWD)/staging
KIBANA = kibana-6.6.1-linux-x86_64
KIBANA_TAR = $(KIBANA).tar.gz


CD = cd
CP = cp -pdr
RM = rm -f -r
MD = mkdir
TAR = tar -xf
MV = mv


all: clean
	$(MD) $(STAGING)
	$(CD) $(STAGING) && $(MD) bin tmp
	$(CP) $(THIRDPARTYSOURCE)/sources/$(KIBANA_TAR) $(STAGING)/tmp/
	$(CD) $(STAGING)/tmp/ && $(TAR) $(KIBANA_TAR)
	$(MV) $(STAGING)/tmp/$(KIBANA)/* $(STAGING)/
	$(CP) $(CWD)/bin/* $(STAGING)/bin/
	$(CP) $(CWD)/etc/kibana.yml $(STAGING)/config/
	$(RM) $(STAGING)/tmp/


clean:
	$(RM) $(STAGING)
