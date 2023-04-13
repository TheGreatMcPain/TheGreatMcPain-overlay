#!/usr/bin/env python3
#
# Script used to update games-arcade/osu-lazer ebuild
#
# Usage: Just run while inside liquorix-sources ebuild directory.
#
import urllib.request
import json
import os
import shutil


def main():
    # Grab version information for ebuilds and upstream
    tags = get_github_repo_tags("ppy", "osu")
    ebuilds = get_ebuilds("./")
    ebuild_tags = get_pv_from_ebuilds(ebuilds, "osu-lazer")

    latest_ebuild = max(ebuilds)
    latest_tag = max(tags)

    print("Latest tag from upstream:", latest_tag)
    print("Latest tag from ebuilds:", max(ebuild_tags))

    # Exit if there are no updates
    if latest_tag > max(ebuild_tags):
        print("Upstream is newer!")
    else:
        print("Nothing new! Exiting...")
        return 0

    new_ebuild = latest_ebuild.replace(
        get_pv_from_ebuild(latest_ebuild, "osu-lazer"), latest_tag[0:]
    )

    option = input(
        "Will create {} from {}. Continue? (y or n): ".format(new_ebuild, latest_ebuild)
    )
    while option.lower() not in ("y", "n"):
        option = input("Invalid input! (y or n): ")

    if option.lower() == "n":
        print("User said no. Exiting...")
        return 0

    print("Creating {}...".format(new_ebuild))
    print()
    shutil.copy2(latest_ebuild, new_ebuild)

    print("Running 'pkgdev manifest -f'")
    os.system("pkgdev manifest -f")

    print("Done!")


def get_pv_from_ebuilds(ebuilds: list, pn: str) -> list:
    pv_list = []

    for ebuild in ebuilds:
        if "9999" in get_pv_from_ebuild(ebuild, pn):
            continue
        pv_list.append(get_pv_from_ebuild(ebuild, pn))

    return pv_list


def get_pv_from_ebuild(ebuild: str, pn: str) -> str:
    pv = ebuild.split(pn)[-1][1:]
    pv = pv.split(".ebuild")[0]

    return pv


def get_tag_from_ebuild(ebuild: str) -> str:
    ebuild_text = None
    with open(ebuild, "r") as f:
        ebuild_text = f.read()

    if not ebuild_text:
        return ""

    tag_start = ebuild_text.find("GIT_COMMIT")
    tag_start = ebuild_text.find('"', tag_start) + 1
    tag_end = ebuild_text.find('"', tag_start)

    return ebuild_text[tag_start:tag_end]


def get_ebuilds(path: str) -> list:
    ebuild_list = []

    for f in os.listdir(path):
        # Exclude live ebuilds
        if "9999" in f:
            continue
        if os.path.splitext(f)[1] == ".ebuild":
            ebuild_list.append(f)

    return ebuild_list


def get_github_repo_tags(repo_owner: str, repo_name: str) -> list:
    url = "https://api.github.com/repos/{}/{}/releases?per_page=100".format(
        repo_owner, repo_name
    )
    req = urllib.request.Request(url)
    data = None

    with urllib.request.urlopen(req) as resp:
        data = json.load(resp)

    if not data:
        return []

    # for x in data:
    #     tag_list.append(x["name"])
    tag_list = [x["tag_name"] for x in data]

    # Strip any version tags starting with 'v'
    for index in range(0, len(tag_list)):
        tag = tag_list[index]

        if "v" in tag:
            tag = tag[1:]
        tag_list[index] = tag

    tag_list.sort()

    return tag_list


if __name__ == "__main__":
    main()
