#include <stdio.h>
#include <rawtext.h>
#include <swmgr.h>

int main(int argc, char **argv)
{
	SWMgr manager;
	SWModule *target;
	ListKey listkey;
	VerseKey vk;
	ModMap::iterator it;

	manager.setGlobalOption("Strong's Numbers", "On");

	if ((argc != 3) && (argc != 5)) {
		fprintf(stderr, "usage: %s <modname> <\"search string\"> [\"min\" \"max\"]\n", argv[0]);
		exit(-1);
	}

	it = manager.Modules.find(argv[1]);
	if (it == manager.Modules.end()) {
		fprintf(stderr, "Could not find module [%s].  Available modules:\n", argv[1]);
		for (it = manager.Modules.begin(); it != manager.Modules.end(); it++) {
			fprintf(stderr, "[%s]\t - %s\n", (*it).second->Name(), (*it).second->Description());
		}
		exit(-1);
	}

	target = (*it).second;

	if (argc == 5) {			// if min / max specified
		vk.LowerBound(argv[3]);
		vk.UpperBound(argv[4]);
		vk.Persist(1);
		target->SetKey(vk);
	}

//	for (listkey = target->Search(argv[2]);!listkey.Error();listkey++)
	listkey = target->Search(argv[2]);
	while (!listkey.Error()) {
		cout << (const char *)listkey << "\n";
		listkey++;
	}
}
