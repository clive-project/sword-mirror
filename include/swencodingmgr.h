/******************************************************************************
 *  swencodingmgr.h   - definition of class SWEncodingMgr, subclass of
 *                        used to transcode all module text to a requested
 *                        markup.
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

#ifndef SWENCODINGMGR_H
#define SWENCODINGMGR_H

#include <swmgr.h>

class SWDLLEXPORT SWEncodingMgr : public SWMgr
{
protected:
        SWFilter *latin1utf8;
        SWFilter *scsuutf8;
        SWFilter *targetenc;


	/*
	 * current encoding value
	 */        
        char encoding;

public:
	/** Constructor of SWEncodingMgr.
	 *
	 * @param iconfig
	 * @param isysconfig
	 * @param autoload If this bool is true the constructor starts loading the installed modules. If you reimplemented SWMgr you can set autoload=false to load the modules with your own reimplemented function.
	 * @param encoding The desired encoding.
	 */
        SWEncodingMgr (SWConfig * iconfig = 0, SWConfig * isysconfig = 0, bool autoload = true, char encoding = ENC_UTF8);

	/**
	 * The destructor of SWEncodingMgr.
	 */
        ~SWEncodingMgr();

	/** Markup sets/gets the encoding after initialization
	 * 
	 * @param m The new encoding or ENC_UNKNOWN if you just want to get the current markup.
	 * @return The current (possibly changed) encoding format.
	 */
        char Encoding(char enc);

	/**
	 * Adds the raw filters which are defined in "section" to the SWModule object "module".
	 * @param module To this module the raw filter(s) are added
	 * @param section We use this section to get a list of filters we should apply to the module
	 */
        virtual void AddRawFilters(SWModule *module, ConfigEntMap &section);

	/**
	 * Adds the encoding filters which are defined in "section" to the SWModule object "module".
	 * @param module To this module the encoding filter(s) are added
	 * @param section We use this section to get a list of filters we should apply to the module
	 */
        virtual void AddEncodingFilters(SWModule *module, ConfigEntMap &section);
};
#endif
