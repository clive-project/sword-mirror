/******************************************************************************
 *  rawld.cpp - code for class 'RawLD'- a module that reads raw lexicon and
 *				dictionary files: *.dat *.idx
 *
 * $Id: rawld.h,v 1.9 2001/10/24 19:38:02 chrislit Exp $
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

#ifndef RAWLD_H
#define RAWLD_H

#include <rawstr.h>
#include <swld.h>

#include <defs.h>

class SWDLLEXPORT RawLD:public RawStr, public SWLD
{
  void strongsPad (char *buf);
  char getEntry (long away = 0);

public:
  
    
    RawLD (const char *ipath, const char *iname = 0, const char *idesc =
	   0, SWDisplay * idisp = 0, char encoding = ENC_UNKNOWN, char dir = DIRECTION_LTR, char markup = FMT_UNKNOWN);
    virtual ~ RawLD ();
  virtual char *getRawEntry ();

  virtual SWModule & operator = (SW_POSITION pos);
  virtual SWModule & operator += (int increment);
  virtual SWModule & operator -= (int decrement)
  {
    return this->operator += (-decrement);
  }
  // write interface ----------------------------
  virtual bool isWritable ()
  {
    return true;
  }
  static char createModule (const char *path)
  {
    return RawStr::createModule (path);
  }
  virtual SWModule & operator << (const char *inbuf);	// Modify current module entry
  virtual SWModule & operator << (const SWKey * linkKey);	// Link current module entry to other module entry
  virtual void deleteEntry ();	// Delete current module entry
  // end write interface ------------------------
};


#endif
