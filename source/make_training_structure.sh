#! /bin/bash

# this is a script for setup a basic training structure.

# There will be a root folder with child directories with created files:
#############################################################################################################################
#
# -[root_fld
#  |-[fld_scripts
#   |-[shell
#    |-<sample_shell_01.sh
#    |-<sample_shell_01.sh
#    |-<sample_shell_01.sh
#   |-[python
#    |-<sample_py_01.sh
#    |-<sample_py_01.sh
#    |-<sample_py_01.sh
#   |-[javascript
#    |-<sample_js_01.sh
#    |-<sample_js_01.sh
#    |-<sample_js_01.sh
#  |-[fld_texts
#   |-[pt_BR
#   |-[en_US
#  |-[fld_logs
#   |-[main_logs
#   |-[other_logs
#  |-[fld_miscelanious
#   |-[born_to_be_moved_01
#    |-[btbm_child_01_01
#    |-[btbm_child_01_02
#    |-[btbm_child_01_03
#    |-[btbm_child_01_04
#   |-[born_to_be_moved_02
#    |-[btbm_child_02_01
#    |-[btbm_child_02_02
#    |-[btbm_child_02_03
#    |-[btbm_child_02_04
#   |-[born_to_be_moved_03
#    |-[btbm_child_03_01
#    |-[btbm_child_03_02
#    |-[btbm_child_03_03
#    |-[btbm_child_03_04
#   |-[born_to_be_moved_04
#    |-[btbm_child_04_01
#    |-[btbm_child_04_02
#    |-[btbm_child_04_03
#    |-[btbm_child_04_04
#
#############################################################################################################################

# Check current folder:

self_kill()
{
SELF_KILL_PID=`ps -aux | grep make_training_structure| head -1|  awk '{print $2}'`
 for PID in $SELF_KILL_PID;
 do kill $PID
 done
}

is_dead()
 {

	CHK_DEAD=`ps -aux | grep make_training_structure|grep -v "grep"` ]
	if [ -z $CHK_DEAD ]; then
		echo ""
		echo "terminated successfully!"
		echo ""
	else 
		echo ""
		echo "script still running!"
		echo ""
	fi

 }
 
chk_root_fld()
{
	if [ ! -d $ROOT_FLD ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}

chk_fld_scripts()
{
	if [ ! -d $FLD_SCRIPTS ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}

chk_fld_texts()
{
	if [ ! -d $FLD_TEXTS ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}

chk_fld_logs()
{
	if [ ! -d $FLD_LOGS ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}

chk_python()
{
	if [ ! -d $PYTHON ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}
chk_jscript()
{
	if [ ! -d $JAVASCRIPT ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}
chk_shell()
{
	if [ ! -d $SHELL ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}
chk_mlogs()
{
	if [ ! -d $MAIN_LOGS ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}

chk_ologs()
{
	if [ ! -d $OTHER_LOGS ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}

chk_ptbr()
{
	if [ ! -d $PT_BR ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}
chk_enus()
{
	if [ ! -d $EN_US ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}
chk_misc()
{
	if [ ! -d $FLD_MISC ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}

chk_btbm_01()
{
	if [ ! -d $BTBM_01 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}
chk_btbm_02()
{
	if [ ! -d $BTBM_02]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}
chk_btbm_03()
{
	if [ ! -d $BTBM_03 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}

chk_btbmc0101()
{
	if [ ! -d $BTBMC0101 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}
chk_btbmc0102()
{
	if [ ! -d $BTBMC0102 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}

chk_btbmc0103()
{
	if [ ! -d $BTBMC0103 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}

chk_btbmc0104()
{
	if [ ! -d $BTBMC0104 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}



chk_btbmc0201()
{
	if [ ! -d $BTBMC0201 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}
chk_btbmc0202()
{
	if [ ! -d $BTBMC0202 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}

chk_btbmc0203()
{
	if [ ! -d $BTBMC0203 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}

chk_btbmc0204()
{
	if [ ! -d $BTBMC0204 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}


chk_btbmc0301()
{
	if [ ! -d $BTBMC0301 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}
chk_btbmc0302()
{
	if [ ! -d $BTBMC0302 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}

chk_btbmc0303()
{
	if [ ! -d $BTBMC0303 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}

chk_btbmc0304()
{
	if [ ! -d $BTBMC0304 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}

chk_btbmc0401()
{
	if [ ! -d $BTBMC0401 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}
chk_btbmc0402()
{
	if [ ! -d $BTBMC0402 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}

chk_btbmc0403()
{
	if [ ! -d $BTBMC0403 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}

chk_btbmc0404()
{
	if [ ! -d $BTBMC0404 ]; then
		FLDR_EXIST=1
	else
		FLDR_EXIST=0
	fi
}
echo ""
echo "Hello `whoami`, your current folder is `pwd`"
echo "Now the script will verify if there is any trace of training folder and file structure already setup".
echo "Wait..."
echo ""

ROOT_FLD="~/root_fld/"
FLD_SCRIPTS="~/root_fld/fld_scripts/"
SHELL="~/root_fld/fld_scripts/shell/"
PYTHON="~/root_fld/fld_scripts/python/"
JAVASCRIPT="~/root_fld/fld_scripts/javascript/"
FLD_TEXTS="~/root_fld/fld_texts/"
PT_BR="~/root_fld/fld_texts/pt_br"
EN_US="~/root_fld/fld_texts/en_us"
FLD_LOGS="~/root_fld/fld_logs/"
MAIN_LOGS="~/root_fld/fld_logs/main_logs/"
OTHER_LOGS="~/root_fld/fld_logs/other_logs/"
FLD_MISC="~/root_fld/fld_misc/"
BTBM_01="~/root_fld/born_to_be_moved_01/"
BTBMC0101="~/root_fld/born_to_be_moved_01/btbm_child_01_01/"
BTBMC0102="~/root_fld/born_to_be_moved_01/btbm_child_01_02/"
BTBMC0103="~/root_fld/born_to_be_moved_01/btbm_child_01_03/"
BTBMC0104="~/root_fld/born_to_be_moved_01/btbm_child_01_04/"
BTBM_02="~/root_fld/born_to_be_moved_02/"
BTBMC0201="~/root_fld/born_to_be_moved_02/btbm_child_02_01/"
BTBMC0202="~/root_fld/born_to_be_moved_02/btbm_child_02_02/"
BTBMC0203="~/root_fld/born_to_be_moved_02/btbm_child_02_03/"
BTBMC0204="~/root_fld/born_to_be_moved_02/btbm_child_02_04/"
BTBM_03="~/root_fld/born_to_be_moved_03/"
BTBMC0301="~/root_fld/born_to_be_moved_03/btbm_child_03_01/"
BTBMC0302="~/root_fld/born_to_be_moved_03/btbm_child_03_02/"
BTBMC0303="~/root_fld/born_to_be_moved_03/btbm_child_03_03/"
BTBMC0304="~/root_fld/born_to_be_moved_03/btbm_child_03_04/"
BTBM_04="~/root_fld/born_to_be_moved_04/"
BTBMC0401="~/root_fld/born_to_be_moved_04/btbm_child_04_01/"
BTBMC0402="~/root_fld/born_to_be_moved_04/btbm_child_04_02/"
BTBMC0403="~/root_fld/born_to_be_moved_04/btbm_child_04_03/"
BTBMC0404="~/root_fld/born_to_be_moved_04/btbm_child_04_04/"

ROOT_FLD_STATUS=$(chk_root_fld)
if [ "$ROOT_FLD_STATUS" = 0 ]; then

		echo ""
		echo $ROOT_FLD " doesn't exists yet and will be created now..."
		mkdir -p $ROOT_FLD
		echo ""
	else
		echo ""
		echo $ROOT_FLD" already exists!"
		echo ""
	fi

FLD_SCRIPTS_STATUS=$(chk_root_fld)
if [ "$FLD_SCRIPTS_STATUS" = 0 ]; then

		echo ""
		echo $FLD_SCRIPTS " doesn't exists yet and will be created now..."
		mkdir -p $FLD_SCRIPTS
		echo ""
	else
		echo ""
		echo $FLD_SCRIPTS" already exists!"
		echo ""
	fi

# Call functions

	self_kill
	is_dead

exit=0
