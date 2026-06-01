**************************************************************************
* Federal University of Pernambuco - PIMES UFPE
* Research: The Impacts of Uncertainty on Economic Activity Across Brazilian States
* Researcher: Paulo Francisco da Silva Junior
* Advisor: Marcelo Eduardo Alves da Silva, PhD.
**************************************************************************

* Clean any data
clear all

* Set the path
cd"..\Figures\Stata Graph\IIE\IBCR"

* Obtain the IRF
irf set "impulses_IBCR_IIE.irf"

**************************************************************
*********************** IBCR - IEE ***************************
**************************************************************

**************************************************************
* BA - IIE - IBCR
irf table coirf, irf(BA_IIE_IBCR) impulse(IIE) response(IBCRBA) step(24) noci
irf table oirf, irf(BA_IIE_IBCR) impulse(IIE) response(IBCRBA) step(24) noci

**************************************************************
* CE - IIE - IBCR
irf table coirf, irf(CE_IIE_IBCR) impulse(IIE) response(IBCRCE) step(24) noci
irf table oirf, irf(CE_IIE_IBCR) impulse(IIE) response(IBCRCE) step(24) noci

**************************************************************
* ES - IIE - IBCR
irf table coirf, irf(ES_IIE_IBCR) impulse(IIE) response(IBCRES) step(24) noci
irf table oirf, irf(ES_IIE_IBCR) impulse(IIE) response(IBCRES) step(24) noci

**************************************************************
* GO - IIE - IBCR
irf table coirf, irf(GO_IIE_IBCR) impulse(IIE) response(IBCRGO) step(24) noci
irf table oirf, irf(GO_IIE_IBCR) impulse(IIE) response(IBCRGO) step(24) noci

**************************************************************
* MG - IIE - IBCR
irf table coirf, irf(MG_IIE_IBCR) impulse(IIE) response(IBCRMG) step(24) noci
irf table oirf, irf(MG_IIE_IBCR) impulse(IIE) response(IBCRMG) step(24) noci

**************************************************************
* PA - IIE - IBCR
irf table coirf, irf(PA_IIE_IBCR) impulse(IIE) response(IBCRPA) step(24) noci
irf table oirf, irf(PA_IIE_IBCR) impulse(IIE) response(IBCRPA) step(24) noci

**************************************************************
* PR - IIE - IBCR
irf table coirf, irf(PR_IIE_IBCR) impulse(IIE) response(IBCRPR) step(24) noci
irf table oirf, irf(PR_IIE_IBCR) impulse(IIE) response(IBCRPR) step(24) noci

**************************************************************
* PE - IIE - IBCR
irf table coirf, irf(PE_IIE_IBCR) impulse(IIE) response(IBCRPE) step(24) noci
irf table oirf, irf(PE_IIE_IBCR) impulse(IIE) response(IBCRPE) step(24) noci

**************************************************************
* RJ - IIE - IBCR
irf table coirf, irf(RJ_IIE_IBCR) impulse(IIE) response(IBCRRJ) step(24) noci
irf table oirf, irf(RJ_IIE_IBCR) impulse(IIE) response(IBCRRJ) step(24) noci

**************************************************************
* RS - IIE - IBCR
irf table coirf, irf(RS_IIE_IBCR) impulse(IIE) response(IBCRRS) step(24) noci
irf table oirf, irf(RS_IIE_IBCR) impulse(IIE) response(IBCRRS) step(24) noci

**************************************************************
* SC - IIE - IBCR
irf table coirf, irf(SC_IIE_IBCR) impulse(IIE) response(IBCRSC) step(24) noci
irf table oirf, irf(SC_IIE_IBCR) impulse(IIE) response(IBCRSC) step(24) noci

**************************************************************
* SP - IIE - IBCR
irf table coirf, irf(SP_IIE_IBCR) impulse(IIE) response(IBCRSP) step(24) noci
irf table oirf, irf(SP_IIE_IBCR) impulse(IIE) response(IBCRSP) step(24) noci
