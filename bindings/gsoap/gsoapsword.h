#ifndef GSOAPAPI_H
#define GSOAPAPI_H

typedef long xsd__int;
typedef char * xsd__string;

//-----------------------------------------------------------------
// stringlist_iterator methods

//int sword__stringlist_iterator_next(xsd__int hsli char **);
//int sword__stringlist_iterator_val(xsd__int hsli, char **);


//-----------------------------------------------------------------
// modmap methods
//
int sword__ModList_iterator_next(xsd__int hmmi, xsd__int &noop);
int sword__ModList_iterator_val(xsd__int hmmi, xsd__int &hmodule);


//-----------------------------------------------------------------
// SWMgr methods
//
int sword__SWMgr_new(xsd__int &retVal);
// SWConfig *, SWConfig *, bool, SWFilterMgr *
//xsd__int sword__SWMgr_newEx(xsd__int hiconfig, xsd__int hisysconfig, char autoload, xsd__int hfilterMgr);
int sword__SWMgr_delete(xsd__int hmgr, xsd__int &noop);
//xsd__int sword__SWMgr_getConfig(xsd__int hmgr);
int sword__SWMgr_getModulesIterator(xsd__int hmgr, xsd__int &hmodIterator);
int sword__SWMgr_getModuleByName(xsd__int hmgr, xsd__string name, xsd__int &hmodule);
//char *   sword__SWMgr_getPrefixPath(xsd__int hmgr);
//char *   sword__SWMgr_getConfigPath(xsd__int hmgr);
//void     sword__SWMgr_setGlobalOption(xsd__int hmgr, char *option, char *value);
//char *   sword__SWMgr_getGlobalOption(xsd__int hmgr, char *option);
//char *   sword__SWMgr_getGlobalOptionTip(xsd__int hmgr, char *option);
// ret: forward_iterator
//xsd__int sword__SWMgr_getGlobalOptionsIterator(xsd__int hmgr);
// ret: forward_iterator
//xsd__int sword__SWMgr_getGlobalOptionValuesIterator(xsd__int hmgr, char *option);
//void     sword__SWMgr_setCipherKey(xsd__int hmgr, char *modName, char *key);


//-----------------------------------------------------------------
// SWModule methods

//void  sword__SWModule_terminateSearch(xsd__int hmodule);
//char  sword__SWModule_error(xsd__int hmodule);
//int   sword__SWModule_getEntrySize(xsd__int hmodule);
//void  sword__SWModule_setKeyText(xsd__int hmodule, char *key);
//char *sword__SWModule_getKeyText(xsd__int hmodule);
int sword__SWModule_getName(xsd__int hmodule, char **name);
int sword__SWModule_getDescription(xsd__int hmodule, char **description);
//char *sword__SWModule_getType(xsd__int hmodule);
//void  sword__SWModule_previous(xsd__int hmodule);
//void  sword__SWModule_next(xsd__int hmodule);
//void  sword__SWModule_begin(xsd__int hmodule);
//char *sword__SWModule_getStripText(xsd__int hmodule);
//char *sword__SWModule_getRenderText(xsd__int hmodule);

#endif
