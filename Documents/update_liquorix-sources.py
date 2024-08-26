#!/usr/bin/env python3
#
# Script used to update sys-kernel/liquorix-sources ebuild
#
# Usage: Just run while inside liquorix-sources ebuild directory.
#
import urllib.request
import json
import os


def main():
    # Grab version information for ebuilds and upstream
    tags = get_github_repo_tags("damentz", "liquorix-package")
    ebuilds = get_ebuilds("./")
    ebuild_tags = get_tags_from_ebuilds(ebuilds)

    latest_ebuild = max(ebuilds)
    latest_tag = get_max_tag(tags)

    print("Latest tag from upstream:", latest_tag)
    print("Latest tag from ebuilds:", get_max_tag(ebuild_tags))

    # Exit if there are no updates
    if is_tag_greater(latest_tag, get_max_tag(ebuild_tags)):
        print("Upstream is newer!")
    else:
        print("Nothing new! Exiting...")
        return 0

    # Grab liquorix patch filename, and use it to create the new ebuild's filename.
    filelist = get_github_repo_filelist(
        "damentz", "liquorix-package", "linux-liquorix/debian/patches/zen", latest_tag
    )
    patch_file = None
    for f in filelist:
        if "-lqx" in f:
            patch_file = f
            break

    if not patch_file:
        return 1

    # Convert '.patch' filename to ebuild version.
    new_ebuild_pv = os.path.splitext(patch_file)[0]
    new_ebuild_pv = new_ebuild_pv.replace("-lqx", "_p")[1:]

    new_ebuild = latest_ebuild.replace(get_pv_from_ebuild(latest_ebuild), new_ebuild_pv)

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
    if update_liquorix_ebuild(latest_ebuild, new_ebuild, latest_tag) != 0:
        print("Something went wrong!")
        return 1

    print("Running 'pkgdev manifest'")
    os.system("pkgdev manifest -f")
    print("Done!")
    print("You may need to test ebuild before commiting.")


def update_liquorix_ebuild(src_ebuild: str, dst_ebuild: str, new_tag: str) -> int:
    src_text = None

    with open(src_ebuild, "r") as f:
        src_text = f.read()

    if not src_text:
        return 1

    src_tag = get_tag_from_ebuild(src_ebuild)

    with open(dst_ebuild, "w") as f:
        f.write(src_text.replace(src_tag, new_tag))

    return 0


def get_pv_from_ebuild(ebuild: str) -> str:
    pv = ebuild.split("-")[-1]
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


def get_tags_from_ebuilds(ebuilds: list) -> list:
    tag_list = []

    for ebuild in ebuilds:
        tag_list.append(get_tag_from_ebuild(ebuild))

    return tag_list


def get_ebuilds(path: str) -> list:
    ebuild_list = []

    for f in os.listdir(path):
        if os.path.splitext(f)[1] == ".ebuild":
            ebuild_list.append(f)

    return ebuild_list


def get_github_repo_tags(repo_owner: str, repo_name: str) -> list:
    url = "https://api.github.com/repos/{}/{}/tags".format(repo_owner, repo_name)
    req = urllib.request.Request(url)
    data = None

    with urllib.request.urlopen(req) as resp:
        data = json.load(resp)

    if not data:
        return []

    # for x in data:
    #     tag_list.append(x["name"])
    tag_list = [x["name"] for x in data]

    return tag_list


def get_github_repo_filelist(
    repo_owner: str, repo_name: str, path: str, ref: str
) -> list:
    url = "https://api.github.com/repos/{}/{}/contents/{}?ref={}".format(
        repo_owner, repo_name, path, ref
    )
    req = urllib.request.Request(url)
    data = None

    with urllib.request.urlopen(req) as resp:
        data = json.load(resp)

    if not data:
        return []

    file_list = [x["name"] for x in data]

    return file_list


def format_tags(tag: str):
    base = tag.split("-")[0]
    nums = base.split(".")

    strings = []
    for num in nums:
        strings.append("{0:0=2d}".format(int(num)))

    return ".".join(strings) + "-" + tag.split("-")[1]


def is_tag_greater(tag1: str, tag2: str) -> bool:
    tag1_formatted = format_tags(tag1)
    tag2_formatted = format_tags(tag2)

    tag1_base = tag1_formatted.split("-")[0]
    tag2_base = tag2_formatted.split("-")[0]

    if float(tag1_base) > float(tag2_base):
        return True

    if float(tag1_base) < float(tag2_base):
        return False

    tag1_revision = tag1_formatted.split("-")[1]
    tag2_revision = tag2_formatted.split("-")[1]

    if int(tag1_revision) > int(tag2_revision):
        return True

    if int(tag1_revision) < int(tag2_revision):
        return False

    return False


# The format of liquorix-package's tags isn't compatible with Python's
# built-in sort functions.
def get_max_tag(tags: list) -> str:
    maxtag = "0.0-1"

    for tag in tags:
        if is_tag_greater(tag, maxtag):
            maxtag = tag

    return maxtag


if __name__ == "__main__":
    main()
