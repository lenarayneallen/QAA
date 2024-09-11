#!/usr/bin/env python
import argparse
def get_args():
    parser = argparse.ArgumentParser(description = "")
    parser.add_argument("-f", "--file", required=True, type=str)
    return parser.parse_args()

args = get_args()
file = str(args.file)


with open(file, "r") as fh:
    #initialize counters
    mapped_count = 0
    unmapped_count = 0
    #for line in file 
    for line in fh:
        #if the line is not a header line
        if not line.startswith("@"):
            #strip lines and split lines
            line = line.strip("\n")
            line = line.split()
            #extract bitwise flag
            flag = int(line[1])
            #if flag is mapped
            if((flag & 4) != 4):
                mapped = True
                #if flag is not a secondary alignment 
                if((flag & 256) != 256):
                    #increment mapped counter
                    mapped_count += 1
            #else if flag is not mapped
            else:
                #if flag is not a secondary alignment
                if((flag & 256) != 256):
                    #increment unmapped counter
                    unmapped_count += 1
                    
print(f"mapped count: {mapped_count}")
print(f"unmapped count: {unmapped_count}")