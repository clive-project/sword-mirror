
#include <utilxml.h>
#include <ctype.h>
#include <utilstr.h>

SWORD_NAMESPACE_START

void XMLTag::parse() const {
	int i;
	int start;
	char *name = 0;
	char *value = 0;
	for (i = 0; ((buf[i]) && (!isalpha(buf[i]))); i++);
	for (; buf[i]; i++) {
		if (buf[i] == ' ') {
			for (; ((buf[i]) && (!isalpha(buf[i]))); i++) {
				if (buf[i] == '/')
					empty = true;
			}
			if (buf[i]) {		// we have an attribute name
				start = i;
				for (; ((buf[i]) && (!strchr(" =", buf[i]))); i++);
				if (i-start) {
					if (name)
						delete [] name;
					name = new char [ (i-start) + 1 ];
					strncpy(name, buf+start, i-start);
					name[i-start] = 0;
				}
				for (; ((buf[i]) && (strchr(" =\"", buf[i]))); i++);
				if (buf[i]) {	// we have attribute value
					start = i;
					for (; ((buf[i]) && (buf[i] != '\"')); i++);
					if (i-start) {
						if (value)
							delete [] value;
						value = new char [ (i-start) + 1 ];
						strncpy(value, buf+start, i-start);
						value[i-start] = 0;
						attributes[name] = value;
					}
				}
			}
		}
		if (!buf[i])
			break;
	}
	parsed = true;
	if (name) delete [] name;
	if (value) delete [] value;
}


XMLTag::XMLTag(const char *tagString) {

	name   = 0;
	buf    = 0;
	setText(tagString);
}

void XMLTag::setText(const char *tagString) {
	parsed = false;
	empty  = false;
	endTag = false;

	if (buf) {
		delete [] buf;
		buf = 0;
	}

	if (!tagString)		// assert tagString before proceeding
		return;

	stdstr(&buf, tagString);

	int start = 0;
	int i;

	// skip beginning silliness
	for (i = 0; ((tagString[i]) && (!isalpha(tagString[i]))); i++) {
		if (tagString[i] == '/')
			endTag = true;
	}
	start = i;
	for (; ((tagString[i]) && (!strchr(" />", tagString[i]))); i++);
	if (i-start) {
		if (name)
			delete [] name;
		name = new char [ (i-start) + 1 ];
		strncpy(name, tagString+start, i-start);
		name[i-start] = 0;
		if (tagString[i] == '/')
			empty = true;
	}
}

XMLTag::~XMLTag() {
	if (buf)
		delete [] buf;
	if (name)
		delete [] name;
}

const ListString XMLTag::getAttributeNames() const {
	ListString retVal;

	if (!parsed)
		parse();

	for (MapStringPair::iterator it = attributes.begin(); it != attributes.end(); it++)
		retVal.push_back(it->first.c_str());

	return retVal;
}


const char *XMLTag::getPart(const char *buf, int partNum, char partSplit) const {
	for (; (buf && partNum); partNum--) {
		buf = strchr(buf, partSplit);
		if (buf)
			buf++;
	}
	if (buf) {
		const char *end = strchr(buf, partSplit);
		junkBuf = buf;
		if (end)
			junkBuf.setSize(end - buf);
		return junkBuf.c_str();
	}
	return 0;
}


int XMLTag::getAttributePartCount(const char *attribName, char partSplit) const {
	int count;
	const char *buf = getAttribute(attribName);
	for (count = 0; buf; count++) {
		buf = strchr(buf, partSplit);
		if (buf)
			buf++;
	}
	return count;
}


const char *XMLTag::getAttribute(const char *attribName, int partNum, char partSplit) const {
	if (!parsed)
		parse();

	MapStringPair::iterator it = attributes.find(attribName);
	const char *retVal = (it == attributes.end()) ? 0 : it->second.c_str();
	if ((retVal) && (partNum > -1))
		retVal = getPart(retVal, partNum, partSplit);

	return retVal;
}


const char *XMLTag::setAttribute(const char *attribName, const char *attribValue) {
	if (!parsed)
		parse();
	if (attribValue)
		attributes[attribName] = attribValue;
	else	attributes.erase(attribName);
	return attribValue;
}

const char *XMLTag::toString() const {
	SWBuf tag = "<";
	if (!parsed)
		parse();

	if (isEndTag())
		tag += "/";

	tag += getName();
	for (MapStringPair::iterator it = attributes.begin(); it != attributes.end(); it++) {
		tag.appendFormatted(" %s=\"%s\"", it->first.c_str(), it->second.c_str());
	}

	if (isEmpty())
		tag += "/";

	tag += ">";


	if (buf)
		delete [] buf;
	buf = new char [ tag.length() + 1 ];
	strcpy(buf, tag.c_str());

	return buf;
}


SWORD_NAMESPACE_END
