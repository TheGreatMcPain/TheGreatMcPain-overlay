#!/usr/bin/python3
"""
Create EGO_SUM from go.sum file.

Usage: ./gosum_ebuild.py <go.sum>

<go.sum> : Can be a regular file, or a http(s) url.

The resulting EGO_SUM will be written to stdout which can be
piped to a file, or to another program (such as xclip).

Example usage: Send EGO_SUM to clibboard.

$ ./gosum_ebuild.py go.sum | xclip -selection clipboard
"""
import sys
import requests


def main():
    if (len(sys.argv) == 1):
        print("Usage:", sys.argv[0], "<go.sum>")
        sys.exit(1)

    egoSum = createEgoSum(fileToList(sys.argv[1]))

    print("Writing EGO_SUM to stdout.\n", file=sys.stderr)
    print(egoSum)


def createEgoSum(goSumLines: list):
    go_sum = []
    ego_sum = "EGO_SUM=(\n"

    for line in goSumLines:
        goLine = '"' + line.split(' ')[:-1][0] + ' '
        goLine += line.split(' ')[:-1][1] + '"'
        go_sum.append(goLine)

    for goDep in go_sum:
        ego_sum += "\t" + goDep + "\n"
    ego_sum += ")\n"

    return ego_sum


def fileToList(filename: str):
    if "https://" in filename or "http://" in filename:
        text = requests.get(filename).text
        return text.split('\n')[:-1]
    else:
        fileList = []
        with open(filename, "r") as f:
            for line in f.readlines():
                fileList.append(line.rstrip())
        return fileList


if __name__ == "__main__":
    main()
