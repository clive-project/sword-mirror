/******************************************************************************
 *  swdisp.h  - code for base class 'swdisp'.  swdisp is the basis for all
 *		types of displays (e.g. raw textout, curses, xwindow, etc.)
 *
 * $Id: swdisp.h,v 1.6 2002/05/25 15:03:14 scribe Exp $
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

#ifndef SWDISP_H
#define SWDISP_H

#include <swobject.h>
#include <defs.h>

class SWModule;

/** swdisp is the basis for all types of displays
* (e.g. raw textout, curses, xwindow, etc.)
*/
class SWDLLEXPORT SWDisplay : public SWObject {
  static SWClass classdef;
public:
  SWDisplay () {};
  /** casts a module to a character pointer and displays it to
  * raw output (overriden for different display types and
  * module types if necessary)
  *
  * @param imodule module to display
  * @return error status
  */
  virtual char Display (SWModule & imodule);
};
#endif
