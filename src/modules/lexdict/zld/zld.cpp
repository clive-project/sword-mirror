/******************************************************************************
 *  rawld.cpp - code for class 'RawLD'- a module that reads raw lexicon and
 *				dictionary files: *.dat *.idx
 */


#include <ctype.h>
#include <stdio.h>
#include <fcntl.h>

#ifndef __GNUC__
#include <io.h>
#else
#include <unistd.h>
#endif

#include <string.h>
#include <utilfuns.h>
#include <zstr.h>
#include <zld.h>


 /******************************************************************************
 * RawLD Constructor - Initializes data for instance of RawLD
 *
 * ENT:	ipath	- path and filename of files (no extension)
 *		iname	- Internal name for module
 *		idesc	- Name to display to user for module
 *		idisp	- Display object to use for displaying
 */

zLD::zLD(const char *ipath, const char *iname, const char *idesc, long blockCount, SWCompress *icomp, SWDisplay *idisp, SWTextEncoding enc, SWTextDirection dir, SWTextMarkup mark, const char* ilang) : zStr(ipath, -1, blockCount, icomp), SWLD(iname, idesc, idisp, enc, dir, mark, ilang)
{
}


/******************************************************************************
 * RawLD Destructor - Cleans up instance of RawLD
 */

zLD::~zLD()
{
}


/******************************************************************************
 * zLD::strongsPad	- Pads a key if it is 100% digits to 5 places
 *
 * ENT: buf -	buffer to check and pad
 */

void zLD::strongsPad(char *buf)
{
	const char *check;
	long size = 0;
	int len = strlen(buf);
	if ((len < 5) && (len > 0)) {
		for (check = buf; *check; check++) {
			if (!isdigit(*check))
				break;
			else size++;
		}

		if ((size == len) && size) 
			sprintf(buf, "%.5d", atoi(buf));
	}
}


/******************************************************************************
 * zLD::getEntry	- Looks up entry from data file.  'Snaps' to closest
 *				entry and sets 'entrybuf'.
 *
 * ENT: away - number of entries offset from key (default = 0)
 *
 * RET: error status
 */

char zLD::getEntry(long away)
{
	char *idxbuf = 0;
	char *ebuf = 0;
	char retval = 0;
	long index;
	unsigned long size;
	char *buf = new char [ strlen(*key) + 6 ];
	strcpy(buf, *key);

	strongsPad(buf);

	*entrybuf = 0;
	if (!(retval = findKeyIndex(buf, &index, away))) {
		getText(index, &idxbuf, &ebuf);
		size = strlen(ebuf) + 1;
		entrybuf = new char [ size * FILTERPAD ];
		strcpy(entrybuf, ebuf);

		entrySize = size;        // support getEntrySize call
		if (!key->Persist())			// If we have our own key
			*key = idxbuf;				// reset it to entry index buffer

		stdstr(&entkeytxt, idxbuf);	// set entry key text that module 'snapped' to.
		free(idxbuf);
		free(ebuf);
	}
	else {
		entrybuf = new char [ 5 ];
		entrybuf[0] = 0;
		entrybuf[1] = 0;
	}
		
	delete [] buf;
	return retval;
}


/******************************************************************************
 * zLD::operator char *	- Returns the correct entry when char * cast
 *							is requested
 *
 * RET: string buffer with entry
 */

char *zLD::getRawEntry() {
	if (!getEntry() && !isUnicode()) {
		prepText(entrybuf);
	}

	return entrybuf;
}


/******************************************************************************
 * zLD::operator +=	- Increments module key a number of entries
 *
 * ENT:	increment	- Number of entries to jump forward
 *
 * RET: *this
 */

SWModule &zLD::operator +=(int increment)
{
	char tmperror;

	if (key->Traversable()) {
		*key += increment;
		error = key->Error();
		increment = 0;
	}
	
	tmperror = (getEntry(increment)) ? KEYERR_OUTOFBOUNDS : 0;
	error = (error)?error:tmperror;
	*key = entkeytxt;
	return *this;
}


/******************************************************************************
 * zLD::operator =(SW_POSITION)	- Positions this key if applicable
 */

SWModule &zLD::operator =(SW_POSITION p)
{
	if (!key->Traversable()) {
		switch (p) {
		case POS_TOP:
			*key = "";
			break;
		case POS_BOTTOM:
			*key = "zzzzzzzzz";
			break;
		} 
	}
	else	*key = p;
	return *this;
}


SWModule &zLD::setentry(const char *inbuf, long len) {
	setText(*key, inbuf, len);

	return *this;
}

SWModule &zLD::operator <<(const char *inbuf) {
	return setentry(inbuf, 0);
}


SWModule &zLD::operator <<(const SWKey *inkey) {
	linkEntry(*key, *inkey);

	return *this;
}


/******************************************************************************
 * RawFiles::deleteEntry	- deletes this entry
 *
 * RET: *this
 */

void zLD::deleteEntry() {
	setText(*key, "");
}
