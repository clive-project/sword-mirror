# This file was automatically generated by SWIG
package Sword;
require Exporter;
require DynaLoader;
@ISA = qw(Exporter DynaLoader);
package Swordc;
bootstrap Sword;
package Sword;
@EXPORT = qw( );

# ---------- BASE METHODS -------------

package Sword;

sub TIEHASH {
    my ($classname,$obj) = @_;
    return bless $obj, $classname;
}

sub CLEAR { }

sub FIRSTKEY { }

sub NEXTKEY { }

sub this {
    my $ptr = shift;
    return tied(%$ptr);
}


# ------- FUNCTION WRAPPERS --------

package Sword;


############# Class : Sword::SWConfig ##############

package Sword::SWConfig;
@ISA = qw( Sword );
%OWNER = ();
%BLESSEDMEMBERS = (
    filename => 'Sword::SWBuf',
);

%ITERATORS = ();
*swig_filename_get = *Swordc::SWConfig_filename_get;
*swig_filename_set = *Swordc::SWConfig_filename_set;
*swig_Sections_get = *Swordc::SWConfig_Sections_get;
*swig_Sections_set = *Swordc::SWConfig_Sections_set;
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_SWConfig(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::SWConfig", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_SWConfig($self);
        delete $OWNER{$self};
    }
}

*Load = *Swordc::SWConfig_Load;
*Save = *Swordc::SWConfig_Save;
*set = *Swordc::SWConfig_set;
*get = *Swordc::SWConfig_get;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };

sub FETCH {
    my ($self,$field) = @_;
    my $member_func = "swig_${field}_get";
    my $val = $self->$member_func();
    if (exists $BLESSEDMEMBERS{$field}) {
        return undef if (!defined($val));
        my %retval;
        tie %retval,$BLESSEDMEMBERS{$field},$val;
        return bless \%retval, $BLESSEDMEMBERS{$field};
    }
    return $val;
}

sub STORE {
    my ($self,$field,$newval) = @_;
    my $member_func = "swig_${field}_set";
    if (exists $BLESSEDMEMBERS{$field}) {
        $self->$member_func(tied(%{$newval}));
    } else {
        $self->$member_func($newval);
    }
}


############# Class : Sword::SWMgr ##############

package Sword::SWMgr;
@ISA = qw( Sword );
%OWNER = ();
%BLESSEDMEMBERS = (
    config => 'Sword::SWConfig',
    sysconfig => 'Sword::SWConfig',
);

%ITERATORS = ();
*findConfig = *Swordc::SWMgr_findConfig;
*swig_config_get = *Swordc::SWMgr_config_get;
*swig_config_set = *Swordc::SWMgr_config_set;
*swig_sysconfig_get = *Swordc::SWMgr_sysconfig_get;
*swig_sysconfig_set = *Swordc::SWMgr_sysconfig_set;
*swig_Modules_get = *Swordc::SWMgr_Modules_get;
*swig_Modules_set = *Swordc::SWMgr_Modules_set;
*swig_prefixPath_get = *Swordc::SWMgr_prefixPath_get;
*swig_prefixPath_set = *Swordc::SWMgr_prefixPath_set;
*swig_configPath_get = *Swordc::SWMgr_configPath_get;
*swig_configPath_set = *Swordc::SWMgr_configPath_set;
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_SWMgr(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::SWMgr", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_SWMgr($self);
        delete $OWNER{$self};
    }
}

*Load = *Swordc::SWMgr_Load;
*setGlobalOption = *Swordc::SWMgr_setGlobalOption;
*getGlobalOption = *Swordc::SWMgr_getGlobalOption;
*getGlobalOptionTip = *Swordc::SWMgr_getGlobalOptionTip;
*getGlobalOptions = *Swordc::SWMgr_getGlobalOptions;
*getGlobalOptionValues = *Swordc::SWMgr_getGlobalOptionValues;
*setCipherKey = *Swordc::SWMgr_setCipherKey;
sub getModule {
    my @args = @_;
    my $result = Swordc::SWMgr_getModule(@args);
    return undef if (!defined($result));
    my %resulthash;
    tie %resulthash, ref($result), $result;
    return bless \%resulthash, ref($result);
}
*InstallScan = *Swordc::SWMgr_InstallScan;
*moduleCount = *Swordc::SWMgr_moduleCount;
sub getModuleAt {
    my @args = @_;
    my $result = Swordc::SWMgr_getModuleAt(@args);
    return undef if (!defined($result));
    my %resulthash;
    tie %resulthash, ref($result), $result;
    return bless \%resulthash, ref($result);
}
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };

sub FETCH {
    my ($self,$field) = @_;
    my $member_func = "swig_${field}_get";
    my $val = $self->$member_func();
    if (exists $BLESSEDMEMBERS{$field}) {
        return undef if (!defined($val));
        my %retval;
        tie %retval,$BLESSEDMEMBERS{$field},$val;
        return bless \%retval, $BLESSEDMEMBERS{$field};
    }
    return $val;
}

sub STORE {
    my ($self,$field,$newval) = @_;
    my $member_func = "swig_${field}_set";
    if (exists $BLESSEDMEMBERS{$field}) {
        $self->$member_func(tied(%{$newval}));
    } else {
        $self->$member_func($newval);
    }
}


############# Class : Sword::SWModule ##############

package Sword::SWModule;
@ISA = qw( Sword );
%OWNER = ();
%BLESSEDMEMBERS = (
);

%ITERATORS = ();
*swig_terminateSearch_get = *Swordc::SWModule_terminateSearch_get;
*swig_terminateSearch_set = *Swordc::SWModule_terminateSearch_set;
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_SWModule(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::SWModule", $self;
    return bless \%retval, $pkg;
}

*Error = *Swordc::SWModule_Error;
*isUnicode = *Swordc::SWModule_isUnicode;
*getConfig = *Swordc::SWModule_getConfig;
*getConfigEntry = *Swordc::SWModule_getConfigEntry;
*SetKey = *Swordc::SWModule_SetKey;
sub Key {
    my @args = @_;
    my $result = Swordc::SWModule_Key(@args);
    return undef if (!defined($result));
    my %resulthash;
    tie %resulthash, ref($result), $result;
    return bless \%resulthash, ref($result);
}
sub CreateKey {
    my @args = @_;
    my $result = Swordc::SWModule_CreateKey(@args);
    return undef if (!defined($result));
    my %resulthash;
    tie %resulthash, ref($result), $result;
    return bless \%resulthash, ref($result);
}
*KeyText = *Swordc::SWModule_KeyText;
*Display = *Swordc::SWModule_Display;
*nullPercent = *Swordc::SWModule_nullPercent;
sub Search {
    my @args = @_;
    my $result = Swordc::SWModule_Search(@args);
    return undef if (!defined($result));
    my %resulthash;
    tie %resulthash, ref($result), $result;
    return bless \%resulthash, ref($result);
}
*createSearchFramework = *Swordc::SWModule_createSearchFramework;
*hasSearchFramework = *Swordc::SWModule_hasSearchFramework;
*isSearchOptimallySupported = *Swordc::SWModule_isSearchOptimallySupported;
*next = *Swordc::SWModule_next;
*prev = *Swordc::SWModule_prev;
*inc = *Swordc::SWModule_inc;
*dec = *Swordc::SWModule_dec;
*setPosition = *Swordc::SWModule_setPosition;
*top = *Swordc::SWModule_top;
*bottom = *Swordc::SWModule_bottom;
*text = *Swordc::SWModule_text;
*StripText = *Swordc::SWModule_StripText;
*getRawEntry = *Swordc::SWModule_getRawEntry;
*setSkipConsecutiveLinks = *Swordc::SWModule_setSkipConsecutiveLinks;
*getSkipConsecutiveLinks = *Swordc::SWModule_getSkipConsecutiveLinks;
*getEntryAttributes = *Swordc::SWModule_getEntryAttributes;
*processEntryAttributes = *Swordc::SWModule_processEntryAttributes;
*isProcessEntryAttributes = *Swordc::SWModule_isProcessEntryAttributes;
*Name = *Swordc::SWModule_Name;
*Description = *Swordc::SWModule_Description;
*Type = *Swordc::SWModule_Type;
*Direction = *Swordc::SWModule_Direction;
*Encoding = *Swordc::SWModule_Encoding;
*Markup = *Swordc::SWModule_Markup;
*Lang = *Swordc::SWModule_Lang;
*isWritable = *Swordc::SWModule_isWritable;
*createModule = *Swordc::SWModule_createModule;
*setEntry = *Swordc::SWModule_setEntry;
*deleteEntry = *Swordc::SWModule_deleteEntry;
*write = *Swordc::SWModule_write;
*writeLink = *Swordc::SWModule_writeLink;
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_SWModule($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };

sub FETCH {
    my ($self,$field) = @_;
    my $member_func = "swig_${field}_get";
    my $val = $self->$member_func();
    if (exists $BLESSEDMEMBERS{$field}) {
        return undef if (!defined($val));
        my %retval;
        tie %retval,$BLESSEDMEMBERS{$field},$val;
        return bless \%retval, $BLESSEDMEMBERS{$field};
    }
    return $val;
}

sub STORE {
    my ($self,$field,$newval) = @_;
    my $member_func = "swig_${field}_set";
    if (exists $BLESSEDMEMBERS{$field}) {
        $self->$member_func(tied(%{$newval}));
    } else {
        $self->$member_func($newval);
    }
}


############# Class : Sword::SW_POSITION ##############

package Sword::SW_POSITION;
@ISA = qw( Sword );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_SW_POSITION(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::SW_POSITION", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_SW_POSITION($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::SWKey ##############

package Sword::SWKey;
@ISA = qw( Sword );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_SWKey(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::SWKey", $self;
    return bless \%retval, $pkg;
}

sub clone {
    my @args = @_;
    my $result = Swordc::SWKey_clone(@args);
    return undef if (!defined($result));
    my %resulthash;
    tie %resulthash, ref($result), $result;
    return bless \%resulthash, ref($result);
}
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_SWKey($self);
        delete $OWNER{$self};
    }
}

*Persist = *Swordc::SWKey_Persist;
*setPersist = *Swordc::SWKey_setPersist;
*Error = *Swordc::SWKey_Error;
*setText = *Swordc::SWKey_setText;
*getText = *Swordc::SWKey_getText;
*getShortText = *Swordc::SWKey_getShortText;
*compare = *Swordc::SWKey_compare;
*equals = *Swordc::SWKey_equals;
*decrement = *Swordc::SWKey_decrement;
*increment = *Swordc::SWKey_increment;
*Traversable = *Swordc::SWKey_Traversable;
*Index = *Swordc::SWKey_Index;
*next = *Swordc::SWKey_next;
*prev = *Swordc::SWKey_prev;
*setKey = *Swordc::SWKey_setKey;
sub toVerseKey {
    my @args = @_;
    my $result = Swordc::SWKey_toVerseKey(@args);
    return undef if (!defined($result));
    my %resulthash;
    tie %resulthash, ref($result), $result;
    return bless \%resulthash, ref($result);
}
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::VerseKey ##############

package Sword::VerseKey;
@ISA = qw( Sword Sword::SWKey );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_VerseKey(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::VerseKey", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_VerseKey($self);
        delete $OWNER{$self};
    }
}

sub clone {
    my @args = @_;
    my $result = Swordc::VerseKey_clone(@args);
    return undef if (!defined($result));
    my %resulthash;
    tie %resulthash, ref($result), $result;
    return bless \%resulthash, ref($result);
}
sub LowerBound {
    my @args = @_;
    my $result = Swordc::VerseKey_LowerBound(@args);
    return undef if (!defined($result));
    my %resulthash;
    tie %resulthash, ref($result), $result;
    return bless \%resulthash, ref($result);
}
sub UpperBound {
    my @args = @_;
    my $result = Swordc::VerseKey_UpperBound(@args);
    return undef if (!defined($result));
    my %resulthash;
    tie %resulthash, ref($result), $result;
    return bless \%resulthash, ref($result);
}
*ClearBounds = *Swordc::VerseKey_ClearBounds;
sub ParseVerseList {
    my @args = @_;
    my $result = Swordc::VerseKey_ParseVerseList(@args);
    return undef if (!defined($result));
    $Sword::ListKey::OWNER{$result} = 1; 
    my %resulthash;
    tie %resulthash, ref($result), $result;
    return bless \%resulthash, ref($result);
}
*setText = *Swordc::VerseKey_setText;
*getText = *Swordc::VerseKey_getText;
*getRangeText = *Swordc::VerseKey_getRangeText;
*getShortText = *Swordc::VerseKey_getShortText;
*Traversable = *Swordc::VerseKey_Traversable;
*decrement = *Swordc::VerseKey_decrement;
*increment = *Swordc::VerseKey_increment;
*getBookName = *Swordc::VerseKey_getBookName;
*getBookAbbrev = *Swordc::VerseKey_getBookAbbrev;
*Testament = *Swordc::VerseKey_Testament;
*Book = *Swordc::VerseKey_Book;
*Chapter = *Swordc::VerseKey_Chapter;
*Verse = *Swordc::VerseKey_Verse;
*Normalize = *Swordc::VerseKey_Normalize;
*AutoNormalize = *Swordc::VerseKey_AutoNormalize;
*Headings = *Swordc::VerseKey_Headings;
*getOSISRef = *Swordc::VerseKey_getOSISRef;
*compare = *Swordc::VerseKey_compare;
*_compare = *Swordc::VerseKey__compare;
*setLocale = *Swordc::VerseKey_setLocale;
*getLocale = *Swordc::VerseKey_getLocale;
*bookCount = *Swordc::VerseKey_bookCount;
*bookName = *Swordc::VerseKey_bookName;
*chapterCount = *Swordc::VerseKey_chapterCount;
*verseCount = *Swordc::VerseKey_verseCount;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::ListKey ##############

package Sword::ListKey;
@ISA = qw( Sword Sword::SWKey );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_ListKey(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::ListKey", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_ListKey($self);
        delete $OWNER{$self};
    }
}

sub clone {
    my @args = @_;
    my $result = Swordc::ListKey_clone(@args);
    return undef if (!defined($result));
    my %resulthash;
    tie %resulthash, ref($result), $result;
    return bless \%resulthash, ref($result);
}
*ClearList = *Swordc::ListKey_ClearList;
*Count = *Swordc::ListKey_Count;
*Remove = *Swordc::ListKey_Remove;
*SetToElement = *Swordc::ListKey_SetToElement;
sub GetElement {
    my @args = @_;
    my $result = Swordc::ListKey_GetElement(@args);
    return undef if (!defined($result));
    my %resulthash;
    tie %resulthash, ref($result), $result;
    return bless \%resulthash, ref($result);
}
*add = *Swordc::ListKey_add;
*copyFrom = *Swordc::ListKey_copyFrom;
*setPosition = *Swordc::ListKey_setPosition;
*decrement = *Swordc::ListKey_decrement;
*increment = *Swordc::ListKey_increment;
*Traversable = *Swordc::ListKey_Traversable;
*Index = *Swordc::ListKey_Index;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::TreeKey ##############

package Sword::TreeKey;
@ISA = qw( Sword Sword::SWKey );
%OWNER = ();
*getLocalName = *Swordc::TreeKey_getLocalName;
*setLocalName = *Swordc::TreeKey_setLocalName;
*getUserData = *Swordc::TreeKey_getUserData;
*setUserData = *Swordc::TreeKey_setUserData;
*getFullName = *Swordc::TreeKey_getFullName;
*root = *Swordc::TreeKey_root;
*parent = *Swordc::TreeKey_parent;
*firstChild = *Swordc::TreeKey_firstChild;
*nextSibling = *Swordc::TreeKey_nextSibling;
*previousSibling = *Swordc::TreeKey_previousSibling;
*hasChildren = *Swordc::TreeKey_hasChildren;
*append = *Swordc::TreeKey_append;
*appendChild = *Swordc::TreeKey_appendChild;
*insertBefore = *Swordc::TreeKey_insertBefore;
*remove = *Swordc::TreeKey_remove;
*setOffset = *Swordc::TreeKey_setOffset;
*getOffset = *Swordc::TreeKey_getOffset;
*setPosition = *Swordc::TreeKey_setPosition;
*Traversable = *Swordc::TreeKey_Traversable;
*Index = *Swordc::TreeKey_Index;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::TreeKeyIdx ##############

package Sword::TreeKeyIdx;
@ISA = qw( Sword Sword::TreeKey );
%OWNER = ();
%ITERATORS = ();
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_TreeKeyIdx($self);
        delete $OWNER{$self};
    }
}

*save = *Swordc::TreeKeyIdx_save;
*copyFrom = *Swordc::TreeKeyIdx_copyFrom;
*_compare = *Swordc::TreeKeyIdx__compare;
*create = *Swordc::TreeKeyIdx_create;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::LocaleMgr ##############

package Sword::LocaleMgr;
@ISA = qw( Sword );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_LocaleMgr(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::LocaleMgr", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_LocaleMgr($self);
        delete $OWNER{$self};
    }
}

*getLocale = *Swordc::LocaleMgr_getLocale;
*getAvailableLocales = *Swordc::LocaleMgr_getAvailableLocales;
*getDefaultLocaleName = *Swordc::LocaleMgr_getDefaultLocaleName;
*setDefaultLocaleName = *Swordc::LocaleMgr_setDefaultLocaleName;
sub getSystemLocaleMgr {
    my @args = @_;
    my $result = Swordc::LocaleMgr_getSystemLocaleMgr(@args);
    return undef if (!defined($result));
    my %resulthash;
    tie %resulthash, ref($result), $result;
    return bless \%resulthash, ref($result);
}
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::SWFilterMgr ##############

package Sword::SWFilterMgr;
@ISA = qw( Sword );
%OWNER = ();
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::SWText ##############

package Sword::SWText;
@ISA = qw( Sword Sword::SWModule );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_SWText(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::SWText", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_SWText($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::RawText ##############

package Sword::RawText;
@ISA = qw( Sword Sword::SWText );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_RawText(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::RawText", $self;
    return bless \%retval, $pkg;
}

*createModule = *Swordc::RawText_createModule;
sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_RawText($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::zText ##############

package Sword::zText;
@ISA = qw( Sword Sword::SWText );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_zText(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::zText", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_zText($self);
        delete $OWNER{$self};
    }
}

*createModule = *Swordc::zText_createModule;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::SWCom ##############

package Sword::SWCom;
@ISA = qw( Sword Sword::SWModule );
%OWNER = ();
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::RawCom ##############

package Sword::RawCom;
@ISA = qw( Sword Sword::SWCom );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_RawCom(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::RawCom", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_RawCom($self);
        delete $OWNER{$self};
    }
}

*createModule = *Swordc::RawCom_createModule;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::zCom ##############

package Sword::zCom;
@ISA = qw( Sword Sword::SWCom );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_zCom(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::zCom", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_zCom($self);
        delete $OWNER{$self};
    }
}

*createModule = *Swordc::zCom_createModule;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::SWGenBook ##############

package Sword::SWGenBook;
@ISA = qw( Sword Sword::SWModule );
%OWNER = ();
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::RawGenBook ##############

package Sword::RawGenBook;
@ISA = qw( Sword Sword::SWGenBook );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_RawGenBook(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::RawGenBook", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_RawGenBook($self);
        delete $OWNER{$self};
    }
}

*createModule = *Swordc::RawGenBook_createModule;
sub getTreeKey {
    my @args = @_;
    my $result = Swordc::RawGenBook_getTreeKey(@args);
    return undef if (!defined($result));
    my %resulthash;
    tie %resulthash, ref($result), $result;
    return bless \%resulthash, ref($result);
}
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::SWLD ##############

package Sword::SWLD;
@ISA = qw( Sword Sword::SWModule );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_SWLD(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::SWLD", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_SWLD($self);
        delete $OWNER{$self};
    }
}

sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::RawLD ##############

package Sword::RawLD;
@ISA = qw( Sword Sword::SWLD );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_RawLD(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::RawLD", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_RawLD($self);
        delete $OWNER{$self};
    }
}

*createModule = *Swordc::RawLD_createModule;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::RawLD4 ##############

package Sword::RawLD4;
@ISA = qw( Sword Sword::SWLD );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_RawLD4(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::RawLD4", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_RawLD4($self);
        delete $OWNER{$self};
    }
}

*createModule = *Swordc::RawLD4_createModule;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::zLD ##############

package Sword::zLD;
@ISA = qw( Sword Sword::SWLD );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_zLD(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::zLD", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_zLD($self);
        delete $OWNER{$self};
    }
}

*createModule = *Swordc::zLD_createModule;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::SWCompress ##############

package Sword::SWCompress;
@ISA = qw( Sword );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_SWCompress(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::SWCompress", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_SWCompress($self);
        delete $OWNER{$self};
    }
}

*Buf = *Swordc::SWCompress_Buf;
*zBuf = *Swordc::SWCompress_zBuf;
*GetChars = *Swordc::SWCompress_GetChars;
*SendChars = *Swordc::SWCompress_SendChars;
*Encode = *Swordc::SWCompress_Encode;
*Decode = *Swordc::SWCompress_Decode;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::LZSSCompress ##############

package Sword::LZSSCompress;
@ISA = qw( Sword Sword::SWCompress );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_LZSSCompress(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::LZSSCompress", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_LZSSCompress($self);
        delete $OWNER{$self};
    }
}

*Encode = *Swordc::LZSSCompress_Encode;
*Decode = *Swordc::LZSSCompress_Decode;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::ZipCompress ##############

package Sword::ZipCompress;
@ISA = qw( Sword Sword::SWCompress );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_ZipCompress(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::ZipCompress", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_ZipCompress($self);
        delete $OWNER{$self};
    }
}

*Encode = *Swordc::ZipCompress_Encode;
*Decode = *Swordc::ZipCompress_Decode;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


############# Class : Sword::SWBuf ##############

package Sword::SWBuf;
@ISA = qw( Sword );
%OWNER = ();
%ITERATORS = ();
sub new {
    my $pkg = shift;
    my @args = @_;
    my $self = Swordc::new_SWBuf(@args);
    return undef if (!defined($self));
    $OWNER{$self} = 1;
    my %retval;
    tie %retval, "Sword::SWBuf", $self;
    return bless \%retval, $pkg;
}

sub DESTROY {
    return unless $_[0]->isa('HASH');
    my $self = tied(%{$_[0]});
    return unless defined $self;
    delete $ITERATORS{$self};
    if (exists $OWNER{$self}) {
        Swordc::delete_SWBuf($self);
        delete $OWNER{$self};
    }
}

*setFillByte = *Swordc::SWBuf_setFillByte;
*getFillByte = *Swordc::SWBuf_getFillByte;
*c_str = *Swordc::SWBuf_c_str;
*charAt = *Swordc::SWBuf_charAt;
*size = *Swordc::SWBuf_size;
*length = *Swordc::SWBuf_length;
*set = *Swordc::SWBuf_set;
*setSize = *Swordc::SWBuf_setSize;
*append = *Swordc::SWBuf_append;
*appendFormatted = *Swordc::SWBuf_appendFormatted;
*getRawData = *Swordc::SWBuf_getRawData;
*compare = *Swordc::SWBuf_compare;
sub DISOWN {
    my $self = shift;
    my $ptr = tied(%$self);
    delete $OWNER{$ptr};
    };

sub ACQUIRE {
    my $self = shift;
    my $ptr = tied(%$self);
    $OWNER{$ptr} = 1;
    };


# ------- VARIABLE STUBS --------

package Sword;

1;
