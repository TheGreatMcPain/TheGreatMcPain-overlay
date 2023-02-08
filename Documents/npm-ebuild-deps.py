#!/usr/bin/env python
# Prints a sources list from a nodejs project's package-lock.json.
# Mainly used for my net-im/webcord ebuild.
#
# Usage: npm-ebuild-deps.py ./package-lock.json
import json
import sys


def main():
    packageUrls = getResolvedUrls(sys.argv[1], False)
    print(genSrcUriString(packageUrls, "webcord"))
    return 0


def getResolvedUrls(pkgLockJson: str, dev: bool):
    # Read json lock file
    lockdata = None
    with open(pkgLockJson, "r") as f:
        lockdata = json.load(f)

    if not lockdata:
        return []

    # Get just the packages dict() and remove root package.
    packages = lockdata["packages"]
    packages.pop("")

    # Create a list of urls based on the resolved key.
    resolvedUrls = []

    for package in packages:
        package = packages[package]
        print(package)
        if ("dev" in package) and (package["dev"]) and (dev == False):
            continue

        if package["resolved"]:
            resolvedUrls.append(package["resolved"])

    return resolvedUrls


def genSrcUriString(packageUrlList: list, PN: str):
    SRCURIString = 'NODE_MODULES_SRC_URI="'

    for packageUrl in packageUrlList:
        fileName = packageUrl[packageUrl.rfind("/") + 1 :]

        SRCURIString += "\n\t" + packageUrl + " -> " + PN + "-dep--" + fileName

    SRCURIString += '\n"'

    return SRCURIString


if __name__ == "__main__":
    main()
