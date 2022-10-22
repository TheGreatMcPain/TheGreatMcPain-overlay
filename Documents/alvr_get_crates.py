#!/usr/bin/env python3
# This script is used to generate the CRATES environment varibale
# for the media-libs/alvr ebuild.
import os
import subprocess as sp

def main():
    if get_git_url() != "https://github.com/alvr-org/ALVR.git":
        print("This script must be ran inside ALVR repository.")
        exit(1)

    generate_ebuilds(list_toml_files("./alvr/"))

    ebuild_list = []

    for file in os.listdir("."):
        if file.endswith(".ebuild"):
            ebuild_list.append(file)

    list_of_crate_lists = []

    for ebuild in ebuild_list:
        ebuild_string = read_cargo_ebuild(ebuild)
        list_of_crate_lists.append(get_crate_list(ebuild_string))

    print(make_ebuild_crate_env(combine_crate_lists(list_of_crate_lists)))

    for file in os.listdir("."):
        if file.endswith(".ebuild"):
            os.remove(file)

    return 0

def get_git_url() -> str:
    p = sp.Popen(["git", "remote", "get-url", "origin"], stdout=sp.PIPE)

    if not p.stdout:
        return ""

    output_string = p.stdout.read()

    return output_string.decode().strip()

def list_toml_files(directory : str) -> list:
    toml_list = []

    for root, _, files in os.walk(directory):
        for f in files:
            if f.endswith(".toml"):
                toml_list.append(os.path.realpath(os.path.join(root, f)))

    return toml_list

def generate_ebuilds(toml_list : list):
    cargo_ebuild_cmd = [
        "cargo",
        "ebuild",
        "--noaudit",
        "--manifest-path",
    ]

    for toml in toml_list:
        p = sp.Popen(cargo_ebuild_cmd + [toml])
        p.communicate()

def read_cargo_ebuild(filename : str) -> str:
    ebuild_string = ""

    with open(filename, "r") as f:
        ebuild_string = f.read()

    return ebuild_string

def get_crate_list(ebuild_string : str) -> list:

    starting_point = ebuild_string.find("CRATES=\"") + len("CRATES=\"")

    ending_point = starting_point

    while ebuild_string[ending_point] != "\"":
        ending_point += 1

    crate_string = ebuild_string[starting_point:ending_point]

    crate_list = []

    for crate in crate_string.split("\n"):
        if len(crate.strip()) > 0:
            crate_list.append(crate.strip())

    return crate_list

def combine_crate_lists(list_of_crate_lists: list) -> set:
    crate_set = set()

    for crate_list in list_of_crate_lists:
        for crate in crate_list:
            crate_set.add(crate)

    return crate_set

def make_ebuild_crate_env(crate_set : set) -> str:
    crate_env = "CRATES=\"\n"

    for x in crate_set:
        crate_env += "\t" + x + "\n"

    return crate_env + "\""

if __name__ == "__main__":
    main()
