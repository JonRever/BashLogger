# shellcheck shell=bash

logpath="$1"
mark="$2"
LogLevel="$3"

if [ -z "$logpath" ]
then
    echo "Error: logpath is not set"
    return 1
fi

if [ -z "$mark" ]
then
    echo "Error: mark is not set"
    return 1
fi

if [ ! -d "$(dirname "$logpath")" ]
then
    echo "Error: directory $(dirname "$logpath") does not exist"
    return 1
fi

if [ ! -f "$logpath" ]
then
    touch "$logpath"
fi

Log()
{
	local timemark
	local severity   # Severity level of the current message (ERROR, WARNING, INFO, DEBUG)
	local text        # Text of the message # Send log to Telegram
    local severity
    local PrintLog

    timemark="$(date +'%d.%m.%Y %H:%M')"
    
	while [ -n "$1" ]
	do	
		case "$1" in
			-e)
				severity='ERROR'
				;;
			-w)
				severity='WARNING'
				;;
			-i)
				severity='INFO'
				;;
			-d)
				severity=DEBUG
				;;
			--print)
				PrintLog=1
				;;
			--silent)
				PrintLog=0
				;;
			*)
				text="$1"
				;;
		esac
		shift
	done
	
	# Output to stderr for ERROR, WARNING, INFO

	# Logging to file according to LogLevel level (RFC 5424)
	# severity = severity level of the current message
	# LogLevel = configured minimum logging level from config
	
	case "$severity" in
		"DEBUG")
			# DEBUG is logged only when LogLevel=DEBUG
			case "$LogLevel" in
				"DEBUG")
					echo "${timemark} ${mark} ${severity}: ${text}" >> "$logpath"
					;;
			esac
			;;
		"INFO")
			# INFO is logged when LogLevel=DEBUG or INFO
			case "$LogLevel" in
				"DEBUG"|"INFO")
					echo "${timemark} ${mark} ${severity}: ${text}" >> "$logpath"
					;;
			esac
			;;
		"WARNING")
			# WARNING is logged when LogLevel=DEBUG, INFO or WARNING
			case "$LogLevel" in
				"DEBUG"|"INFO"|"WARNING")
					echo "${timemark} ${mark} ${severity}: ${text}" >> "$logpath"
					;;
			esac
			;;
		"ERROR")
			# ERROR is logged when any LogLevel
			case "$LogLevel" in
				"DEBUG"|"INFO"|"WARNING"|"ERROR")
					echo "${timemark} ${mark} ${severity}: ${text}" >> "$logpath"
					;;
			esac
			;;
	esac

    if [ "$PrintLog" == "1" ]
    then
        echo ":::${text}"
    fi
}