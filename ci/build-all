#!/bin/sh

readonly CWD=$(pwd)
readonly PROGNAME="${0}"

usage()
{
    echo -e "\nUsage: $PROGNAME <build-dir> <template> \n \
    <build-dir>: specifies the build directory location (required) \n \
    <template>: template bblayers.conf to use"
}

main () {
	local BUILD_DIR=${1}
	local LAYER="unknown"
	local TARGETS="unknown"
	local CONFIG=${2}
	local IMAGE=core-image-minimal

	case ${2} in
		"gui" )
			IMAGE=fsl-image-multimedia-full
			LAYER="meta-tq-distro-fsl"
			;;
		"minimal" )
			IMAGE=core-image-minimal
			LAYER="meta-tq"
			;;
		* )
			usage
			exit 1
			break
			;;
	esac

	TARGETS=$(ls sources/${LAYER}/conf/machine/*.conf | sed s/\.conf//g | xargs -n1 basename)
	echo $TARGETS
	echo "TARGETS=$TARGETS" > $CONFIG.prop

	for t in $TARGETS; do
		export MACHINE=$t && source ./setup-environment ${BUILDDIR} ${CONFIG}
		export MACHINE=$t
		bitbake ${IMAGE}
	done

}

main ${@}
