#!/bin/bash

SHELLOld="${SHELL}"
WorkDir="${HOME}/.zsh"
WorkDirOld="${HOME}/.zsh.old"
ZshConf="${HOME}/.zshrc"
ZshConfOld="${HOME}/.zshrc.old"
AntigenFile="${WorkDir}/antigen.zsh"

DetectionUrl="ping -c 3 -w 5 raw.githubusercontent.com"
JumpToHome="cd ${HOME}"
ChangeShellToZsh="chsh -s /bin/zsh"
ChangeShellToOldShell="chsh -s ${SHELLOld}"
InstallNeedPackage="sudo apt-get install -y git curl zsh"
DownloadAntigen="curl -L git.io/antigen > ${AntigenFile}"
DownloadZshConf="curl -L https://raw.githubusercontent.com/sunowsir/my-zsh-conf/master/.zshrc > ${ZshConf}"

function ExeVIPCmd() {
	local cmd="${1}"

	if [[ $(eval "${cmd}") -ne 0 ]];
	then
		exit ${?}
	fi

	return 0
}

function CreateWorkDir() {
	if [[ -d "${WorkDir}" ]]; 
	then
		mv -f "${WorkDir}" "${WorkDirOld}"
	fi
	if [[ -f ${ZshConf} ]];
	then
		mv -f "${ZshConf}" "${ZshConfOld}"
	fi
	mkdir "${WorkDir}"
}

function Install() {
	ExeVIPCmd "${InstallNeedPackage}"
	ExeVIPCmd "${ChangeShellToZsh}"
	CreateWorkDir
	ExeVIPCmd "${DownloadAntigen}"
	ExeVIPCmd "${DownloadZshConf}"
	echo "Install Success! Please restart this Terminal or source ${ZshConf}."
	return ${?}
}

function Uninstall() {
	ExeVIPCmd "${ChangeShellToOldShell}"
	if [[ -d "${WorkDirOld}" ]]; 
	then
		rm -rf "${WorkDir}"
		mv -f "${WorkDirOld}" "${WorkDir}"
	fi
	if [[ -f "${ZshConfOld}" ]];
	then
		rm -rf "${ZshConf}"
		mv -f "${ZshConfOld}" "${ZshConf}" 
	fi
}

function Usage() {
	echo "Usage : bash ./setup.sh [--install | --uninstall]"
	echo "  --install : install the configuration."
	echo "  --uninstall : Uninstall the configuration."
}

function Main() {
	
	if [[ $(eval "${DetectionUrl}") -ne 0 ]];
	then
		echo -e "\033[1;31mERROR\033[0m : Unable to connect to: raw.githubusercontent.com"
		return ${?}
	fi

	eval "${JumpToHome}"

	case ${1} in 
		"--install")
			Install
		;;
		"--uninstall")
			Uninstall
		;;
		*)
			Usage
		;;
	esac

	return ${?}
}

Main "${@}"
return ${?}
