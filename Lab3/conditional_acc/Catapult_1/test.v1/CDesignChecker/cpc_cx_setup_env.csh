#! /bin/csh -f
setenv SYSTEMC_HOME /vol/mentor/Catapult_Synthesis_10.4a/Mgc_home/shared
setenv SYSTEMC_LIB_DIR /vol/mentor/Catapult_Synthesis_10.4a/Mgc_home/shared/lib
setenv CXX_FLAGS "-g -DCALYPTO_SKIP_SYSTEMC_VERSION_CHECK"
setenv LD_FLAGS "-lpthread"
setenv OSSIM ddd
setenv PATH /vol/mentor/Catapult_Synthesis_10.4a/Mgc_home/bin:$PATH
