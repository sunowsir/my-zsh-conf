#!/bin/bash

SHELLOld="${SHELL}"
WorkDir="${HOME}/.zsh"
WorkDirOld=".zsh.old"
ZshConf="${HOME}/.zshrc"
ZshConfOld=".zshrc.old"
AntigenFile="${WorkDir}/antigen.zsh"

JumpToHome="cd ${HOME}"
ChangeShellToZsh="chsh -s /bin/zsh"
ChangeShellToOldShell="chsh -s ${SHELLOld}"
InstallNeedPackage="sudo apt-get install -y git curl zsh"
DownloadAntigen="curl -L git.io/antigen > ${AntigenFile}"
DownloadZshConf="curl -L https://raw.githubusercontent.com/sunowsir/my-zsh-conf/master/.zshrc > ${ZshConf}"

DAGitee="curl -L https://gitee.com/kimzh/antigen/raw/master/bin/antigen.zsh > ${AntigenFile}"
DZGitee="curl -L https://gitee.com/sunowsir/my-zsh-conf/raw/master/.zshrc > ${ZshConf}"

function ExeVIPCmd() {
	eval "${1}"

	if [[ ${?} -ne 0 ]];
	then
		exit ${?}
	fi

	return 0
}

function DetectionUrl() {
	echo "Probe \`raw.githubusercontent.com\` connection status."
	eval "ping -c 3 -w 5 raw.githubusercontent.com"

	if [[ ${?} -ne 0 ]];
	then
		DownloadAntigen="${DAGitee}"
		DownloadZshConf="${DZGitee}"
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
	DetectionUrl

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

eval "${JumpToHome}"
Main "${@}"
exit ${?}
