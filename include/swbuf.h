/******************************************************************************
*  swbuf.h  - code for SWBuf used as a transport and utility for data buffers
*
* $Id: swbuf.h,v 1.8 2003/02/27 23:34:22 mgruner Exp $
*
* Copyright 2003 CrossWire Bible Society (http://www.crosswire.org)
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

#ifndef SWBUF_H
#define SWBUF_H

#include <defs.h>
#include <stdlib.h>

SWORD_NAMESPACE_START


#define JUNKBUFSIZE 8191

/**
* This class is used as a transport and utility for data buffers.
*/
class SWDLLEXPORT SWBuf {
	char *buf;
	char *end;
	char fillByte;
	unsigned int allocSize;
	static char *nullStr;
	static char junkBuf[JUNKBUFSIZE];

	inline void assureSize(unsigned int newsize) {
		if (newsize > allocSize) {
			allocSize = newsize + 5;
			end = (char *)(end - buf);
			buf = (char *)realloc(buf, allocSize);
			end = (buf + (unsigned int)end);
		}
	}
	void init();

public:
	/******************************************************************************
	* SWBuf Constructor - Creates an empty SWBuf object or an SWBuf initialized
 	* 		to a value from a const char *
 	*
 	*/
  SWBuf(const char *initVal = 0);

	SWBuf(char initVal);
	SWBuf(const SWBuf &other);

	inline void setFillByte(char ch) { fillByte = ch; }
	inline char getFillByte() { return fillByte; }

  /******************************************************************************
	* SWBuf Destructor - Cleans up instance of SWBuf
 	*/
	virtual ~SWBuf();

	/**
	* @return a pointer to the buffer content (null-terminated string)
	*/
	inline const char *c_str() const{	return buf;	}

	/**
	*
	*/
	inline char &charAt(unsigned int pos) { return ((pos <= (unsigned int)(end - buf)) ? buf[pos] : nullStr[0]); }

	/** 
	* size() and length() return only the number of characters of the string.
	* Add one for the following null and one for each char to be appended!
	*/
	inline unsigned int size() const { return length(); }

	/**
	* size() and length() return only the number of characters of the string.
	* Add one for the following null and one for each char to be appended!
	*/
	inline unsigned int length() const { return end - buf; }

	/******************************************************************************
 	* SWBuf::set - sets this buf to a new value
 	*/
	void set(const char *newVal);

	/******************************************************************************
 	* SWBuf::set - sets this buf to a new value
 	*/
	void set(const SWBuf &newVal);

	/******************************************************************************
 	* SWBuf::setSize - Size this buffer to a specific length
 	*/
	void setSize(unsigned int len);

	/******************************************************************************
 	* SWBuf::append - appends a value to the current value of this SWBuf
 	*/
	void append(const char *str);

	/******************************************************************************
 	* SWBuf::append - appends a value to the current value of this SWBuf
 	*/
	void append(const SWBuf &str);

	/******************************************************************************
 	* SWBuf::append - appends a value to the current value of this SWBuf
 	*/
	inline void append(char ch) {
		assureSize((end-buf) + 2);
		*end = ch;
		end++;
		*end = 0;
	}

	/******************************************************************************
 	* SWBuf::appendFormatted - appends formatted strings to the current value of this SWBuf
	* WARNING: This function can only write at most
	* JUNKBUFSIZE to the string per call.
 	*/
	void appendFormatted(const char *format, ...);
	
	inline char *getRawData() { return buf; }	// be careful!  Probably setSize needs to be called in conjunction before and maybe after

	inline operator const char *() const { return c_str(); }
	inline char &operator[](unsigned int pos) { return charAt(pos); }
	inline char &operator[](int pos) { return charAt((unsigned int)pos); }
	inline SWBuf &operator =(const char *newVal) { set(newVal); return *this; }
	inline SWBuf &operator =(const SWBuf &other) { set(other); return *this; }
	inline SWBuf &operator +=(const char *str) { append(str); return *this; }
	inline SWBuf &operator +=(char ch) { append(ch); return *this; }
	inline SWBuf &operator -=(unsigned int len) { setSize(length()-len); return *this; }
	inline SWBuf &operator --(int) { operator -=(1); return *this; }
	inline SWBuf operator +(const SWBuf &other) const {
		SWBuf retVal = buf;
		retVal += other;
		return retVal;
	}
	inline SWBuf operator +(char ch) const { return (*this) + SWBuf(ch); }
};



SWORD_NAMESPACE_END
#endif
