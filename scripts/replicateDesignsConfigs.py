# Copyright 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


import argparse
import os
from os import path

parser = argparse.ArgumentParser(
        description="update configuration of design(s) per given PDK")

parser.add_argument('--root', '-r', action='store', default='./',
                help="The root directory. assuming root/designs, root/scripts root/logs")

parser.add_argument('--pdkFrom', '-pf', action='store',
                help="The name of the PDK to copy from")

parser.add_argument('--from-std-cell-library', '-fscl', action='store',
                help="The name of the STD_CELL_LIBRARY to copy from")

parser.add_argument('--pdkTo', '-pt', action='store', required=True,
                help="The name of the PDK to copy to")

parser.add_argument('--to-std-cell-library', '-tscl', action='store', required=True,
                help="The name of the STD_CELL_LIBRARY to copy to")

parser.add_argument('--designs', '-d', nargs='+', default=[],
                help="designs to update")


args = parser.parse_args()
root = args.root
pdkFrom = args.pdkFrom
from_std_cell_library = args.from_std_cell_library
pdkTo = args.pdkTo
to_std_cell_library = args.to_std_cell_library

designs = list(dict.fromkeys(args.designs))

if pdkFrom is None:
    pdkFrom = "ThisFileDoesntExist"

if from_std_cell_library is None:
    from_std_cell_library = "ThisFileDoesntExist"


if len(designs) == 0:
    designs= [x  for x in os.listdir(root+'/designs/')]
    for i in designs:
        if os.path.isdir(root+'/designs/'+i) == False:
            designs.remove(i)

for design in designs:
    print("Replicating "+ design + " config...")
    configFileTo = str(root)+"designs/"+str(design)+"/"+str(pdkTo)+"_"+str(to_std_cell_library)+"_config.tcl"
    configFileFrom = str(root)+"designs/"+str(design)+"/"+str(pdkFrom)+"_"+str(from_std_cell_library)+"_config.tcl"
    if(path.exists(configFileFrom)):
        configFileFromOpener = open(configFileFrom, 'r')
        configFileFromData = configFileFromOpener.read()
        configFileFromOpener.close()

        configFileToOpener = open(configFileTo, 'w+')
        configFileToOpener.write(configFileFromData)
        configFileToOpener.close()
    else:
        configFileToOpener = open(configFileTo, 'w+')
        configFileToOpener.write("#init Configs")
        configFileToOpener.close()
