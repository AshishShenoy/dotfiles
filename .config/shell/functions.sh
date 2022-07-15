##########################
#   Security functions   #
##########################
function md5checksum () {
	if [[ "$(md5sum $1 | awk '{print $1}')" == "$2" ]]; then
		echo "Checksum matches!"
	else
		echo "Checksum does not match!"
	fi
}

function sha1checksum () {
	if [[ "$(sha1sum $1 | awk '{print $1}')" == "$2" ]]; then
		echo "Checksum matches!"
	else
		echo "Checksum does not match!"
	fi
}

#############################
#   Convenience Functions   #
#############################
function open () {
	nohup xdg-open $1 &>/dev/null &
}

function take () {
	mkdir -p $@ && cd ${@:$#}
}

# Returns current power consumption in watts
function check-power () {
	echo - | awk "{printf \"%.1f\", \
	$(( \
		$(cat /sys/class/power_supply/BAT1/current_now) * \
		$(cat /sys/class/power_supply/BAT1/voltage_now) \
	)) / 1000000000000 }" ; echo " W "
}

# CLI wrapper for ix.io, an online text hosting platform
# Reads data from argument, or from stdin
function ix() {
	curl=$(command -v curl)
	[ -f "$HOME/.netrc" ] && curl="${curl} --netrc"

	while getopts ":d:i:n:e:" opt; do
		case "${opt}" in
			d) ${curl} --request DELETE "ix.io/${OPTARG}"; return;;
			i) curl="${curl} --request PUT"; id="${OPTARG}";;
			n) curl="${curl} --form read:1=${OPTARG}";;
			e) curl="${curl} --form ext:1=${OPTARG}";;
			:) error "Expected argument: -${OPTARG}"; return 1;;
			*) echo 'Usage: ix [-d ID] [-i ID] [-n N] [<options>]';
				return;;
		esac
	done
	shift $((OPTIND - 1))
	unset -v OPTIND OPTERR

	if [ -t 0 ]; then
		filename="$1"; shift
		if [ "$filename" ]; then
			${curl} --form f:1=@"$filename" "${@}" "ix.io/${id}"
			return
		fi
		echo "^C to cancel, ^D to send."
	fi

	${curl} --form f:1='<-' "${@}" "ix.io/${id}"

	unset -v curl opt id filename
}

