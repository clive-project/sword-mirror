/*
 *
 * osisrtf.h
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

#ifndef OSISRTF_H
#define OSISRTF_H

#include <swbasicfilter.h>

#include <defs.h>
#include <string>

using std::string;

SWORD_NAMESPACE_START

  /** this filter converts OSIS text to RTF text
  */
class SWDLLEXPORT OSISRTF:public SWBasicFilter
{
private:
  string tagData;
  string::size_type pos1;
  string::size_type pos2;

protected:
  virtual bool handleToken(char **buf, const char *token, DualStringMap &userData);
public:
  OSISRTF ();
};

SWORD_NAMESPACE_END
#endif
