/******************************************************************************
 *
 * $Id: thmlrtf.h,v 1.11 2003/08/12 05:36:30 scribe Exp $
 *
 * Copyright 1998 CrossWire Bible Society (http://www.crosswire.org)
 *	CrossWire Bible Society
 *	P. O. Box 2528
 *	Tempe, AZ  85280-2528
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation version 2.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 */

#ifndef THMLRTF_H
#define THMLRTF_H

#include <swbasicfilter.h>

SWORD_NAMESPACE_START

/** this filter converts ThML text to RTF text
 */
class SWDLLEXPORT ThMLRTF : public SWBasicFilter {
protected:
	class MyUserData : public BasicFilterUserData {
	public:
		MyUserData(const SWModule *module, const SWKey *key) : BasicFilterUserData(module, key) {}
		bool sechead;
	};
	virtual BasicFilterUserData *createUserData(const SWModule *module, const SWKey *key) {
		return new MyUserData(module, key);
	}
	virtual bool handleToken(SWBuf &buf, const char *token, BasicFilterUserData *userData);
	virtual char processText(SWBuf &text, const SWKey *key = 0, const SWModule *module = 0);
public:
	ThMLRTF();
};

SWORD_NAMESPACE_END
#endif
