#!/usr/bin/env bash

install() {
    echo "--- Install ---"
    # https://stackoverflow.com/questions/35006457/choosing-between-0-and-bash-source
    local devenvbase="$(cd $(dirname ${BASH_SOURCE}) && pwd)"
    local dotfiles="${devenvbase}/dotfiles/*"
    local bin="${devenvbase}/bin"

    local backupdir="${HOME}/devenv_bak"
    mkdir -p "${backupdir}"

    # === dotfiles ===
    GLOBIGNORE=".:.."
    local file
    for file in ${dotfiles} ${bin}; do
	[[ -f "${file}" || -d "${file}" ]] || continue

	local homefile="${HOME}/$(basename ${file})"
	echo "homefile: ${homefile}"

	# contine if installed ( symlinked )
	[[ -L "${homefile}" ]] && continue

	# backup if exists
	if [[ -f "${homefile}" || -d "${homefile}" ]]; then
	    echo "  BACKUP:  ${homefile}"
	    echo "   mv" "${homefile}" "${backupdir}/"
	    mv "${homefile}" "${backupdir}/"
	fi

	#install 
	echo "  INSTALL: ${homefile}"
	echo "   ln -s" "${file}" "${homefile})"
	ln -s "${file}" "${homefile}"
    done

    source ${HOME}/.bash_profile
}

usage() {
    cat <<EOF

SYNOPSIS
   devenv [OPTIONS]

OPTIONS
   -i|--install   Install devenv
   -h|--help      Help
EOF
}

while [ "${1}" != "" ]; do
    case $1 in
	-h | --help)
	    usage
	    ;;
	-i | --install)
	    install
	    ;;
	*)
	    ;;
    esac
    shift
done

unset install
unset usage
